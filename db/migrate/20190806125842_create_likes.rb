class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id, index: true
      t.integer :tweet_id, index: true
      t.timestamps
    end
  end
end
