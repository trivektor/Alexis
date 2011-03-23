class DashboardController < ApplicationController
  
  before_filter :require_user
  
  def index
    
    @business_cards = current_user.business_cards
    
  end
  
end
