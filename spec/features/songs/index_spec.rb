require 'rails_helper'

RSpec.describe 'Songs Index Page' do

  describe "as a user" do
    it 'Shows all the songs in the system' do
      prince = Artist.create!(name: 'Prince')
      rtj = Artist.create!(name: 'Run The Jewels')

      beret = prince.songs.create!(title: 'Raspberry Beret', length: 345, play_count: 34)
      rain = prince.songs.create!(title: 'Purple Rain', length: 524, play_count: 19)

      legend = rtj.songs.create!(title: 'Legend Has It', length: 2301, play_count: 2300000)
      talk = rtj.songs.create!(title: 'Talk to Me', length: 2301, play_count: 2300000)

      visit '/songs'

      expect(page).to have_content(beret.title)
      expect(page).to have_content(rain.title)
      expect(page).to have_content(beret.play_count)
      expect(page).to have_content(rain.play_count)

      expect(page).to have_content(legend.title)
      expect(page).to have_content(talk.title)
      expect(page).to have_content(legend.play_count)
      expect(page).to have_content(talk.play_count)
    end
  end
end
