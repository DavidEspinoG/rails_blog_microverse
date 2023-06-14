require 'rails_helper'

RSpec.describe 'Users' do
  let(:user) {User.create name: 'Jose', posts_counter: 0 }
  describe 'GET /index' do
    before { get '/' }
    it 'has an status 200' do
      expect(response.status).to eq(200)
    end
    it 'shows the static placeholder text' do
      expect(body).to match('<h1>List all users</h1>')
    end
    it 'shows the correct template' do
      expect(response).to render_template('index')
    end
  end
  describe 'GET /show' do
    before { get "/users/#{user.id}" }
    it 'has a 200 status' do
      expect(response.status).to eq(200)
    end
    it 'renders the correct template' do
      expect(response).to render_template('show')
    end
  end
end
