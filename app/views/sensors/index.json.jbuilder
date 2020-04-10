json.type "FeatureCollection"
json.features @sensors.each do |sensor|
    # p = Point.find_by(identifier: sensor.sensor_id)
    json.type "Feature"
    json.set! :geometry do
        json.set! :type, "Point"
        longlat = [sensor.longitude, sensor.latitude]
        json.set! :coordinates, longlat
    end
    json.set! :properties do
        json.set! :id, sensor.id
        json.set! :sensor_id, sensor.sensor_id 
        json.set! :sensor_type, sensor.sensor_type
        json.set! :ownership, sensor.owner
        json.set! :description, sensor.description
    end
end
