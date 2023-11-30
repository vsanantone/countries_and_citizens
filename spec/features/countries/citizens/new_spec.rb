require 'rails_helper'

RSpec.feature "Country Citizen New" do
  it "can be linked to from Country Citizens index" do
    israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)
    # User Story 13, Country Citizen Creation 
    # As a visitor
    # When I visit a Country Citizen Index page
    visit "/countries/#{israel.id}/citizens" 
    # Then I see a link to add a new citizen for that country "Create Citizen"
    expect(page).to have_link("Create Citizen")
    # When I click the link
    click_link("Create Citizen")
    # I am taken to '/parents/:parent_id/child_table_name/new' 
    expect(current_path).to eq("/countries/#{israel.id}/citizens/new")
  end

  it "displays a form" do
    # where I see a form to add a new naturalized citizen
    israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)
    visit "/countries/#{israel.id}/citizens/new"
    expect(page).to have_field(:name)
    expect(page).to have_field(:employed)
    expect(page).to have_field(:age)
  end

  it "creates a new citizen" do
    israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)
    visit "/countries/#{israel.id}/citizens/new"
    # When I fill in the form with the citizen's attributes:
    fill_in(:name, with: "Levi")
    select("true", from: :employed)
    fill_in(:age, with: 23)
    # And I click the button "Create Citizen"
    click_button("Create Citizen")
    # Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
    # a new child object/row is created for that parent,
    # and I am redirected to the Parent Childs Index page where I can see the new child listed
    expect(current_path).to eq("/countries/#{israel.id}/citizens")
    expect(page).to have_content("Levi")
    expect(page).to have_content("Employed: true")
    expect(page).to have_content("23")
  end

end