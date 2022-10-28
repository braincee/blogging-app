class PostsController < ApplicationController
  def index
    @users = User.all
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def new
    @id = current_user
    @post = Post.new
    respond_to do |format|
      format.html {render :new, locals: {posts: @post } } 
    end
  end 

  def show
    @users = User.all
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end
end
