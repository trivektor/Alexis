class Backbone::ThemesController < ApplicationController
  
  def index
    render :json => Theme.where(:status => :active).all
  end
  
end