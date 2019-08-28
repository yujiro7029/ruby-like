class CreateAnswerResults < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_results do |t|
      t.integer :result, null: false
      t.integer :user_id, index: true
      t.integer :tweet_id, index: true
      t.integer :answer_id, index: true
      t.timestamps
    end
  end
end
