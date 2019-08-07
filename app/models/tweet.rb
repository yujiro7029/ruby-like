class Tweet < ApplicationRecord
  validates :content, presence: true
  validates :content, uniqueness: true
  has_many :answers
  has_many :comments
  has_many :likes
  has_many :flags
end
