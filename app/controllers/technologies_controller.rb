class TechnologiesController < ApplicationController
  
before_filter :find_technology, :only => [:show, :destroy]
before_filter :find_notes_that_belong_to_tech, :only => :show

  def index
    @technologies = Technology.all
  end

  def show
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

  def find_notes_that_belong_to_tech
     @notes = Note.where(:technology_id => @technology.id)
  end

end
