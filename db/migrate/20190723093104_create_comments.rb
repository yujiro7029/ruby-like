class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :text   
      t.integer :user_id, index: true
      t.integer :tweet_id, index: true
      t.timestamps
    end
  end
end
