require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it 'is not valid without a text' do
      comment = Comment.new
      expect(comment).to_not be_valid
    end

    it 'is not valid with a text longer than 250 characters' do
      comment = Comment.new(text: 'a' * 251)
      expect(comment).to_not be_valid
    end
  end

  describe 'associations' do
    it 'is expected to belong to a user' do
      expect(Comment.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

    it 'is expected to belong to a post' do
      expect(Comment.reflect_on_association(:post).macro).to eq(:belongs_to)
    end
  end
end
