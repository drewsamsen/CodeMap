class UpdateAllMastery < ActiveRecord::Migration
  def change
    Note.all.each do |note|
	  if note.understanding == 5
	    note.update_attributes! :mastery => 100
	  else
	    note.update_attributes! :mastery => 100 - ((5 - note.understanding) * 14) - note.importance * 6
	  end
    end
  end
end
