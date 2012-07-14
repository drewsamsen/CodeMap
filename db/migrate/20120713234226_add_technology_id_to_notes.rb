class AddTechnologyIdToNotes < ActiveRecord::Migration
  def self.up
    add_column :notes, :technology_id, :integer
  end

  def self.down
    remove_column :notes, :technology_id
  end
end
