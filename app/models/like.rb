class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  after_save :like_counter

  def like_counter
    post.update(likes_counter: post.likes.length)
  end
end
