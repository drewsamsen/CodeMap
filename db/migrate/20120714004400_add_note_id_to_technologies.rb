class AddNoteIdToTechnologies < ActiveRecord::Migration
  def self.up
    add_column :technologies, :note_id, :integer
  end

  def self.down
    remove_column :technologies, :note_id
  end
end
