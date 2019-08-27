class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :content, null: false
      t.integer :judge_problem1, null: false
      t.integer :judge_problem2, null: false
      t.integer :judge_problem3, null: false
      t.integer :judge_problem4, null: false
      t.integer :judge_problem5, null: false
      t.references :user, foreign_key: true
      t.references :tweet, foreign_key: true
      t.timestamps
    end
  end
end
