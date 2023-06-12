require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'GET /index' do
    it 'has an status 200' do
      get '/'
      expect(response.status).to eq(200)
    end
    it "shows the static text" do 
      visit 'http://localhost:3000'
      expect(page).to have_content('List all users')
    end
    it 'should render the correct view' do 
      get '/'
      response.should render_template('list')
    end
  end
end


