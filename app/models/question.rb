class Question < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :question_tags, dependent: :destroy
  has_many :tags, through: :question_tags
  has_many :answers, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  scope :newest, -> { order created_at: :DESC }
end
