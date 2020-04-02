class AddLocationToSensors < ActiveRecord::Migration[6.0]
  def change
    add_column :sensors, :location, :string
    add_column :sensors, :longitude, :float
    add_column :sensors, :latitude, :float
  end
end
