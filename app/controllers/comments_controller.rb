class CommentsController < ApplicationController
    def create
      @post = Post.find(params[:post_id])
      @comment = current_user.comments.build(comment_params)
      @comment.post = @post
      
      if @comment.save
        redirect_to user_post_path(user_id: @post.user_id, id: @post.id), notice: "Comment created successfully."
      else
        render "posts/show"
      end
    end      
    
    private
    
    def comment_params
      params.require(:comment).permit(:text)
    end
  end
  