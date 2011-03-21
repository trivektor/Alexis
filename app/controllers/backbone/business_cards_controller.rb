class Backbone::BusinessCardsController < ApplicationController
  
  #geocode_ip_address
  include GeoKit::Geocoders
  
  #before_filter :require_user, :except => [:show]
  #before_filter :verify_ownership, :except => [:show, :new, :create]
  
  def index
    render :json => BusinessCard.order("created_at DESC").all
  end
  
  def new
    @business_card = BusinessCard.new
  end
  
  def create
    
    @business_card = BusinessCard.new params[:business_card]
    @business_card.user_id = current_user.id
    
    if @business_card.save
      
      BusinessCardTheme.create_business_card_theme(@business_card)
      
      BusinessCardInformation.create_business_card_information(@business_card)
      
      BusinessCardBackground.create_business_card_background(@business_card)
      
      BusinessCardSectionOrder.create_section_order(@business_card)
      
      #render :json{:success => 1} => @business_card 
      render :json => {:success => 1}
      
    else
      errors = {:errors => @business_card.errors, :success => -1}
      render :json => errors
    end
    
  end
  
  def edit
    
    if request.put?
      update
      return
    end
    
    @business_card = find_business_card_by_id
    
    return unless !@business_card.nil?
    
    @themes = Theme.where(:status => :active).find(:all)
    
    @background_colors = BackgroundColor.where(:status => :active).find(:all)
    
    @section_order = @business_card.business_card_section_orders
    
    render :json => @business_card.to_json(:include => :business_card_information)
    
  end
  
  def update
    
    @business_card = find_business_card_by_id
    
    if @business_card.update_attributes(params[:business_card])
      render :json => @business_card.to_json(:include => :business_card_information)
    else
      render :json => {:errors => @business_card.errors, :success => -1}
    end
    
  end
  
  def show
    
    if request.get?
      edit
      return
    end
    
    @business_card = BusinessCard.find_by_url params[:url]
    
    @section_order = @business_card.business_card_section_orders
    
    @theme = Theme.find_by_id @business_card.business_card_theme.theme_id
    
    @profile = Profile.find_by_user_id @business_card.user_id
    
    update_analytics(@business_card)
    
    render :layout => 'business_card'
    
    #TODO: handle cases where the card requested does not exist
  end
  
  def delete
    destroy
  end
  
  def destroy
    business_card = BusinessCard.find(params[:id])
    business_card.destroy
    render :json => {:success => 1}
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
  
  def set_background_color
    
    background = BusinessCardBackground.where(:business_card_id => params[:id]).first
    
    background.update_attributes(:background_color => params[:background_color], :which => :color)
    
    render :json => {:success => 1}
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
    begin
      BusinessCard.find(params[:id])
    rescue
      render :json => {:success => -1, :errors => {:details => 'No such card exists'}}
      nil
    end
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
      geo_location = IpGeocoder.geocode(request.remote_ip)
    end
    VisitorInfo.update_analytics(business_card, request, geo_location)
  end
  
end
