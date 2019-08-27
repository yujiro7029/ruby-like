class CreateAnswerResults < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_results do |t|
      t.integer :result, null: false
      t.references :user, foreign_key: true
      t.references :tweet, foreign_key: true
      t.references :answer, foreign_key: true
      t.timestamps
    end
  end
end
