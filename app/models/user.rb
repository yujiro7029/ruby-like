class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image,ImageUploader 
  has_many :comments
  has_many :likes
  has_many :flags
  has_many :tweets
  has_many :answers
  has_many :answer_results
end