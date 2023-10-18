require 'rails_helper'

RSpec.feature "Country's Citizens index" do
  it "displays the citizens associated with the country and their attributes" do
    israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)
    usa = Country.create!(name: "USA", democratic: true, year_founded: 1776)
    phillipines = Country.create!(name: "Phillipines", democratic: true, year_founded: 1800)
    
    shilo = Citizen.create!(name: "Shilo", employed: true, age: 28, country_id: israel.id)
    rifkah = israel.citizens.create!(name: "Rifkah", employed: false, age: 23)
    artemy = Citizen.create!(name: "Artemy", employed: true, age: 30, country: usa)
    marjory = phillipines.citizens.create!(name: "Marjory", employed: true, age: 35)

    # As a visitor
    # When I visit '/Countries/:Country_id/Citizens'
    # Then I see each Citizen that is associated with that Country with each Citizen's attributes
    # (data from each column that is on the Citizen table)

    # When I visit '/Countries/:Country_id/Citizens'
    visit "/countries/#{israel.id}/citizens"

    # Then I see each Citizen that is associated with that Country with each Citizen's name, employment status, and age)
    expect(page).to have_content("Shilo")
    expect(page).to have_content("Employed: true")
    expect(page).to have_content("28")
    
    expect(page).to have_content("Rifkah")
    expect(page).to have_content("Employed: false")
    expect(page).to have_content("23")

    expect(page).to_not have_content("Artemy")
    # expect(page).to_not have_content("Marjory")
  end
end