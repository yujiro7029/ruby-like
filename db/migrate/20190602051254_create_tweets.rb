class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
   
      t.text :content, null: false
      t.text :point, null: false
      t.string :title, null: false
      t.integer :type_problem, null: false
      t.integer :judge_problem1, null: false
      t.integer :judge_problem2, null: false
      t.integer :judge_problem3, null: false
      t.integer :judge_problem4, null: false
      t.integer :judge_problem5, null: false
      t.string :select_problem1, null: false
      t.string :select_problem2, null: false
      t.string :select_problem3, null: false
      t.string :select_problem4, null: false
      t.string :select_problem5, null: false
      t.references :user, foreign_key: true
      t.timestamps
   
    end
  end
end
