class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  before_save :update_likes_counter

  def update_likes_counter
    self.post.update(likes_counter: self.post.likes.count)
  end
end
