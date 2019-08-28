class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :content, null: false
      t.integer :judge_problem1, null: false
      t.integer :judge_problem2, null: false
      t.integer :judge_problem3, null: false
      t.integer :judge_problem4, null: false
      t.integer :judge_problem5, null: false
      t.integer :user_id, index: true
      t.integer :tweet_id, index: true
      t.timestamps
    end
  end
end
