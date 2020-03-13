json.extract! point, :point_id, :point_type, :identifier, :longitude, :latitude, :ordering, :created_at, :updated_at
json.url point_url(point, format: :json)
