class AddRememberDigestToAdministrators < ActiveRecord::Migration[6.0]
  def change
    add_column :administrators, :remember_digest, :string
  end
end
