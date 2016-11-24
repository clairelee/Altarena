class AddNoteIdToProfiles < ActiveRecord::Migration
  def change
    add_column :notes, :note_id, :integer
  end
end
