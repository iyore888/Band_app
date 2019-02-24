class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :content, presence: true, length: {maximum: 140 }
  validates :user_id, presence: true
  validates :genre, presence: true
  validates :part, presence: true
  validates :user_id, presence: true
  validates :age, presence: true
  validates :gender, presence: true
end
