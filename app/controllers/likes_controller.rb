# frozen_string_literal: true

class LikesController < ApplicationController
  def add_like
    @liked_post = Post.find(params[:id])
    like = Like.new(post: @liked_post, author: current_author)
    if Like.exists?(author: current_author, post: @liked_post)
      like.destroy
    else
      like.save
      redirect_to "/authors/#{@liked_post.author_id}/posts"
    end
  end
end
