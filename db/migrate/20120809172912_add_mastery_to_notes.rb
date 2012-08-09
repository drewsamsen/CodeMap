class AddMasteryToNotes < ActiveRecord::Migration
  def change
  	add_column :notes, :mastery, :integer

    Note.all.each do |note|
      note.update_attributes! :mastery => 103 - (note.importance * 2) * (6 - note.understanding) * 2
    end

  end
end
