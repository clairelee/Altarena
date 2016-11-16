class CreateProductions < ActiveRecord::Migration
  def change
    create_table :productions do |t|
      t.string :name
      t.string :company
      t.datetime :opening_date

      t.timestamps null: false
    end
  end
end
