class DropStudyAreas < ActiveRecord::Migration[6.0]
  def change
    drop_table :study_areas
  end
end
