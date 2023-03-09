class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  validate :name, presence: true
  validate :posts_counter, numericality: { only_integer: true }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
