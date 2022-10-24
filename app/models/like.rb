class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  after_save :like_counter

  def likes_counter
    post.likes_counter = post.likes.count
    Post.find(post.id).update(likes_counter: post.likes)
  end
end
