class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :iine_users, through: :likes, source: :user
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
  
  # 投稿をいいねする
  def iine(user)
    likes.create(user_id: user.id)
  end
  
  #投稿のいいねを解除する
  def uniine(user)
    likes.find_by(user_id: user.id).destroy
  end
  
  # 現在のユーザーがいいねしてたらtrueを返す
  def iine?(user)
    iine_users.include?(user)
  end
end
