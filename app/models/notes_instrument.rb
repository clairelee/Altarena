class NotesInstrument < ActiveRecord::Base
    belongs_to :note
    belongs_to :instrument
    validates :note_id, :instrument_id, presence: true
end