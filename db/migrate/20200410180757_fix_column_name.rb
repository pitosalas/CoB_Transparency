class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :sensors, :ownership, :owner
  end
end
