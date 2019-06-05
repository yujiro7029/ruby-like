class Tweet < ApplicationRecord
  validates :content, presence: true
  validates :content, uniqueness: true
  has_many :answers
end
