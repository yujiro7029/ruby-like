class Tweet < ApplicationRecord
  validates :content, presence: true
  validates :content,  uniqueness: true
end
