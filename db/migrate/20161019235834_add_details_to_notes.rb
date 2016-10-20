class AddDetailsToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :role, :string
  end
end
