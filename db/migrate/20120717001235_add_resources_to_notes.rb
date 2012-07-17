class AddResourcesToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :resources, :text
  end
end
