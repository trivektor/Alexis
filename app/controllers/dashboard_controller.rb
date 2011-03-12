class DashboardController < ApplicationController
  
  before_filter :require_user
  
  def index
    
    @business_cards = BusinessCard.find_business_cards_by_user current_user
    
  end
  
end
