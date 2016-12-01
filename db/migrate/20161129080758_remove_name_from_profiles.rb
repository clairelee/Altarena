class RemoveNameFromProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :name, :text
  end
end
