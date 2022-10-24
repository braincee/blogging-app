class PostsController < ApplicationController
    def index
        @user = User.find(params[:user_id])
        @posts = @user.posts
    end

    def show 
        @user = User.find(params[:user_id])
        @posts = Post.find_by(user_id: params[:user_id], id:
        params[:id])
    end
end
