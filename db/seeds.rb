# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'random-location'
require 'faker'
require 'random/password'
require 'csv'
require 'open-uri'
include RandomPassword

Administrator.delete_all
Point.delete_all
Sensor.delete_all
StudyArea.delete_all

10.times do
  password = generate(16)
  Administrator.create!(name: Faker::Name.name, 
                email: Faker::Internet.email, 
                password: password, 
                password_confirmation: password, 
                access_code: 'pororo')
end

sensor_csv_path = "./db/sensors.csv"
# sensor_csv_path = "https://docs.google.com/spreadsheets/d/1I0PSo4PdN-8wFFn1vcPod5JvlXPhhZhyePiRVPIcHzI/gviz/tq?tqx=out:csv&sheet=sensors"
#CSV.parse(open(sensor_csv_path), :headers=>true).each do |row|
CSV.read(sensor_csv_path, :headers=>true).each do |row|
  Sensor.create!(
    sensor_id: row["sensor_id"].to_i, 
    sensor_type: row["sensor_type"], 
    ownership: row["ownership"],
    gov_owned: row["gov_owned"], 
    op_hrs: row["op_hrs"],
    datatype: row["datatype"],
    description: row["description"],
    study_area_id: row["study_area_id"].to_i)
end

point_csv_path = "./db/points.csv"
# point_csv_path = "https://docs.google.com/spreadsheets/d/1ThSurKMiB59TO90G6ThO5V7adagkE8L5IGXya9dFa2Y/gviz/tq?tqx=out:csv&sheet=points"
# CSV.parse(open(point_csv_path), :headers=>true, encoding: "bom|utf-8").each do |row|
CSV.read(point_csv_path, :headers=>true).each do |row|
  Point.create!(
    point_id: row["point_id"].to_i, 
    point_type: row["point_type"], 
    identifier: row["identifier"].to_i, 
    longitude: row["longitude"],
    latitude: row["latitude"],
    location: row["location"],
    ordering: row["ordering"].to_i)
end







# 15.times do
#   StudyArea.create!(name: Faker::Address.street_name,
#                    location: RandomLocation.near_by(42.346676, -71.097218, 3218).join(","),
#                    radius: rand,
#                    num_sensors: 0)
# end

# sensor_types = ["camera", "air quality", "induction loop", "counter"]
# ownerships = ["Verizon", "Police Department", "City of Boston", "Google", "Amazon"]
# datatypes = ["picture", "video", "air quality data", "count"]
# 100.times do
#   area = StudyArea.all.sample
#   area.update(num_sensors: area.num_sensors + 1)
#   Sensor.create! do |sensor|
#     sensor.sensor_type = sensor_types.sample
#     sensor.location = RandomLocation.near_by(42.346676, -71.097218, 3218).join(",")
#     sensor.ownership = ownerships.sample
#     sensor.gov_owned = [true, false].sample
#     sensor.op_hrs = Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all)
#     sensor.datatype = datatypes.sample
#     sensor.description = Faker::Quotes::Shakespeare.as_you_like_it_quote
#     sensor.study_area_id = area.id
#   end
# end