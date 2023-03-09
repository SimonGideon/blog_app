require 'rails_helper'

RSpec.describe Like, type: :model do
    user = User.create(name: 'Luke', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Dj from Kenya.')
    post = Post.new(title: 'My first post', text: 'This is my first post', user: user)
    before { post.save }
  describe 'validations' do
    it 'is not valid without a user' do
      like = Like.new(post: post)
      expect(like).to_not be_valid
    end

    it 'is not valid without a post' do
      like = Like.new(user: user)
      expect(like).to_not be_valid
    end
  end
end

