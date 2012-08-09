class NotesController < ApplicationController
  helper_method :sort_column, :sort_direction

  before_filter :authorize, :except => [:index, :show]
  before_filter :find_note, :only => [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @notes = Note.where("subject like ?", "%#{params[:search]}%")
    elsif params[:note] || params[:technology]
      tech_id = params[:note] ? params[:note][:technology_id] : params[:technology]
      @notes = Note.where("technology_id = ?", tech_id) 
    else
      @notes = Note.order(sort_column + " " + sort_direction)
    end
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
    redirect_to root_path
  end

  private

  def find_note
    @note = Note.find(params[:id])
    rescue  ActiveRecord::RecordNotFound
  flash[:alert] = "The note you were looking for could not be found."
  redirect_to root_path
  end

  # accessor method for sorting the index columns with sanitization
  def sort_column
    Note.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"
  end

  # accessor method for sort direction the index columns with sanitization
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

end
