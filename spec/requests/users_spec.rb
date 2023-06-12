require 'rails_helper'

RSpec.describe 'Users' do
  describe 'GET /index' do
    it 'has an status 200' do
      get '/'
      expect(response.status).to eq(200)
    end
    it "shows the static text" do 
      get '/'
      expect(body).to match('<h1>List all users</h1>')
    end
    it 'shows the correct view' do 
      get '/'
      expect(response).to render_template('list')
    end
  end
end


