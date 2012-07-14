class RemoveNoteIdFromTechnologies < ActiveRecord::Migration
  def self.up
    remove_column :technologies, :note_id
  end

  def self.down
    add_column :technologies, :note_id, :integer
  end
end
