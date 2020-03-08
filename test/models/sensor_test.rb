require 'test_helper'

class SensorTest < ActiveSupport::TestCase
  def setup
    @sensor = Sensor.new(description: "cam_201", location: "40.741895,-73.989308",
                         sensor_type: "camera")
  end

  test "should be valid" do
    assert @sensor.valid?
  end

  test "location should be present" do
    @sensor.location = "    "
    assert_not @sensor.valid?
  end

  test "location validation should reject invalid format" do
    invalid_locations = ["-90., -180.", "+90.1, -100.111", "045, 180",
                         "foo@bar_baz.com", "92a,+100"]
    invalid_locations.each do |invalid_location|
      @sensor.location = invalid_location
      assert_not @sensor.valid?, "#{invalid_location.inspect} should be invalid"
    end
  end

  test "sensor type should be valid" do
    invalid_types = %w[random digital_camera infared_sensor]
    invalid_types.each do |invalid_type|
      @sensor.sensor_type = invalid_type
      assert_not @sensor.valid?
    end
  end
end
