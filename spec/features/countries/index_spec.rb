require 'rails_helper'

RSpec.describe "Country Index" do
  describe "As a visitor When I visit '/countries" do
    it "shows the name of each country record in the system" do
      # For each country table
      # As a visitor
      # When I visit '/countries'
      # Then I see the name of each country record in the system
      #set up
      c1 = Country.create!(name: "Israel", democratic: true, year_founded: 1948)
      c2 = Country.create!(name: "USA", democratic: true, year_founded: 1776)
      c3 = Country.create!(name: "Phillipines", democratic: true, year_founded: 1800)
    
      #action
      visit '/countries'

      #test
      # save_and_open_page
      expect(page).to have_content(c1.name)
    end
  end
end