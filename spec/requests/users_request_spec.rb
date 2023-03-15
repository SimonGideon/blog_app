require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'works! right status code given' do
      get users_path
      expect(response).to have_http_status(200)
    end
    it  'renders the index template' do
      get users_path
      expect(response).to render_template("index")
    end

    it 'body should contain the user name' do
      @users = User.all
      get users_path
      @users.each do |user|
        expect(response.body).to include(user.name)
      end
    end
  end
end
