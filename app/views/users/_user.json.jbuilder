json.extract! user, :id, :name, :rank, :father, :created_at, :updated_at
json.url user_url(user, format: :json)
