class AddTypeProblemToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :type_problem,:integer
  end
end
