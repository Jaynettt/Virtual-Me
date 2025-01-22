class Question < ApplicationRecord
  has_many :user_questions
  has_many :users, through: :user_questions
  has_many :answers, dependent: :destroy


  validates :content, presence: true
end
