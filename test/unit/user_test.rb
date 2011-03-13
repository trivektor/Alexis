require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "should not save user if not provided required information" do
    
    user = User.new
    assert !user.save
    
  end
  
  test "should not save user if username is not available" do
    
    user1 = User.new(:first_name => 'First', :last_name => 'Last', :username => 'TRIVEKTOR', :email => 'TRIVEKTOR@GMAIL.COM', :password => 'password')
    user1.save
    
    user2 = User.new(:first_name => 'First', :last_name => 'Last', :username => 'TRIVEKTOR', :email => 'TRIVEKTOR2@GMAIL.COM', :password => 'password')
    assert !user2.save
    
  end
  
  test "should not save user if email is not available" do
    
    user1 = User.new(:first_name => 'First', :last_name => 'Last', :username => 'TRIVEKTOR1', :email => 'TRIVEKTOR@GMAIL.COM', :password => 'password')
    user1.save
    
    user2 = User.new(:first_name => 'First', :last_name => 'Last', :username => 'TRIVEKTOR2', :email => 'TRIVEKTOR@GMAIL.COM', :password => 'password')
    assert !user2.save
    
  end
  
  test "should downcase username and email before save" do
    
    user = User.new(:first_name => 'First', :last_name => 'Last', :username => 'TRIVEKTOR', :email => 'TRIVEKTOR@GMAIL.COM', :password => 'password')
    user.save
    
    assert_equal 'trivektor@gmail.com', user.email
    assert_equal 'trivektor', user.username
    
  end
  
end
