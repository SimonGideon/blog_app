require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  describe 'POST /users/:user_id/posts/:post_id/comments' do
    before do
      @user = User.create(name: 'Test User')
      @post = @user.posts.create(title: 'Test Post', text: 'Test Post Text')
    end
    it 'creates a comment' do
      expect do
        post user_post_comments_path(@user, @post), params: { comment: { text: 'Test Comment' } }
      end.to change(Comment, :count).by(1)
    end
    it 'redirects to the post' do
      post user_post_comments_path(@user, @post), params: { comment: { text: 'Test Comment' } }
      expect(response).to redirect_to(user_post_path(@user, @post))
    end
  end
end
