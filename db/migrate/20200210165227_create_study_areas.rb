class CreateStudyAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :study_areas do |t|
      t.float :start_point, array: true, default:[]
      t.float :end_point, array: true, default:[]
      t.integer :num_sensors
      t.string :name
    end
  end
end
