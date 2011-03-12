require 'test_helper'

class BusinessCardsControllerTest < ActionController::TestCase
  
  test "should create business card" do
    assert_difference('BusinessCard.count') do
      post :create, :business_card => {:url => 'url', :title => 'Title'}
    end
    
    assert_redirected_to dashboard_path
  end
  
end
