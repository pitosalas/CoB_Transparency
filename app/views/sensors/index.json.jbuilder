json.type "FeatureCollection"
json.features @sensors.each do |sensor|
    p = Point.find_by(identifier: sensor.sensor_id)
    json.type "Feature"
    json.set! :geometry do
        json.set! :type, "Point"
        longlat = [p.longitude, p.latitude]
        json.set! :coordinates, longlat
    end
    json.set! :properties do
        json.set! :id, sensor.id
        json.set! :sensor_id, sensor.sensor_id 
        json.set! :sensor_type, sensor.sensor_type
        json.set! :ownership, sensor.ownership
        json.set! :boolean, sensor.gov_owned
        json.set! :op_hrs, sensor.op_hrs
        json.set! :datatype, sensor.datatype
        json.set! :description, sensor.description
        json.set! :study_area_id, sensor.study_area_id
    end
end
