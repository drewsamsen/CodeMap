class TechnologiesController < ApplicationController

  before_filter :authorize, :except => [:index]
  before_filter :find_technology, :only => [:destroy]

  def index
    @technologies = Technology.all
  end

  def create
    @technology = Technology.find_or_create_by_name(params[:name])
    if @technology.save
      flash[:notice] = "Technology has been added."
      redirect_to technologies_path
    else
      flash[:alert] = "Technology has not been created."
      render :action => "index"
    end
  end 

  def destroy
    if has_children?
      flash[:alert] = "Cannot delete non-empty technology categories."
      redirect_to technologies_path      
    else
      @technology.destroy
      flash[:notice] = "Technology has been deleted."
      redirect_to technologies_path  
    end
  end

  private

  def find_technology
    @technology = Technology.find(params[:id])
  end

  def has_children?
    notes = Note.where("technology_id = ?", @technology.id)
    !notes.empty?
  end


end
