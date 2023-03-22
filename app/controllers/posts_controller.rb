class PostsController < ApplicationController
  def index
    @user = User.includes(:posts).find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.includes(:posts).find(params[:user_id])
    @post = @user.posts.includes(:comments).find(params[:id])
    @comment ||= current_user.comments.build if current_user
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.build
  end

  def create
    @user = current_user
    @post = @user.posts.build(post_params)

    if @post.save
      redirect_to user_post_path(@user, @post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
