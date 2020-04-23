class RemoveSensorIdFromSensors < ActiveRecord::Migration[6.0]
  def change
    remove_column :sensors, :sensor_id, :string
  end
end
