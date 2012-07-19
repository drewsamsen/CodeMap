class AddUnderstandingToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :understanding, :integer
  end
end
