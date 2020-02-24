class StudyArea < ActiveRecord::Base 
  has_many :sensors
  VALID_LOCATION_REGEX = /\A^[-+]?([1-8]?\d(\.\d+)?|90(\.0+)?),\s*[-+]?(180(\.0+)?|((1[0-7]\d)|([1-9]?\d))(\.\d+)?)$\z/
  validates :location, presence: true, 
            length: {maximum: 50}, 
            format: { with: VALID_LOCATION_REGEX }
  validates :radius, presence: true, 
            numericality: { greater_than: 0}
end
