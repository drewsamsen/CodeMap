class Note < ActiveRecord::Base

  validates :subject, :presence => true

end
