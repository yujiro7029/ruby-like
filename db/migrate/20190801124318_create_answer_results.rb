class CreateAnswerResults < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_results do |t|
      t.integer :result
      t.integer :tweet_id
      t.integer :user_id
      t.timestamps
    end
  end
end
