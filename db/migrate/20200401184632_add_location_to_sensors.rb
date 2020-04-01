class AddLocationToSensors < ActiveRecord::Migration[6.0]
  def change
    add_column :sensors, :location, :string
    add_column :sensors, :longitude, :string
    add_column :sensors, :latitude, :string
  end
end
