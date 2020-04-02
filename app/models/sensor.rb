class Sensor < ActiveRecord::Base 
  include ActiveModel::Validations::Callbacks
  # belongs_to :study_area, optional: true
  # has_one :point, primary_key: :sensor_id, foreign_key: :identifier

  # VALID_LOCATION_REGEX = /\A^[-+]?([1-8]?\d(\.\d+)?|90(\.0+)?),\s*[-+]?(180(\.0+)?|((1[0-7]\d)|([1-9]?\d))(\.\d+)?)$\z/
  # validates :location, presence: true, 
  #           length: {maximum: 50}, 
  #           format: { with: VALID_LOCATION_REGEX }

  # validate study_area_id is greater than 0 if present
  # validates :study_area_id, 
  #           numericality: { greater_than: 0, if: proc { |s| s.study_area_id.present? }}
  # sensor_types = ["camera", "air quality", "induction loop", "counter"]
  # validates :sensor_type, 
  #           inclusion: { in: sensor_types}
  def address
    [street, "Boston", "Massachusetts", "United States"].compact.join(', ')
  end

  # if(:street != nil)
  #   geocoded_by :address
  #   after_validation :geocode
  # else
    reverse_geocoded_by :latitude, :longitude, :address => :location
    after_validation :reverse_geocode 
  
end
