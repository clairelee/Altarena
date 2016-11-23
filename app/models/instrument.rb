class Instrument < ActiveRecord::Base
    validates :name, presence: true
    has_many :notes_instruments
    has_many :notes, through: :notes_instruments
    
    def self.get_instruments_by_ids(ids)
        instruments = ""
        for id in ids do
            instruments << "#{Instrument.find_by_id(id).name}, "
        end
        
        instruments = instruments[0..-3]
        return instruments
    end
end