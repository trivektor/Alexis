class UserSessionsController < ApplicationController
  
  layout 'signup'
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new params[:user_session]
    
    if @user_session.save
      redirect_to dashboard_path
    else
      render :action => :new
    end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
      #current_user_session.destroy
    reset_session
    redirect_to "/"
  end
  
end
