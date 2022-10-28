class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def comment_counter
    post.update(comments_counter: post.comments.length)
  end
end
