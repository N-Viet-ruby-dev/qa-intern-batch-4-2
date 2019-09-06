class Question < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :question_tags, dependent: :destroy
  has_many :tags, through: :question_tags

  validates :title, presence: true
  validates :content, presence: true
end
