class AddDescriptionToNotes < ActiveRecord::Migration
  def self.up
    add_column :notes, :description, :text
  end

  def self.down
    remove_column :notes, :description
  end
end
