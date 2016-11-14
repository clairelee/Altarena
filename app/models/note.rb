class Note < ActiveRecord::Base
    validates :name, presence: true
    validates :production, presence: true
    def find_by_name(name)
        
    end
end
