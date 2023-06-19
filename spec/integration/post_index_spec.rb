require 'rails_helper'

RSpec.describe 'post#index', type: :system do 
  let!(:user_two) { User.create name: 'Carlos', posts_counter: 0 }
  let!(:post) { Post.create author_id: user_two.id, comments_counter: 0, likes_counter: 0, title: 'title', text: 'something' }

  it 'should render the author profile picture' do
    visit "users/#{user_two.id}/posts"
    expect(page).to have_content("#{user_two.name} profile picture" )
  end

  it 'should render the user name' do 
    visit "users/#{user_two.id}/posts"
    expect(page).to have_content(user_two.name)
  end

  it 'should render the number of posts of the user' do 
    visit "users/#{user_two.id}/posts"
    expect(page).to have_content("Total posts: 1")
  end
  it 'should render the post title' do 
    visit "users/#{user_two.id}/posts"
    expect(page).to have_content(post.title)
  end
  it 'should render some of the post text' do 
    visit "users/#{user_two.id}/posts"
    expect(page).to have_content(post.text.slice(0..10))
  end
  it 'should render the firsts comments' do 
    visit "users/#{user_two.id}/posts"
  end
end