class Note < ActiveRecord::Base
  belongs_to :technology, :counter_cache => true

  validates :subject, :presence => true
 
  # virtual attribute to help get the technology name 
  def technology_name
    technology.try(:name)
  end

  # virtual attribute to help set/edit the technology of a note
  def technology_name=(name)
    self.technology = Technology.find_or_create_by_name(name) if name.present?
  end

  def self.search(params)
    # this class method is used for the notes#index action
    # FIRST we check to see if the columns are being sorted
    if params[:sort]
      @notes = Note.order(params[:sort] + " " + params[:direction])

    # SECOND: we check to see if the user has used the search form
    elsif params[:search]
      @notes = Note.where("subject like ?", "%#{params[:search]}%")

    # THIRD: if not, see if they're trying to filter notes by technology
    elsif params[:note] || params[:technology]
      tech_id = params[:note] ? params[:note][:technology_id] : params[:technology]
      @notes = Note.where("technology_id = ?", tech_id) 

    # LAST: if they're not searching, return a normal collection of notes
    else
      @notes = Note.find(:all, :include => :technology, :order => "created_at DESC")
    end
  end 

end
