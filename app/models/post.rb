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
  
  def self.search(search) #ここでのself.はMicropost.を意味する
    if search
      where(['content LIKE ?', "%#{search}%"]) #検索とcontentの部分一致を表示。Micropost.は省略。
    else
      all #全て表示。Micropost.は省略。
    end
  end
end
