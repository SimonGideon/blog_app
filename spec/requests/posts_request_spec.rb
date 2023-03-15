require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:example) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                        posts_counter: 0)
    Post.create(user: @user, title: 'Hello', text: 'This is my first post', likes_counter: 0,
                comment_counter: 0)
  end
  describe 'GET /posts' do
    it 'returns a 200' do
      get user_posts_path(@user.id)
      expect(response).to have_http_status(200)
    end
    it 'renders the index' do
      get user_posts_path(@user.id)
      expect(response).to render_template('index')
    end
    it 'body should render the post title' do
      get user_posts_path(@user.id)
      expect(response.body).to include('Hello')
    end
  end
end
