class Note < ActiveRecord::Base
  belongs_to :technology, :counter_cache => true

  validates :subject, :presence => true

  before_save do |note| 
    if note.importance && note.understanding
      update_mastery(note)
    end
  end

  attr_accessible :subject, :description, :understanding, :importance, :mastery, :resources, :technology_name
 
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

  def update_mastery(note)
    note.mastery = calculate_mastery(note.importance, note.understanding)
  end

  # mastery is a virtual attribute that is a measure of how urgently I should
  # think about learning more about a given note. Notes with high importance and
  # low understanding will have an mastery closer to zero.
  def calculate_mastery(importance, understanding)
    if understanding == 5
      100
    else
      100 - ((5 - understanding) * 14) - importance * 6
    end
  end
end
