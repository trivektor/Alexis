class BusinessCard < ActiveRecord::Base
  
  # associations
  belongs_to :user
  has_one :business_card_theme, :dependent => :destroy
  has_one :business_card_background, :dependent => :destroy
  has_one :business_card_information, :dependent => :destroy
  has_many :business_card_section_orders, :dependent => :destroy, :order => 'weight DESC'
  has_many :visitor_infos, :dependent => :destroy
  
  accepts_nested_attributes_for :business_card_information
  
  # validations
  validates_presence_of :url, :message => ' is required'
  validates_uniqueness_of :url, :message => ' is not available'
  validates_presence_of :title, :message => ' is required'
  
  def self.find_business_cards_by_user(user)
    BusinessCard.where(:user_id => user.id, :status => :active).order('created_at DESC').find(:all)
  end
  
  def as_json(args={})
    super(:methods => :formatted_created_at, :except => :date)
  end
  
  def formatted_created_at
    self.created_at.strftime("%b %d, %Y")
  end
    
end
