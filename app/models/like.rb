class Like < ApplicationRecord
  belongs_to :tweet
  belongs_to :user
  validates :user_id,:tweet_id,presence: true
end
