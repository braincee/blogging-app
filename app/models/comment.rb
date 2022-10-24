class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def comment_counter
    post.comments_counter = post.comments.count
    Post.find(post.id).update(comments_counter: post.comments)
  end
end
