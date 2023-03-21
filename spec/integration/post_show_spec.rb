require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  it 'displays usernames, profile pictures, and post count for each user' do
    first_user = User.create(name: 'Lesssy', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 0,
                             bio: 'Teacher from Mexico.')
    post1 = Post.create(user_id: first_user.id, title: 'Hello', text: 'This is my first post', comment_counter: 0,
                        likes_counter: 0)
    comment = Comment.create(post: post1, user_id: first_user.id, text: 'Hi Tom!')

    visit "/users/#{first_user.id}/posts/#{post1.id}"
    expect(page).to have_content(post1.title)
    expect(page).to have_content("By: #{first_user.name}")
    expect(page).to have_content(post1.text)
    expect(page).to have_content(comment.text)
    expect(page).to have_content('Comments: 1')
    expect(page).to have_content('Likes: 0')
    expect(page).to have_content(first_user.name.to_s)
    expect(page).to have_content(comment.text.to_s)
  end
end
