class BusinessCardInformation < ActiveRecord::Base
  
  belongs_to :business_card
  
  #validates :email, :email => {:message => ' is not valid'}
  
  def self.create_business_card_information(business_card)
    business_card.business_card_information = BusinessCardInformation.new
    business_card.business_card_information.save
  end
  
end
