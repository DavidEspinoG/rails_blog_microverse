require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { User.create name: 'Jose', posts_counter: 0 }
  let(:post) { Post.create title: 'title', likes_counter: 0, comments_counter: 0 }
  describe 'GET /index' do
    before { get "/users/#{user.id}/posts" }
    it 'should have a 200 status' do
      expect(response.status).to eq(200)
    end
    it 'should render the correct view ' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET /show' do
    before { get "/users/#{user.id}/posts/#{post.id}" }
    it 'should have a 200 status' do
      expect(response.status).to eq(200)
    end
    it 'should render the correct view ' do
      expect(response).to render_template('posts/index')
    end
  end
end
