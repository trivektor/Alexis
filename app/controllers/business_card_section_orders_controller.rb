class BusinessCardSectionOrdersController < ApplicationController
  
  before_filter :require_user
  before_filter :verify_ownership
  
  def update
    
    render :json => {:success => 1}
  end
  
  private
  
  def verify_ownership
    if !manipulatable?
      render :json => {:success => -1}
      return false
    end
    
    return true
  end
  
  def find_business_card_by_id
    BusinessCard.find(params[:business_card_id])
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
