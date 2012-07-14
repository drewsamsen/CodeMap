class AddNotesCount < ActiveRecord::Migration
  def self.up
    add_column :technologies, :notes_count, :integer, :default => 0

    Technology.reset_column_information
    Technology.find(:all).each do |t|
      Technology.update_counters t.id, :notes_count => t.notes.length
    end
  end

  def self.down
    remove_column :technologies, :notes_count
  end
end
