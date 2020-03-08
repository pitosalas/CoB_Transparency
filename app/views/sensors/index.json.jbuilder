json.type "FeatureCollection"
json.features @sensors.each do |sensor|
    json.type "Feature"
    json.set! :geometry do
        json.set! :type, "Point"
        loclat = []
        location = sensor.location.split(",")
        loclat.push(location[1].to_f)
        loclat.push(location[0].to_f)
        json.set! :coordinates, loclat
    end
    json.set! :properties do
        json.set! :sensor_type, sensor.sensor_type
        json.set! :ownership, sensor.ownership
        json.set! :boolean, sensor.gov_owned
        json.set! :op_hrs, sensor.op_hrs
        json.set! :datatype, sensor.datatype
        json.set! :description, sensor.description
        json.set! :study_area_id, sensor.study_area_id
    end
end
