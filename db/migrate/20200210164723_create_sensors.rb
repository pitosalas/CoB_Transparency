class CreateSensors < ActiveRecord::Migration[6.0]
  def change
    create_table :sensors do |t|
      t.string :sensor_id
      t.string :sensor_type
      t.string :ownership
      t.string :gov_owned
      t.string :op_hrs
      t.string :datatype
      t.string :description
      t.integer :study_area_id
      t.timestamps
    end
  end
end
