require 'rails_helper'

RSpec.describe User, type: :model do
    user = User.new(name: 'Luke', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Dj from Kenya.')
    before { user.save }
    it 'name should be present' do
        user.name = ''
        expect(user).to_not be_valid
    end

    it 'photo should be present' do
        user.photo = ''
        expect(user).to_not be_valid
    end

    it 'bio to be present' do
        user.bio = ''
        expect(user).to_not be_valid
    end
  end