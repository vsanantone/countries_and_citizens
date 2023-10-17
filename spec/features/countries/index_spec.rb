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
      # save_and_open_page
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
  end
end