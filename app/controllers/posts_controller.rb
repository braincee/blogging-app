class PostsController < ApplicationController
  def index
<<<<<<< HEAD
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
=======
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
>>>>>>> 039dd38db74a45de2216cca827d5a69347ab0909
  end
end
