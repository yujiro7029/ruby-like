class Answer < ApplicationRecord
  validates :content, presence: true
  belongs_to :tweet,optional: true
  belongs_to :user,optional: true
  has_many :answer_results,dependent: :destroy
end