class AnswerResult < ApplicationRecord
  belongs_to :tweet
  belongs_to :user
  belongs_to :answer
end
