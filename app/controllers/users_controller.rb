class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
        # @posts = Post.find(params[:id])
    end
end
