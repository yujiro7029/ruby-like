class AnswerResult < ApplicationRecord
  belongs_to :tweet
  belongs_to :user
  belongs_to :answer

  #user/answer_question 回答した問題の情報を取得
  scope :answer, ->(result){where(result: result).includes(:tweet)}
  scope :current, ->(user){where(user_id:  user).includes(:tweet)}
end
