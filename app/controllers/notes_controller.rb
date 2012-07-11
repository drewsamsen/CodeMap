class NotesController < ApplicationController

  def index
  end

  def new
    @note = Note.new
  end 

  def create
    @note = Note.new(params[:note])
    @note.save
    flash[:notice] = "Note has been created."
    redirect_to @note
  end 

  def show
    @note = Note.find(params[:id])
  end
end
