RSpec.describe 'User show page', type: :feature do
  it 'displays usernames, profile pictures, and post count for each user' do
    first_user = User.create(name: 'Jose', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 0,
                             bio: 'Teacher from Mexico.')
    @post1 = Post.create(user_id: first_user.id, title: 'First post', text: 'This is my first post', comment_counter: 0,
                        likes_counter: 0)
    @post2 = Post.create(user_id: first_user.id, title: 'Second post', text: 'This is my second post', comment_counter: 0,
                        likes_counter: 0)
    @post3 = Post.create(user_id: first_user.id, title: 'Third post', text: 'This is my third post', comment_counter: 0,
                        likes_counter: 0)

    visit "/users/#{first_user.id}"
    expect(page).to have_content(first_user.name)
    expect(page).to have_css("img[src*='#{first_user.photo}']")
    expect(page).to have_content(first_user.posts_counter)  
    expect(page).to have_content(first_user.bio)
    expect(page).to have_content('Made 3 posts')
    expect(page).to have_content(first_user.bio)
    first_user.posts.each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_link(post.title)
      expect(current_path).to eql("/users/#{first_user.id}")  
    end
    expect(page).to have_link('Show All Posts')
    click_link('Show All Posts')
    expect(current_path).to eq("/users/#{first_user.id}/posts")
  end 
end
