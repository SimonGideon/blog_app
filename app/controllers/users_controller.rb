class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        @posts = Post.find(params[:id])
    end
end
