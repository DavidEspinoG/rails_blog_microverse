require 'rails_helper'

RSpec.describe 'user show view', type: :system do
  let!(:user_one) { User.create name: 'Jose', posts_counter: 0 }
  let!(:user_two) { User.create name: 'Carlos', posts_counter: 0 }
  let!(:post) do
    Post.create author_id: user_two.id, comments_counter: 0, likes_counter: 0, title: 'title', text: 'something'
  end
  let!(:comment) { Comment.create author: user_one, post:, text: 'fake comment' }
  it 'should render the user profile picture' do
    visit "users/#{user_one.id}"
    expect(page).to have_content('Jose profile picture')
  end
  it 'should render the user name' do
    visit "users/#{user_one.id}"
    expect(page).to have_content('User Name: Jose')
  end
  it 'should render the number of post of the user' do
    visit "users/#{user_two.id}"
    expect(page).to have_content('Total posts: 1')
  end
  it 'should render the user bio' do
    visit "users/#{user_two.id}"
    expect(page).to have_content('Bio')
  end
  it 'should render max three posts' do
    visit "users/#{user_two.id}"
    posts = find_all('.post-show')
    expect(posts.count).to eq(1)
  end

  it 'should render a button for all posts' do
    visit "users/#{user_two.id}"
    expect(page).to have_content('See all posts')
  end

  context 'see all posts button' do
    it 'should redirect to all  user posts post show path' do
      visit "users/#{user_two.id}"
      click_link 'See all posts'
      expect(page).to have_current_path("/users/#{user_two.id}/posts")
    end
  end

  context 'post detail link' do
    it 'should redirect to that post show view' do
      visit "users/#{user_two.id}/posts"
      click_link(href: "/users/#{user_two.id}/posts/#{post.id}")
      expect(page).to have_current_path("/users/#{user_two.id}/posts/#{post.id}")
    end
  end

  it 'should render post comments' do
    visit "users/#{user_two.id}/posts"
    expect(page).to have_content('fake comment')
  end
end
