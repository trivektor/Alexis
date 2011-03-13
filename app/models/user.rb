class User < ActiveRecord::Base
  
  has_one :profile, :dependent => :destroy
  has_many :business_cards, :dependent => :destroy
  
  attr_accessor :first_name, :last_name
  
  validates_presence_of :first_name, :message => ' is required'
  validates_presence_of :last_name, :message => ' is required'
  validates_length_of :username, :minimum => 4, :message => ' is too short (must be at least 4 characters)'
  validates_uniqueness_of :username, :message => ' is not available', :case_sensitive => false
  validates :email, :email => {:message => ' is not valid'}
  validates_uniqueness_of :email, :message => ' is already in use', :case_sensitive => false
  validates_length_of :password, :minimum => 4, :maximum => 10, :message => ' is too short (must be between 4 and 10 characters)'
  
  acts_as_authentic do |config|
     config.crypto_provider = Authlogic::CryptoProviders::MD5
     config.validate_email_field = false
     config.validate_login_field = false
     config.validate_password_field = false
     config.login_field = :email
     config.validate_login_field = false
  end
  
  before_save :downcase
  
  private
  
  def downcase
    self.username = self.username.downcase
    self.email = self.email.downcase
  end
  
end
