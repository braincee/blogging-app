# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author

  def comment_counter
    post.comments_counter = post.comments.count
    Post.find(post.id).update(comments_counter: post.comments)
  end
end
