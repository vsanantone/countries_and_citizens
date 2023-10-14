require 'rails_helper'

RSpec.describe "describing country features" do
  describe "Country Index" do
    it "shows the country with the id including the country's attributes" do
      # As a visitor
      # When I visit '/countries/:id'
      # Then I see the countries with that id including the countries' attributes
      # (data from each column that is on the countries table)
      #set up
      c1 = Country.create!(name: "Israel", democratic: true, year_founded: 1948)
      c2 = Country.create!(name: "USA", democratic: true, year_founded: 1776)
      c3 = Country.create!(name: "Phillipines", democratic: true, year_founded: 1800)
    
      #action
      visit "/countries/#{c1.id}"

      #test
      # save_and_open_page
      expect(page).to have_content(c1.name)
      expect(page).to have_content(c1.democratic)
      expect(page).to have_content(c1.year_founded)
    end
  end
end