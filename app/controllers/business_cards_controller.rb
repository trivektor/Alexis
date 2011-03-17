class BusinessCardsController < ApplicationController
  
  #geocode_ip_address
  include GeoKit::Geocoders
  
  before_filter :require_user, :except => [:show]
  before_filter :verify_ownership, :except => [:show, :new, :create]
  
  def new
    @business_card = BusinessCard.new
  end
  
  def create
    
    @business_card = BusinessCard.new params[:business_card]
    @business_card.user_id = current_user.id
    
    if @business_card.save
      
      default_theme = Theme.get_default_theme
      
      @business_card.business_card_theme = BusinessCardTheme.new(:theme_id => default_theme.id)
      @business_card.business_card_theme.save
      
      @business_card.business_card_information = BusinessCardInformation.new(:business_card_id => @business_card.id)
      @business_card.business_card_information.save
      
      BusinessCardSectionOrder.create_section_order(@business_card)
      
      redirect_to dashboard_path
      
    else
      render :action => :new
    end
    
  end
  
  def edit
    
    @business_card = find_business_card_by_id
    
    @themes = Theme.where(:status => :active).find(:all)
    
    @section_order = @business_card.business_card_section_orders
    
  end
  
  def update
    
    @business_card = find_business_card_by_id
    
    if @business_card.update_attributes(params[:business_card])
      
      flash[:notice] = 'Your business card has been updated'
      redirect_to edit_business_card_path(@business_card)
      
    else
      render :action => :edit
    end
    
  end
  
  def show
    @business_card = BusinessCard.find_by_url params[:url]
    
    @section_order = @business_card.business_card_section_orders
    
    @theme = Theme.find_by_id @business_card.business_card_theme.theme_id
    
    @profile = Profile.find_by_user_id @business_card.user_id
    
    update_analytics(@business_card)
    
    render :layout => 'business_card'
    

    
    #TODO: handle cases where the card requested does not exist
  end
  
  def destroy
    business_card = BusinessCard.find(params[:id])
    business_card.destroy
    flash[:notice] = 'The card has been deleted'
    
    redirect_to dashboard_path
  end
  
  def select_theme
    if Theme.theme_applicable(params[:theme_id])
      business_card_theme = BusinessCardTheme.where(:business_card_id => params[:id]).first
      business_card_theme.update_attributes(:theme_id => params[:theme_id])
      render :json => {:success => 1}
    else
      render :json => {:success => -1}
    end
  end
  
  def stats
    business_card = BusinessCard.find(params[:id])
    visitor_infos = VisitorInfo.get_browser_stats_by_business_card(business_card)
    
    @total = visitor_infos.count
    
    @browser_stats = VisitorInfo.get_browser_stats(visitor_infos)
    
    @version_stats = VisitorInfo.get_browser_version_stats(visitor_infos)
    
    @country_stats = VisitorInfo.get_country_stats(visitor_infos)
  
  end
  
  private
  
  def verify_ownership
    if !manipulatable?
      redirect_to dashboard_path
      return false
    end
    
    return true
  end
  
  def find_business_card_by_id
    BusinessCard.find(params[:id])
  end
  
  def manipulatable?
    begin
      business_card = find_business_card_by_id
      business_card.user_id == current_user.id
    rescue
      false
    end
  end
  
  def update_analytics(business_card)
    if request.remote_addr == '127.0.0.1'
      geo_location = IpGeocoder.geocode('173.230.163.228')
    else 
      geo_location = IpGeocoder.geocode(request.remote_addr)
    end
    VisitorInfo.update_analytics(business_card, request, geo_location)
  end
  
end
