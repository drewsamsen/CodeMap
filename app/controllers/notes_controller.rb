class NotesController < ApplicationController

  before_filter :find_note, :only => [:show, :edit, :update]

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end 

  def create
    @note = Note.new(params[:note])
    if @note.save
      flash[:notice] = "Note has been created."
      redirect_to @note
    else
      flash[:alert] = "Note has not been created."
      render :action => "new"
    end
  end 

  def show
  end

  def edit
  end

  def update
    if @note.update_attributes(params[:note])
      flash[:notice] = "Note has been updated."
      redirect_to @note
    else
      flash[:alert] = "Note has not been updated."
      render :action => "edit"
    end
  end

  private

  def find_note
    @note = Note.find(params[:id])
  end

end
