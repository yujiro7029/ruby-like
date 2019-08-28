class AnswerResult < ApplicationRecord
  belongs_to :tweet,optional: true
  belongs_to :user,optional: true
  belongs_to :answer,optional: true
end
