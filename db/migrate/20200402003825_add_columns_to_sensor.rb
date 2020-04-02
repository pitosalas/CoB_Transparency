class AddColumnsToSensor < ActiveRecord::Migration[6.0]
  def change
    add_column :sensors, :street, :string
  end
end
