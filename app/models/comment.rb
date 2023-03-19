class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_comment_counter
  validates :text, presence: true
  def update_comment_counter
    post.update(comment_counter: post.comments.count)
  end
end
