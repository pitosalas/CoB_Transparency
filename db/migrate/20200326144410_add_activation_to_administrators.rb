class AddActivationToAdministrators < ActiveRecord::Migration[6.0]
  def change
    add_column :administrators, :activation_digest, :string
    add_column :administrators, :activated, :boolean, default: false
    add_column :administrators, :activated_at, :datetime
  end
end
