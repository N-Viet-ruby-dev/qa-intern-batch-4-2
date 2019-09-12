class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :content, presence: true

  scope :newest, -> { order created_at: :DESC }
end
