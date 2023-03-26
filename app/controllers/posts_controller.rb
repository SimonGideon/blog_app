class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_posts, only: %i[show edit update destroy]
  def index
    @user = User.includes(:posts).find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.includes(:posts).find(params[:user_id])
    @post = @user.posts.find(params[:id])
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

  def destroy
    @posts = Post.find(params[:id])
    @post.comments.destroy_all
    @post.likes.destroy_all
    @posts.destroy
    @post.update_post_counter
    redirect_to user_post_path, notice: 'Post was successfully deleted.'
  end

  private

  def set_posts
    @user = User.includes(:posts).find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
