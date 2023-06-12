require 'rails_helper'

RSpec.describe 'Users' do
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
    before { get '/users/10' }
    it 'has a 200 status' do
      expect(response.status).to eq(200)
    end
    it 'renders the correct template' do
      expect(response).to render_template('show')
    end
    it 'shows the correct placeholder text' do
      expect(body).to match('<h2>Info about user with id: 10</h2>')
    end
  end
end
