class AddUserIdToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :user_id,:integer
  end
end
