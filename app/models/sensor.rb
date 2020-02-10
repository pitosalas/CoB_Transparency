class Sensor < ActiveRecord::Base 
  belongs_to :study_area, optional: true
end
