class UserQuestion < ApplicationRecord
  belongs_to :user
  belongs_to :question
  validates :answer, presence: true
end
