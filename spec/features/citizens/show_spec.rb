require 'rails_helper'

RSpec.describe "Citizen Show" do
  describe "As a visitor" do
    it "displays a Citizen in the system including the Citizen's attributes" do
    # As a visitor
    israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)
    usa = Country.create!(name: "USA", democratic: true, year_founded: 1776)
    phillipines = Country.create!(name: "Phillipines", democratic: true, year_founded: 1800)
    
    shilo = Citizen.create!(name: "Shilo", employed: true, age: 28, country_id: israel.id)
    rifkah = israel.citizens.create!(name: "Rifkah", employed: false, age: 23)
    artemy = Citizen.create!(name: "Artemy", employed: true, age: 30, country: usa)
    marjory = phillipines.citizens.create!(name: "Marjory", employed: true, age: 35)


    # As a visitor
    # When I visit '/Citizens/:id'
    # Then I see the Citizen with that id including the Citizen's attributes
    # (data from each column that is on the Citizen table)
    
    # When I visit '/Citizens/:id'
    visit "/citizens/#{shilo.id}"
    # save_and_open_page

    # Then I see the Citizen with that id including the Citizen's attributes
    expect(page).to have_content(shilo.name)
    expect(page).to have_content("Is Employed")
    expect(page).to have_content("Age: #{shilo.age}")
    expect(page).to have_content("Country: Israel")

    expect(page).to_not have_content("Rifkah")
    # (data from each column that is on the Citizen table)
  end
  end
end