class Point < ApplicationRecord
  #has_one :sensor, foreign_key: :sensor_id
  #belongs_to :study_area, foreign_key: :study_area_id

  # point_types = ["sensor", "study area"]
  # validates :sensor_type, 
  #           inclusion: { in: point_types}
end
