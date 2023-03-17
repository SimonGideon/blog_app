class LikesController < ApplicationController

    def create
      @post = Post.find(params[:post_id])
      @like = @post.likes.new(user_id: params[:user_id] || current_user.id)

      if @like.save
        redirect_to user_post_path(user_id: @post.user_id, id: @post.id)
      else
        render "posts/show"
      end
    end
  end
  