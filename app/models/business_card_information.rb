class BusinessCardInformation < ActiveRecord::Base
  
  belongs_to :business_card
  
  validates :email, :email => {:message => ' is not valid'}
  
end
