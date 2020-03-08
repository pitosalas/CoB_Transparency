require 'test_helper'

class StudyAreaTest < ActiveSupport::TestCase
  def setup
    @area = StudyArea.new(name: "Copley", location: "40.741895,-73.989308", radius: 2.5)
  end

  test "should be valid" do
    assert @area.valid?
  end

  test "location should be present" do
    @area.location = "    "
    assert_not @area.valid?
  end

  test "location validation should reject invalid format" do
    invalid_locations = ["-90., -180.", "+90.1, -100.111", "045, 180",
                         "foo@bar_baz.com", "92a,+100"]
    invalid_locations.each do |invalid_location|
      @area.location = invalid_location
      assert_not @area.valid?, "#{invalid_location.inspect} should be invalid"
    end
  end

  test "radius should be present" do
    @area.radius = 0
    assert_not @area.valid?
  end

end
