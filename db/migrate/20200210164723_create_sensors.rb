class CreateSensors < ActiveRecord::Migration[6.0]
  def change
    create_table :sensors do |t|
      #t.belongs_to :study_area
      t.string :sensor_type
      t.string :location
      t.string :ownership
      t.boolean :gov_owned
      t.string :op_hrs
      t.string :datatype
      t.string :description
      t.integer :study_area_id
      t.timestamps
    end
  end
end
