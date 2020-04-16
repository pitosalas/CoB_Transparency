class AddHiddenToSensor < ActiveRecord::Migration[6.0]
  def change
    add_column :sensors, :hidden, :boolean
  end
end
