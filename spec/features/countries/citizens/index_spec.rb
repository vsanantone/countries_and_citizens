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
    expect(page).to_not have_content("Marjory")
  end

  it "has link to Sort Citizens in Alphabetical Order by name " do
    israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)
    usa = Country.create!(name: "USA", democratic: true, year_founded: 1776)

    
    shilo = Citizen.create!(name: "Shilo", employed: true, age: 28, country_id: israel.id)
    rifkah = israel.citizens.create!(name: "Rifkah", employed: false, age: 23)
    artemy = Citizen.create!(name: "Artemy", employed: true, age: 30, country: israel)
    marjory = israel.citizens.create!(name: "Marjory", employed: true, age: 35)
    brad = usa.citizens.create!(name: "Brad", employed: true, age: 35)


    # User Story 16, Sort Country's Citizen in Alphabetical Order by name 
    # As a visitor
    # When I visit the Country's Citizen Index Page
    visit "/countries/#{israel.id}/citizens"
    # Then I see the citizens of the country in order of creation
    expect(page.all('.citizen')[0]).to have_content("Shilo")
    expect(page.all('.citizen')[1]).to have_content("Rifkah")
    expect(page.all('.citizen')[2]).to have_content("Artemy")
    expect(page.all('.citizen')[3]).to have_content("Marjory")
    expect(page).to_not have_content("Brad")
    save_and_open_page
    # Then I see a link to sort citizens in alphabetical order
    expect(page).to have_link("Alphabetize Citizens")
    # When I click on the link
    click_link("Alphabetize Citizens")
    # I'm taken back to the Country's Citizen Index Page where I see all of the Country's Citizens in alphabetical order
    expect(current_path).to eq("/countries/#{israel.id}/citizens")

    expect(page.all('.citizen')[0]).to have_content("Artemy")
    expect(page.all('.citizen')[1]).to have_content("Marjory")
    expect(page.all('.citizen')[2]).to have_content("Rifkah")
    expect(page.all('.citizen')[3]).to have_content("Shilo")
    expect(page).to_not have_content("Brad")
    save_and_open_page

  end

  it "displays a Citizen's edit link" do
    israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)

    shilo = Citizen.create!(name: "Shilo", employed: true, age: 28, country_id: israel.id)
    rifkah = israel.citizens.create!(name: "Rifkah", employed: false, age: 23)
    artemy = Citizen.create!(name: "Artemy", employed: true, age: 30, country: israel)
    marjory = israel.citizens.create!(name: "Marjory", employed: true, age: 35)

    # User Story 18, Citizen's Update From Citizens Index Page 
    # When I visit the `Citizens` index page or a Country `citizens` index page
    visit "/countries/#{israel.id}/citizens"

    # Next to every citizen, I see a link to edit that citizen's info
    Citizen.all.each do |citizen|
      expect(page).to have_link("Edit #{citizen.name}", href: "/citizens/#{citizen.id}/edit")
    end
    # When I click the link
    # I should be taken to that `citizen`s edit page where I can update its information just like in User Story 14
  end
end