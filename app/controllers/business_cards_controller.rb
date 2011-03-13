class BusinessCardsController < ApplicationController
  
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
      
      redirect_to dashboard_path
      
    else
      render :action => :new
    end
    
  end
  
  def edit
    
    @business_card = find_business_card_by_id
    
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
    
    @theme = Theme.find_by_slug :show_mask
    
    render :layout => 'business_card'
  end
  
  def select_theme
    
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
  
end
