class AddTweetIdToAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :tweet_id, :integer
  end
end