class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :name
      t.text :photo_url
      t.text :resume_url

      t.timestamps null: false
    end
  end
end
