class AddOverallRatingToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :rating, :int
  end
end
