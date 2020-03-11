class CreatePoints < ActiveRecord::Migration[6.0]
  def change
    create_table :points do |t|
      t.integer :point_id
      t.string :point_type
      t.integer :identifier
      t.string :longitude
      t.string :latitude
      t.string :location
      t.integer :ordering

      t.timestamps
    end
  end
end
