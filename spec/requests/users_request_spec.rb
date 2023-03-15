require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'works! right status code given' do
      get users_path
      expect(response).to have_http_status(200)
    end
  end
end
