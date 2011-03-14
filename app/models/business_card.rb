class BusinessCard < ActiveRecord::Base
  
  # associations
  belongs_to :user
  has_one :business_card_theme, :dependent => :destroy
  has_one :business_card_information, :dependent => :destroy
  has_many :business_card_section_orders, :dependent => :destroy, :order => 'weight DESC'
  
  accepts_nested_attributes_for :business_card_information
  
  # validations
  validates_presence_of :url, :message => ' is required'
  validates_presence_of :title, :message => ' is required'
  
  def self.find_business_cards_by_user(user)
    BusinessCard.where(:user_id => user.id, :status => :active).find(:all)
  end
    
end
