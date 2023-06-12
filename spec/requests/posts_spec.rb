require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before { get '/users/10/posts' }
    it 'should have a 200 status' do
      expect(response.status).to eq(200)
    end
    it 'should render the correct view ' do
      expect(response).to render_template('list')
    end
    it 'should render the correct text' do
      expect(body).to match('<h2>Posts of user with id: 10</h2>')
    end
  end

  describe 'GET /show' do
    before { get '/users/10/posts/90' }
    it 'should have a 200 status' do
      expect(response.status).to eq(200)
    end
    it 'should render the correct view ' do
      expect(response).to render_template('show')
    end
    it 'should render the correct text' do
      expect(body).to match('<h2>Author: User with id 10</h2>')
    end
  end
end
