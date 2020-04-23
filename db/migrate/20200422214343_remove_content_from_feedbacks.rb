class RemoveContentFromFeedbacks < ActiveRecord::Migration[6.0]
  def change

    remove_column :feedbacks, :content, :string
  end
end
