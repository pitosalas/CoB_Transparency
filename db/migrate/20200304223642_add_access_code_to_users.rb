class AddAccessCodeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :access_code, :string
  end
end
