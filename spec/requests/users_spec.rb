require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'GET /index' do
    it "shows the static text" do 
      visit 'http://localhost:3000'
      expect(page).to have_content('List all users')
    end
  end
end
