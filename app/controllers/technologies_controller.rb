class TechnologiesController < ApplicationController
  
before_filter :find_technology, :only => :show
before_filter :find_notes_that_belong_to_tech, :only => :show

  def index
    @technologies = Technology.all
  end

  def show
  end

  private

  def find_technology
    @technology = Technology.find(params[:id])
  end

  def find_notes_that_belong_to_tech
    @notes = Note.for(@technology.id)
  end

end
