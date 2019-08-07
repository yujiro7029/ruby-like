class Like < ApplicationRecord
  belongs_to :tweet
  belongs_to :user
  validates :user_id,:tweet_id,presence: true

   #user/answer_like-list いいねの情報を取得
   scope :current, ->(user){where(user_id:  user).includes(:tweet)}
end
