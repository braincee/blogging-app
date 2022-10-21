# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author

  def likes_counter
    post.likes_counter = post.likes.count
    Post.find(post.id).update(likes_counter: post.likes)
  end
end
