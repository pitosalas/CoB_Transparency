class AddResetToAdministrators < ActiveRecord::Migration[6.0]
  def change
    add_column :administrators, :reset_digest, :string
    add_column :administrators, :reset_sent_at, :datetime
  end
end
