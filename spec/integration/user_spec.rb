require 'rails_helper'

RSpec.describe 'User integration spec', type: :system do
  describe 'User index' do
    let!(:user_one) { User.create name: 'Jose', posts_counter: 0 }
    let!(:user_two) { User.create name: 'Carlos', posts_counter: 0 }
    let!(:post) { Post.create author_id: user_two.id, comments_counter: 0, likes_counter: 0, title: 'title' }

    it 'Should render users names' do
      visit '/'
      expect(page).to have_content('Jose')
      expect(page).to have_content('Carlos')
    end
    it 'Should render users profile pictures' do
      visit '/'
      expect(page).to have_content('Jose profile picture')
      expect(page).to have_content('Carlos profile picture')
    end

    it 'Should render number of post for each user' do
      visit '/'
      expect(page).to have_content('Number of posts: 0')
      expect(page).to have_content('Number of posts: 1')
    end
    
   
    it 'should redirect to users/:id view' do
      visit '/'
      click_link href: "/users/#{user_one.id}"
      expect(page).to have_current_path("/users/#{user_one.id}") 
    end
  end
end
