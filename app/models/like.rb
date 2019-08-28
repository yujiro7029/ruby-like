class Like < ApplicationRecord
  belongs_to :tweet,optional: true
  belongs_to :user,optional: true
  validates :user_id,:tweet_id,presence: true

   #user/answer_like-list いいねの情報を取得
   scope :current, ->(user){where(user_id:  user).includes(:tweet)}
end
