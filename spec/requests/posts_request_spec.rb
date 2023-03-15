require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET users/posts' do
    it 'works! right status code given' do
      get users_path
      expect(response).to have_http_status(200)
    end
  end
end
