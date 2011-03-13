class ProfilesController < ApplicationController
  
  def show
  end
  
  def edit
    
    @profile = Profile.find(params[:id])
    
  end
  
  def update
    
    @profile = Profile.find(params[:id])
    
    if @profile.update_attributes(params[:profile])
      flash[:notice] = 'Your profile has been updated'
    end
    
    redirect_to :action => :edit
    
  end
  
end
