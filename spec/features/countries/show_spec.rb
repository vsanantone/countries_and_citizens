require 'rails_helper'

RSpec.describe "describing country features" do
  describe "Country Index" do
    it "shows the country with the id including the country's attributes" do
      # As a visitor
      # When I visit '/countries/:id'
      # Then I see the countries with that id including the countries' attributes
      # (data from each column that is on the countries table)
      #set up
      israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)
      usa = Country.create!(name: "USA", democratic: true, year_founded: 1776)
      phillipines = Country.create!(name: "Phillipines", democratic: true, year_founded: 1800)
    
      #action
      visit "/countries/#{israel.id}"

      #test
      # save_and_open_page
      expect(page).to have_content(israel.name)
      expect(page).to have_content(israel.democratic)
      expect(page).to have_content(israel.year_founded)
    end
  end

  describe "Country citizen Count" do
    it "I see a count of the number of citizen's associated with this Country" do
      # Country Citizen Count
      # As a visitor
      # When I visit a Country's show page
      #I see a count of the number of citizen's associated with this Country
      
      israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)
      usa = Country.create!(name: "USA", democratic: true, year_founded: 1776)
      phillipines = Country.create!(name: "Phillipines", democratic: true, year_founded: 1800)
      
      shilo = Citizen.create!(name: "Shilo", employed: true, age: 28, country_id: israel.id)
      rifkah = israel.citizens.create!(name: "Rifkah", employed: false, age: 23)
      artemy = Citizen.create!(name: "Artemy", employed: true, age: 30, country: usa)
      marjory = phillipines.citizens.create!(name: "Marjory", employed: true, age: 35)
  
      #action
      visit "/countries/#{israel.id}"

      #test
      expect(page).to have_content(israel.name)
      expect(page).to have_content(israel.democratic)
      expect(page).to have_content(israel.year_founded)
      expect(page).to have_content("How many citizens? 2")
    end
  end
end