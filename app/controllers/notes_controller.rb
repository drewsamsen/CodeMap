class NotesController < ApplicationController

  before_filter :find_note, :only => [:show, :edit, :update, :destroy]

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

  def destroy
    @note.destroy
    flash[:notice] = "Note has been deleted."
    redirect_to notes_path
  end

  private

  def find_note
    @note = Note.find(params[:id])
    rescue  ActiveRecord::RecordNotFound
  flash[:alert] = "The note you were looking for could not be found."
  redirect_to notes_path
  end

end
