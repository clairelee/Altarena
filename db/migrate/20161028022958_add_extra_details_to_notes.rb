class AddExtraDetailsToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :uid, :string
    add_column :notes, :attitude, :int
    add_column :notes, :star_sub, :boolean
    add_column :notes, :musical_maturity, :int
    add_column :notes, :reads_music, :int
    add_column :notes, :harmony_singer, :int
  end
end
