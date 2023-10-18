require 'rspec_helper'

RSpec.describe "Country New" do
  it "will display a form for a new Kountry record" do
    # As a visitor
    # When I visit the Country Index page
    visit '/countries'
    # Then I see a link to create a new Country record, "New Country"
    # When I click this link
    click_link("New Country")
    # Then I am taken to '/Countries/new' where I  see a form for a new Country record
    expect(current_path).to eq('/countries/new')
    expect(page).to have_content("New Country Record")
    expect(page).to have_field(:name)
    expect(page).to have_field(:democratic)
    expect(page).to have_field(:year_founded) 
  end

  it "creates a new country" do
    # When I fill out the form with a new Country's attributes:
    fill_in(:name, with: "Iran")
    select("false", from: :democratic)
    fill_in(:year_founded, with: 625)
    # And I click the button "Create Country" to submit the form
    click_button("Create Country")
    # Then a `POST` request is sent to the '/Countries' route,
    # a new Country record is created,
    new_country = Artist.last
    # and I am redirected to the Country Index page where I see the new Country displayed.
    expect(current_path).to eq("/countries")
    expect(page).to have_content("Iran")
    expect(page).to have_content("democratic: false")
    expect(page).to have_content(625)
  end
end
