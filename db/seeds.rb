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
include RandomPassword

Administrator.delete_all
Sensor.delete_all
StudyArea.delete_all

10.times do
  password = generate(16)
  Administrator.create!(name: Faker::Name.name, 
                email: Faker::Internet.email, 
                password: password, 
                password_confirmation: password)
end

15.times do
  StudyArea.create!(name: Faker::Address.street_name,
                   location: RandomLocation.near_by(42.346676, -71.097218, 3218).join(","),
                   radius: rand,
                   num_sensors: 0)
end

sensor_types = ["camera", "air quality", "induction loop", "counter"]
ownerships = ["Verizon", "Police Department", "City of Boston", "Google", "Amazon"]
datatypes = ["picture", "video", "air quality data", "count"]
100.times do
  area = StudyArea.all.sample
  area.update(num_sensors: area.num_sensors + 1)
  Sensor.create! do |sensor|
    sensor.sensor_type = sensor_types.sample
    sensor.location = RandomLocation.near_by(42.346676, -71.097218, 3218).join(",")
    sensor.ownership = ownerships.sample
    sensor.gov_owned = [true, false].sample
    sensor.op_hrs = Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all)
    sensor.datatype = datatypes.sample
    sensor.description = Faker::Quotes::Shakespeare.as_you_like_it_quote
    sensor.study_area_id = area.id
  end
end