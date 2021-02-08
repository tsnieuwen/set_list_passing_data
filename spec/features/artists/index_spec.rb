require 'rails_helper'

RSpec.describe 'Artists Index Page' do

  describe "as a user" do
    it 'Shows all the artists in the system' do
      prince = Artist.create!(name: 'Prince')
      rtj = Artist.create!(name: 'Run The Jewels')

      visit '/artists'
      save_and_open_page

      expect(page).to have_content(prince.name)
      expect(page).to have_content(rtj.name)
    end
  end
end
