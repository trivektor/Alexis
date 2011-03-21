class Backbone::BackgroundColorsController < ApplicationController
  
  def index
    render :json => BackgroundColor.where(:status => :active).all
  end
  
end