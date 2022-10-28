class CommentsController < ActionController
     def new
        comment = Comment.new
        respond_to do |format|
            format.html { render :new, locals: { comment: } } 
        end
    end

     def create
        post = Post.find(params[:post_id])
        comment.new(text: params[:text], user: current_user, post:)
        response_to do |format|
            format.html do 
                if comment.save
                    comment.comment_counter
                    flash[:success] = 'New comment added'
                    redirect_to '/users/#{params[:user_id]}/posts/#{post.id}'
                else
                    flash.now[:error] = 'Error: Comment could not be saved'
                    render :new, locals: { comment: }
                end
            end
        end
    end
end