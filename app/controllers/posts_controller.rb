class PostsController < ApplicationController
  def index
    @author = Author.find(params[:author_id])
    @posts = @author.posts.includes(:comments)
  end

  def show
    @author = Author.find(params[:author_id])
    @post = @author.posts.find(params[:id])
  end

  def new
    @id = current_user.id
    @new_post = Post.new
  end

  def create
    post = Post.new(title: params[:title], text: params[:text], author: current_author)
    if post.save
      flash[:notice] = 'success'
      redirect_to "/authors/#{current_author.id}/posts"
    else
      flash[:error] = 'Error'
    end
  end
end
