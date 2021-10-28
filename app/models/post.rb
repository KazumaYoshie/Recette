class Post < ApplicationRecord

  belongs_to :user
  attachment :picture
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true
  validates :picture, presence: true
  validates :cook, presence: true

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
