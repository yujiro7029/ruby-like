class Tweet < ApplicationRecord
  validates :content, presence: true, uniqueness: true
  validates :title, presence: true, uniqueness: true
  validates :point, presence: true
  validates :select_problem1, presence: true
  validates :select_problem2, presence: true
  validates :select_problem3, presence: true
  validates :select_problem4, presence: true
  validates :select_problem5, presence: true




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
