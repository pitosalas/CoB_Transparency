<<<<<<< HEAD
json.extract! sensor, :id, :type, :created_at, :updated_at
json.url sensor_url(sensor, format: :json)
=======
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
        json.set! :ownership, sensor.ownership
        json.set! :boolean, sensor.gov_owned
        json.set! :op_hrs, sensor.op_hrs
        json.set! :datatype, sensor.datatype
        json.set! :description, sensor.description
        json.set! :study_area_id, sensor.study_area_id
    end
end

>>>>>>> b9009b888464144e8f4b574860bb051d61f14fe3
