class Note < ActiveRecord::Base
    validates :name, presence: true
    validates :production_id, presence: true
    belongs_to :user
    belongs_to :production
    belongs_to :profile
    def find_by_name(name)
    end
    
    def self.get_unique_column_values(column)
        Note.uniq.pluck(column)
    end
end
