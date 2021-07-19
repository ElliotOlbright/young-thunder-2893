class StudioController < ApplicationController 
  def index 
    @studios = Studio.all 
  end 

  def show 
    @studio = Studio.find(params[:id])
  end
end 