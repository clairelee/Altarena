class Production < ActiveRecord::Base
  has_many :notes, dependent: :destroy
  before_save :check_unique
  
  private
      def check_unique
            if Production.exists?(:name => self.name)
                return false
            else
                return true
            end
      end
end
