require 'rails_helper'

RSpec.describe 'User integration spec', type: :system do
  describe 'User index' do
    let!(:user_one) { User.create name: 'Jose', posts_counter: 0 }
    let!(:user_two) { User.create name: 'Carlos', posts_counter: 0 }
    let!(:post) { Post.new author: user_two }

    it 'Should render users names' do
      visit '/'
      expect(page).to have_content('Jose')
      expect(page).to have_content('Carlos')
    end

    it 'Should render number of post for each user' do
      visit '/'
      expect(page).to have_content('Number of posts: 0')
      expect(page).to have_content('Number of posts: 1')
    end
  end
end
