class BusinessCardSectionOrdersController < ApplicationController
  
  before_filter :require_user
  before_filter :verify_ownership
  
  def update
    
    sections = params[:section]
    
    weight = sections.count
    
    for id in sections
      section = BusinessCardSectionOrder.where(:business_card_id => params[:business_card_id], :id => id).first
      section.update_attributes(:weight => weight)
      weight -= 1
    end
    
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
