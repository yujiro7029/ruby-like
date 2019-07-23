class AddSelectProblemToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :select_problem1,:string
    add_column :tweets, :select_problem2,:string
    add_column :tweets, :select_problem3,:string
    add_column :tweets, :select_problem4,:string
    add_column :tweets, :select_problem5,:string
  end
end
