require 'rails_helper'

RSpec.describe "Country Edit" do
  it "edits country info" do  
    country = Country.create!(name: "Israel", democratic: true, year_founded: 1948)
  # User Story 12, Parent Update 
    # As a visitor
    # When I visit a Country show page
    visit "countries/#{country.id}"
    # Then I see a link to update the Country "Update Country"
    expect(page).to have_link("Update Country", href: "/countries/#{country.id}/edit")
    # When I click the link "Update Country"
    click_link("Update Country")

    # Then I am taken to '/Countrys/:id/edit' where I  see a form to edit the Country's attributes:
    expect(current_path).to eq("/countries/#{country.id}/edit")
    expect(page).to have_content("Edit Country Attributes")
    expect(page).to have_field(:name)
    expect(page).to have_field(:democratic)
    expect(page).to have_field(:year_founded)
    # When I fill out the form with updated information
    fill_in(:name, with: "Ghana")
    select("false", from: :democratic)
    fill_in(:year_founded, with: 1480)
    # And I click the button to submit the form
    click_button("Update Country")
    # Then a `PATCH` request is sent to '/Countries/:id',
    # the Country's info is updated,
    # and I am redirected to the Country's Show page where I see the Country's updated info
    # end
    expect(current_path).to eq("/countries/#{country.id}")
    expect(page).to have_content("Ghana")
    expect(page).to have_content("false")
    expect(page).to have_content(1480)
  end
end