class CreateStudyAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :study_areas do |t|
<<<<<<< HEAD
      t.string :location
      t.float :radius
      t.integer :num_sensors
      t.string :name
      t.timestamps
=======
      t.float :start_point, array: true, default:[]
      t.float :end_point, array: true, default:[]
      t.integer :num_sensors
      t.string :name
>>>>>>> b9009b888464144e8f4b574860bb051d61f14fe3
    end
  end
end
