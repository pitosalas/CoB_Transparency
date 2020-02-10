class CreateAdministrators < ActiveRecord::Migration[6.0]
  def change
    create_table :administrators do |t|
      t.string :user_name
      t.string :password
      t.timestamps
    end
  end
end
