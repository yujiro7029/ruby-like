class Tweet < ApplicationRecord
  validates :content, presence: true
  validates :content, uniqueness: true
  has_many :answers
  has_many :comments
  has_many :likes
  has_many :flags
  has_many :answer_results
  belongs_to :user

  #user ログインしているユーザーの投稿情報を取得
  scope :current, ->(user){where(user_id:  user)}
end
