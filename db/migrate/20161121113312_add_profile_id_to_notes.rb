class AddProfileIdToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :profile_id, :integer
  end
end
