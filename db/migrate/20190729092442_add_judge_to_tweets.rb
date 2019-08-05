class AddJudgeToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :judge_problem1,:integer
    add_column :tweets, :judge_problem2,:integer
    add_column :tweets, :judge_problem3,:integer
    add_column :tweets, :judge_problem4,:integer
    add_column :tweets, :judge_problem5,:integer
  end
end
