class CreateStudyAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :study_areas do |t|
      t.integer :study_area_id
      t.string :name
      t.integer :sensor_count
      t.integer :point_count
      t.timestamps
    end
  end
end
