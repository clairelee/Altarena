class AddProductionIdToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :production_id, :integer
  end
end
