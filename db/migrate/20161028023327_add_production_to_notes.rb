class AddProductionToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :production, :string
  end
end
