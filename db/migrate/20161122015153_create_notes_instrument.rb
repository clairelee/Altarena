class CreateNotesInstrument < ActiveRecord::Migration
  def change
    create_table :notes_instruments do |t|
      t.integer :note_id
      t.integer :instrument_id
    end
  end
end
