require 'rails_helper'

RSpec.describe 'post#index', type: :system do 
  let!(:user_two) { User.create name: 'Carlos', posts_counter: 0 }
  let!(:user_three) { User.create name: 'Santiago', posts_counter: 0 }
  let!(:post) { Post.create author_id: user_two.id, comments_counter: 0, likes_counter: 0, title: 'title', text: 'something' }
  let!(:post_two) { Post.create author_id: user_three.id, comments_counter: 0, likes_counter: 0, title: 'title', text: 'something' }
  let!(:comment) {Comment.create author: user_two, post: post_two, text: 'hello'}
  let!(:comment_two) {Comment.create author: user_two, post: post_two, text: 'hello'}
  let!(:comment_three) {Comment.create author: user_two, post: post_two, text: 'hello'}
  let!(:comment_four) {Comment.create author: user_two, post: post_two, text: 'hello'}
  let!(:comment_five) {Comment.create author: user_two, post: post_two, text: 'hello'}
  let!(:comment_six) {Comment.create author: user_two, post: post_two, text: 'hello'}

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
    comments = find_all('.comment')
    expect(comments.count).to be < 6
  end

  it 'should render the number of comments' do 
    visit "users/#{user_two.id}/posts"
    element = find_by_id("comments_post_#{post.id}")
    expect(element).to have_content("Number of comments: #{post.comments_counter}")
  end
  it 'should render the number of likes' do 
    visit "users/#{user_two.id}/posts"
    element = find_by_id("likes_post_#{post.id}")
    expect(element).to have_content("Number of likes: #{post.likes_counter}")
  end

  it 'should render pagination if the post has more than 5 comments' do
    visit "users/#{user_three.id}/posts"
    expect(page).to have_content('Comment pagination')
  end

  context 'post detail link' do 
    it 'should redirect to that post detail' do 
      visit "users/#{user_two.id}/posts"
      click_link href: "/users/#{user_two.id}/posts/#{post.id}"
      expect(page).to have_current_path("/users/#{user_two.id}/posts/#{post.id}")
    end
  end

end