class Note < ActiveRecord::Base
    validates :name, presence: true
    validates :production_id, presence: true
    belongs_to :user
    belongs_to :production
    belongs_to :profile
    has_many :notes_instruments
    has_many :instruments, through: :notes_instruments
   
    
    def find_by_name(name)
    end
    
    def self.get_unique_column_values(column)
        Note.uniq.pluck(column)
    end
    
    def get_instruments
        instruments = ""
        
        for instrument in self.instruments do
            instruments << "#{instrument.name}, "
        end
        
        instruments = instruments[0..-3] 
    end
    
    def get_instrument_ids
        ids = []
        for instrument in self.instruments do
            ids << "#{instrument.id}"
        end
        
        return ids
    end
end
