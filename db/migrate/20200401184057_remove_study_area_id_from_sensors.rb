class RemoveStudyAreaIdFromSensors < ActiveRecord::Migration[6.0]
  def change
    remove_column :sensors, :study_area_id, :integer
  end
end
