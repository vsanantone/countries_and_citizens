require 'rails_helper'

RSpec.describe "Citizen Index" do
  before(:each) do
    israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)
    usa = Country.create!(name: "USA", democratic: true, year_founded: 1776)
    phillipines = Country.create!(name: "Phillipines", democratic: true, year_founded: 1800)
    
    shilo = Citizen.create!(name: "Shilo", employed: true, age: 28, country_id: israel.id)
    rifkah = israel.citizens.create!(name: "Rifkah", employed: false, age: 23)
    artemy = Citizen.create!(name: "Artemy", employed: true, age: 30, country: usa)
    marjory = phillipines.citizens.create!(name: "Marjory", employed: true, age: 35)
  end

  describe "As a visitor" do
    xit "displays each Citizen in the system including the Citizen's attributes" do

      # When I visit '/citizens'
      visit '/citizens'

      # Then I see each Citizen in the system including the Citizen's attributes
      expect(page).to have_content("Shilo")
      expect(page).to have_content("Is Employed")
      expect(page).to have_content("Age: 28")
      expect(page).to have_content("Country: Israel")

      expect(page).to have_content("Rifkah")
      expect(page).to have_content("Is Not Employed")
      expect(page).to have_content("Age: 23")
      expect(page).to have_content("Country: Israel")

      expect(page).to have_content("Artemy")
      expect(page).to have_content("Is Employed")
      expect(page).to have_content("Age: 30")
      expect(page).to have_content("Country: USA")

      expect(page).to have_content("Marjory")
      expect(page).to have_content("Is Employed")
      expect(page).to have_content("Age: 35")
      expect(page).to have_content("Country: Phillipines")

      # (data from each column that is on the citizens table)
    end
  
    it "has a link to Citizen's index" do
      # When I visit any page on the site
      visit '/citizens' 
      # Then I see a link at the top of the page that takes me to the Citizen Index
      expect(page).to have_link("Citizens Index", href: '/citizens')

      click_link("Citizens Index")

      expect(current_path).to eq('/citizens')
    end

    it "has a link to Countries index" do
      # When I visit any page on the site
      visit '/citizens' 
      # Then I see a link at the top of the page that takes me to the Citizen Index
      expect(page).to have_link("Countries Index", href: '/countries')
    end

    it "displays records where the boolean column is true" do
      # User Story 15, Citizen Index only shows `true` Records 
      # When I visit the Citizens index
      visit "/citizens"
      # Then I only see records where the boolean column is `true`
      expect(page).to have_content("Shilo")
      expect(page).to have_content("Artemy")
      expect(page).to have_content("Marjory")
      expect(page).to_not have_content("Rifkah")
    end

    it "displays a Citizen's edit link" do
      # User Story 18, Citizens Update From Citizens Index Page 
      # When I visit the `Citizens` index page or a Country `citizens` index page
      visit "/citizens"
      # Next to every citizen, I see a link to edit that citizen's info
      Citizen.employed.each do |citizen|
        expect(page).to have_link("Edit #{citizen.name}", href: "/citizens/#{citizen.id}/edit")
      end
      # When I click the link
      # I should be taken to that `citizen`s edit page where I can update its information just like in User Story 14
    end
  end
end