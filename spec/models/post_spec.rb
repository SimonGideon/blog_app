require 'rails_helper'

RSpec.describe Post, type: :model do
    user = User.create(name: 'Luke', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Dj from Kenya.')
    post = Post.new(title: 'My first post', text: 'This is my first post', user: user)
    before { post.save }
  describe "validations" do
    it "is not valid without a title" do
      post.title = nil
      expect(post).to_not be_valid
    end

    it "is not valid with a title longer than 250 characters" do
      post.title = "a" * 251
      expect(post).to_not be_valid
    end

    it "is not valid with a negative comment counter" do
      post.comment_counter = -1
      expect(post).to_not be_valid
    end

    it "is not valid with a negative likes counter" do
      post.likes_counter = -1
      expect(post).to_not be_valid
    end
  end

  describe "associations" do
    it "is expected to have many comments" do
      expect(Post.reflect_on_association(:comments).macro).to eq(:has_many)
    end

    it "is expected to belong to a user" do
      expect(Post.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

    it "is expected to have many likes" do
      expect(Post.reflect_on_association(:likes).macro).to eq(:has_many)
    end
  end
end
