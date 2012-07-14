class Note < ActiveRecord::Base
  belongs_to :technology

  validates :subject, :presence => true
  
  # this scope is used in @technologies#show
  scope :that_belongs_to, lambda { |technology|
      where(:technology_id => technology)
    }

  def self.for(technology)
    Note.that_belongs_to(technology)
  end

  # virtual attributes used in the creation form of new Notes
  def technology_name
    technology.try(:name)
  end

  # virtual attribute used in the creation form of new notes
  def technology_name=(name)
    self.technology = Technology.find_or_create_by_name(name) if name.present?
  end

  

end
