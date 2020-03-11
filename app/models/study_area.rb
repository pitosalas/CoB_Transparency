class StudyArea < ActiveRecord::Base 
  has_many :sensors, primary_key: :study_area_id
  # has_many :points, primary_key: :study_area_id, foreign_key: :identifier
end
