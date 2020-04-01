class DropPoints < ActiveRecord::Migration[6.0]
  def change
    drop_table :points
  end
end
