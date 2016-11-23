class User < ActiveRecord::Base
  has_many :notes, dependent: :destroy
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      # user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
  
  def find_note(id)
    self.notes.find(id)
  end
  
  def all_notes
    self.notes.all
  end
  
  def new_note(note_params)
    self.notes.new(note_params)
  end
  
end