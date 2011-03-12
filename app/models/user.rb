class User < ActiveRecord::Base
  
  has_one :profile, :dependent => :destroy
  has_many :business_cards, :dependent => :destroy
  
  attr_accessor :first_name, :last_name
  
  validates_presence_of :first_name, :message => ' is required'
  validates_presence_of :last_name, :message => ' is required'
  validates :email, :email => {:message => ' is not valid'}
  validates_length_of :password, :minimum => 4, :maximum => 10, :message => ' is too short (must be between 4 and 10 characters)'
  
  acts_as_authentic do |config|
     config.crypto_provider = Authlogic::CryptoProviders::MD5
     config.validate_email_field = false
     config.validate_login_field = false
     config.validate_password_field = false
     config.login_field = :email
     config.validate_login_field = false
  end
  
end
