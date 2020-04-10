json.type "FeatureCollection"
json.features @sensors.each do |sensor|
    json.type "Feature"
    json.set! :geometry do
        json.set! :type, "Points"
        loclat = []
        location = sensor.location.split(",")
        loclat.push(location[1].to_f)
        loclat.push(location[0].to_f)
        json.set! :coordinates, loclat
    end
    json.set! :property do
        json.set! :sensor_type, sensor.sensor_type
        json.set! :ownership, sensor.owner
        json.set! :description, sensor.description
    end
end

