require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    let(:user) { User.create(name: 'John Doe') }

    it 'returns a successful response' do
      get user_posts_path(user.id)
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get user_posts_path(user.id)
      expect(response).to render_template('index')
    end
  end
end
