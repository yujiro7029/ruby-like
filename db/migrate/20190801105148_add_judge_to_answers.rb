class AddJudgeToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :judge_problem1,:integer
    add_column :answers, :judge_problem2,:integer
    add_column :answers, :judge_problem3,:integer
    add_column :answers, :judge_problem4,:integer
    add_column :answers, :judge_problem5,:integer
  end
end
