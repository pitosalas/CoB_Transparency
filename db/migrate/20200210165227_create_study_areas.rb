class CreateStudyAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :study_areas do |t|
      t.string :location
      t.float :radius
      t.integer :num_sensors
      t.string :name
      t.timestamps
    end
  end
end
