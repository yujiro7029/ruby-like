class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image,ImageUploader 
  has_many :comments,dependent: :destroy
  has_many :likes,dependent: :destroy
  has_many :flags,dependent: :destroy
  has_many :tweets,dependent: :destroy
  has_many :answers,dependent: :destroy
  has_many :answer_results,dependent: :destroy
end