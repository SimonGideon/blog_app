class CommentsController < ApplicationController
  load_and_authorize_resource
  def create
    @post = Post.includes(:comments).find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post

    if @comment.save
      @formatted_updated_at = updated_at_formatted(@comment.updated_at)
      redirect_to user_post_path(user_id: @post.user_id, id: @post.id)
    else
      render 'posts/show'
    end
  end

  def destroy
    @comment.destroy
    def destroy
      @posts = Post.find(params[:id])
      @comment.destroy
      @posts.update_comment_counter
      redirect_to user_post_path(@user, @post), notice: 'Comment was successfully deleted.'
    end
    
  end
  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
