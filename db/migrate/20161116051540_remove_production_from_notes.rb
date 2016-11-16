class RemoveProductionFromNotes < ActiveRecord::Migration
  def change
    remove_column :notes, :production, :string
  end
end
