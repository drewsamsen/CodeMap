class Note < ActiveRecord::Base
  belongs_to :technology, :counter_cache => true

  validates :subject, :presence => true
  
  # this scope is used in @technologies#show
  #scope :that_belongs_to, lambda { |technology|
  #    where(:technology_id => technology)
  #  }

  # method for helping to scope the notes by their technology
  #def self.for(technology)
  #  Note.that_belongs_to(technology)
  #end

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
    # FIRST we check to see if the user has used the search form
    if params[:search]
      @notes = Note.where("subject like ?", "%#{params[:search]}%")

    # SECOND: if not, see if they're trying to filter notes by technology
    elsif params[:note] || params[:technology]
      tech_id = params[:note] ? params[:note][:technology_id] : params[:technology]
      @notes = Note.where("technology_id = ?", tech_id) 

    # THIRD: if they're not searching, return a normal collection of notes
    else
      @notes = Note.find(:all, :include => :technology)
    end
  end 

end
