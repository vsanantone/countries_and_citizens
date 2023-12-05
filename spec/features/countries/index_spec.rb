require 'rails_helper'

RSpec.describe "Country Index" do
  describe "As a visitor When I visit '/countries" do
    it "shows the name of each country record in the system" do
      # For each country table
      # As a visitor
      # When I visit '/countries'
      # Then I see the name of each country record in the system
      #set up
      israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)
      usa = Country.create!(name: "USA", democratic: true, year_founded: 1776)
      phillipines = Country.create!(name: "Phillipines", democratic: true, year_founded: 1800)
      
      #action
      visit '/countries'

      #test
      expect(page).to have_content(israel.name)
      expect(page).to have_content(usa.name)
      expect(page).to have_content(phillipines.name)
    end

    it "shows country records ordered by date created" do
      # As a visitor
      # When I visit the Country index,
      # I see that records are ordered by most recently created first
      # And next to each of the records I see when it was created
      
      israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)
      usa = Country.create!(name: "USA", democratic: true, year_founded: 1776)
      phillipines = Country.create!(name: "Phillipines", democratic: true, year_founded: 1800)
      
      #action
      visit '/countries'

      #test
      expect(phillipines.name).to appear_before(usa.name)
      expect(usa.name).to appear_before(israel.name)
      expect(israel.name).to_not appear_before(phillipines.name)
   
      expect(page).to have_content("Created at: #{israel.created_at}")
      expect(page).to have_content("Created at: #{usa.created_at}")
      expect(page).to have_content("Created at: #{phillipines.created_at}")

      # expect("Created at: #{israel.created_at}").to appear_before("Created at: #{usa.created_at}")
      # expect("Created at: #{usa.created_at}").to appear_before("Created at: #{phillipines.created_at}")
    end

    it "has a link to Citizens index" do
      # As a visitor
      # When I visit any page on the site
      visit '/countries' 
      # Then I see a link at the top of the page that takes me to the Country Index
      expect(page).to have_link("Citizens Index", href: '/citizens')
    end

    it "has a link to Countries index" do
      # As a visitor
      # When I visit any page on the site
      visit '/countries' 
      # Then I see a link at the top of the page that takes me to the Country Index
      expect(page).to have_link("Countries Index", href: '/countries')
    end

    it "has a link to create a new Country record, 'New Country'" do
      israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)
      usa = Country.create!(name: "USA", democratic: true, year_founded: 1776)
      phillipines = Country.create!(name: "Phillipines", democratic: true, year_founded: 1800)
      
      # When I visit the Country Index page
      visit '/countries'
      # Then I see a link to create a new Country record, "New Country"
      expect(page).to have_link("New Country", href: '/countries/new')
      # When I click this link
      click_link('New Country')
      # Then I am taken to '/Countries/new' where I  see a form for a new Country record
      expect(current_path).to eq('/countries/new')
    end
    it "display's a Country's edit link" do
      israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)
      usa = Country.create!(name: "USA", democratic: true, year_founded: 1776)
      phillipines = Country.create!(name: "Phillipines", democratic: true, year_founded: 1800)
      
      # User Story 17, Country Update From Countries Index Page 
      # As a visitor
      # When I visit the Countries index page
      visit "/countries"
      # Next to every Country, I see a link to edit that Country's info
      Country.all.each do |country|
        save_and_open_page
        expect(page).to have_link("Edit #{country.name}", href:"/countries/#{country.id}/edit")
      end
      # When I click the link
      # I should be taken to that Country's edit page where I can update its information just like in User Story 12
    end
  end
end


