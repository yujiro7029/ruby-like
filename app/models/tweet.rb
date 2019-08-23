class Tweet < ApplicationRecord
  validates :content, presence: true
  validates :content, uniqueness: true
  has_many :answers
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :flags
  has_many :answer_results
  belongs_to :user

  #user ログインしているユーザーの投稿情報を取得
  scope :current, ->(user){where(user_id:  user)}
  #tweet/index  指定条件ごとに取り出す値を変更
  scope :type, ->(problem){where(type_problem:(problem)).order(created_at: :DESC)}
  scope :new_problem, ->{all.order(created_at: :DESC)}


  #検索機能 gem 'search_cop'の呼び出し
  include SearchCop

  #検索機能 gem 'search_cop'scope名と検索対象とするカラムを設定
  search_scope :tweet_search do
    attributes :content,:title
  end
end
