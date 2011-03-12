class UsersController < ApplicationController
  
  layout 'signup'
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new params[:user]
    
    if @user.save
      
      @user.profile = Profile.new(:first_name => params[:user][:first_name], :last_name => params[:user][:last_name])
      @user.profile.save
      
      redirect_to dashboard_path
      
    else
      render :action => :new
    end
  end
  
end
