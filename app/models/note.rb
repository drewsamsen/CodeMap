class Note < ActiveRecord::Base
  has_many :technologies
  accepts_nested_attributes_for :technologies

  validates :subject, :presence => true

end
