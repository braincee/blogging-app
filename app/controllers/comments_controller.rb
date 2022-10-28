class CommentsController < ActionController
     def new
        comment = Comment.new
        respond_to do |format|
            format.html { render :new, locals: { comment: } } 
        end
    end
end