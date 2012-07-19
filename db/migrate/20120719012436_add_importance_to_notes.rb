class AddImportanceToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :importance, :integer
  end
end
