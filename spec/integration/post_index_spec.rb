require 'rails_helper'

RSpec.describe 'Post index page', type: :feature do
  it 'loads users page as default page' do
    visit '/'
    expect(page).to have_content('Pagination')
  end
  it 'displays usernames, profile pictures, and post count for each user' do
    user1 = User.create(name: 'John Doe', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        posts_counter: 0, bio: 'Im full stack developer.')
    post1 = Post.create(user_id: user1, title: 'Hello', text: 'This is my first post',
                        comment_counter: 0, likes_counter: 0)
    comment = Comment.create(post: post1, user_id: user1, text: 'Hi Tom!')
    visit "/users/#{user1.id}/posts/"
    expect(page).to have_content(user1.name)
    expect(page).to have_css("img[src*='#{user1.photo}']")
    expect(page).to have_content('Comments: 1')
    expect(page).to have_content('Likes: 0')
    expect(current_path).to eq("/users/#{user1.id}/posts/#{post1.id}")
  end
end
