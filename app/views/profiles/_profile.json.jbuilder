json.extract! profile, :id, :name, :photo_url, :resume_url, :created_at, :updated_at
json.url profile_url(profile, format: :json)