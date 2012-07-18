class TechnologiesController < ApplicationController
  
before_filter :find_technology, :only => [:destroy]

  def index
    @technologies = Technology.all
  end

  def destroy
    @technology.destroy
    flash[:notice] = "Technology has been deleted."
    redirect_to technologies_path
  end

  private

  def find_technology
    @technology = Technology.find(params[:id])
  end

end
