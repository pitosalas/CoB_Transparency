class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.string :issue
      t.string :content

      t.timestamps
    end
  end
end
