class Answer < ApplicationRecord
  validates :content, presence: true
  belongs_to :tweet
  belongs_to :user
  has_many :answer_results
end