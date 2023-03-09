class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  before_save :update_post_counter

  def update_post_counter
    self.user.update(post_counter: self.user.posts.count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
