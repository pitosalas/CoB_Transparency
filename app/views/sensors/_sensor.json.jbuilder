json.extract! sensor, :id, :sensor_id, :sensor_type, :owner, :description, :longitude, :latitude, :location
json.url sensor_url(sensor, format: :json)
