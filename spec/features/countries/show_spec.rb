require 'rails_helper'

RSpec.describe "Country Show Page" do
    it "shows the country with the id including the country's attributes" do
      #set up
      israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)
      usa = Country.create!(name: "USA", democratic: true, year_founded: 1776)
      phillipines = Country.create!(name: "Phillipines", democratic: true, year_founded: 1800)
      #action
      visit "/countries/#{israel.id}"
      #test
      expect(page).to have_content(israel.name)
      expect(page).to have_content(israel.democratic)
      expect(page).to have_content(israel.year_founded)
  end

  describe "Country Citizen Count" do
    it "I see a count of the number of citizen's associated with this Country" do
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

  describe "Country Citizen Index Link" do
    it "displays a link that redirects to the Country's Citizens' index page" do
      israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)

      visit "/countries/#{israel.id}"
      expect(page).to have_link("Israel's Citizen Index", href: "/countries/#{israel.id}/citizens")
    end
  end

    it "deletes a country" do
      israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)
      Country.create!(name: "USA", democratic: true, year_founded: 1776)
      Country.create!(name: "Phillipines", democratic: true, year_founded: 1800)
      Country.create!(name: "New Zealand", democratic: true, year_founded: 1999)
      
      # User Story 19, Country Delete 
      # As a visitor
      # When I visit a Country show page
      visit "/countries/#{israel.id}"
      # Then I see a link to delete the Country
      expect(page).to have_link("Delete Country", href: "/countries/#{israel.id}")
      # When I click the link "Delete Country"
      click_link("Delete Country")
      # Then a 'DELETE' request is sent to '/countries/:id',
      # the country is deleted, and all citizen records are deleted
      # and I am redirected to the Countries index page where I no longer see this country
      expect(current_path).to eq("/countries")
      Country.all.each do |country|
        expect(page).to have_content(country.name)
      end
      expect(page).to_not have_content("Israel")
    end
 

  # describe "Country Citizen Index Link" do
  #   it "displays a link that redirects to the Country's Citizens' index page" do
  #     israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)

  #     visit "/countries/#{israel.id}"
  #     expect(page).to have_link("Israel's Citizen Index") 
  #   end

  #   it "redirects user to the Country Citizen Index page" do
  #     israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)

  #     visit "/countries/#{israel.id}"
  #     click_link("Israel's Citizen Index") 
  #     expect(page).to have_current_path("/countries/#{israel.id}/citizens")
  #   end
  # end
end