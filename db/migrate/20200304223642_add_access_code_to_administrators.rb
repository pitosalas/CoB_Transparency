class AddAccessCodeToAdministrators < ActiveRecord::Migration[6.0]
  def change
    add_column :administrators, :access_code, :string
  end
end
