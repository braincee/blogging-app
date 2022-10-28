class PostsController < ApplicationController
  def index
    @users = User.all
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def new
    @id = current_user.id
    @post = Post.new
    respond_to do |format|
      format.html {render :new, locals: {posts: @post } } 
    end
  end 

  def create 
     @id = current_user.id
    post = Post.new(title: params[:title], text: params[:text], user: current_user, comments_counter: 0, likes_counter: 0)
    respond_to do |format|
      format.html do 
        if post.save
          post.update_post_counter
          flash[:success] = 'Post successfully saved'
          redirect_to user_posts_path
          else 
          flash.now[:error] = 'Error: Post could not be saved'
          render :new, locals: { post: }
        end
      end
    end
  end

  def show
    puts params
    @post = Post.find(params[:user_id])
    @user_id = current_user.id
  end
end
