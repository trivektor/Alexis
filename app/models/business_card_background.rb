class BusinessCardBackground < ActiveRecord::Base
  
  belongs_to :business_card
  
  def self.create_business_card_background(business_card)
    business_card.business_card_background = BusinessCardBackground.new
    business_card.business_card_background.save
  end
  
end
