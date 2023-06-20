require 'rails_helper'

RSpec.describe 'post#show', type: :system do
  let!(:user_one) { User.create name: 'Oscar', posts_counter: 0 }
  let!(:user_two) { User.create name: 'Carlos', posts_counter: 0 }
  let!(:post) do
    Post.create author_id: user_two.id, comments_counter: 0, likes_counter: 0, title: 'title', text: 'something'
  end
  let!(:comment_one) { Comment.create author: user_one, post:, text: 'hello world' }
  let!(:comment_two) { Comment.create author: user_two, post:, text: 'hello rails' }

  describe 'Rendering' do
    it 'Should show the post title' do
      visit "users/#{user_two.id}/posts/#{post.id}"
      expect(page).to have_content(post.title)
    end

    it 'Should show the post author name' do
      visit "users/#{user_two.id}/posts/#{post.id}"
      expect(page).to have_content(user_two.name)
    end

    it 'Should show the post comments counter' do
      visit "users/#{user_two.id}/posts/#{post.id}"

      expect(page).to have_content("Comments: #{post.comments_counter}")
    end

    it 'Should show the post likes counter' do
      visit "users/#{user_two.id}/posts/#{post.id}"

      expect(page).to have_content("Likes: #{post.likes_counter}")
    end

    it 'Should show the post body' do
      visit "users/#{user_two.id}/posts/#{post.id}"

      expect(page).to have_content(post.text)
    end

    it 'Should show the post commenter name' do
      visit "users/#{user_two.id}/posts/#{post.id}"

      expect(page).to have_content(user_one.name)
      expect(page).to have_content(user_two.name)
    end

    it 'Should show the post commenter name' do
      visit "users/#{user_two.id}/posts/#{post.id}"

      expect(page).to have_content(comment_one.text)
      expect(page).to have_content(comment_two.text)
    end
  end
end
