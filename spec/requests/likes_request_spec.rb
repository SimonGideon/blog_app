require 'rails_helper'

RSpec.describe 'Likes', type: :request do
  describe 'POST /users/:user_id/posts/:post_id/likes' do
    before do
      @user = User.create(name: 'Test User')
      @post = @user.posts.create(title: 'Test Post', text: 'Test Post Text')
    end
    it 'should create a like' do
      expect do
        post user_post_likes_path(@user, @post)
      end.to change(Like, :count).by(1)
    end
  end
end
