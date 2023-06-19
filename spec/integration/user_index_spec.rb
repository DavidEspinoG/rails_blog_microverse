require 'rails_helper'

RSpec.describe 'user show view', type: :system do 
  let!(:user_one) { User.create name: 'Jose', posts_counter: 0 }
  let!(:user_two) { User.create name: 'Carlos', posts_counter: 0 }
  let!(:post) { Post.create author_id: user_two.id, comments_counter: 0, likes_counter: 0, title: 'title', text: 'something' }
  
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
    expect(page).to have_content('Posts: 1')
  end
  it 'should render the user bio' do 
    visit "users/#{user_two.id}"
    expect(page).to have_content('Bio')
  end
end