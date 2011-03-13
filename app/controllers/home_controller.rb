class HomeController < ApplicationController
  
  before_filter :redirect
  
  def index
    render :layout => "signup"
  end
  
  private 
  
  def redirect
    redirect_to dashboard_path unless !logged_in?
  end
  
end
