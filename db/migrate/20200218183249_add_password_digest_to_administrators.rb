class AddPasswordDigestToAdministrators < ActiveRecord::Migration[6.0]
  def change
    add_column :administrators, :password_digest, :string
  end
end
