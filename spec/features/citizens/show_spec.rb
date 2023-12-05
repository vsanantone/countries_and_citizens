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
      visit "/citizens/#{shilo.id}"

      # Then I see the Citizen with that id including the Citizen's attributes
      expect(page).to have_content(shilo.name)
      expect(page).to have_content("Is Employed")
      expect(page).to have_content("Age: #{shilo.age}")
      expect(page).to have_content("Country: Israel")

      expect(page).to_not have_content("Rifkah")
      # (data from each column that is on the Citizen table)
    end

    it "it is linked to from the Citizen's Show page" do
      israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)
      citizen = israel.citizens.create!(name: "Rifkah", employed: false, age: 35)

      # User Story 14, Citizen Update 
      # As a visitor
      # When I visit a Citizen's Show page
      visit "/citizens/#{citizen.id}"
      # Then I see a link to update that Citizen "Update Citizen"
      expect(page).to have_link("Update Citizen")
      # When I click the link
      click_link("Update Citizen")
      # I am taken to '/child_table_name/:id/edit'
      expect(current_path).to eq("/citizens/#{citizen.id}/edit")
    end

    it "displays a form to edit the Citizen's current attributes" do
      # Where I see a form to edit the Citizen's attributes:
      israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)
      citizen = israel.citizens.create!(name: "Rifkah", employed: false, age: 35)

      visit "/citizens/#{citizen.id}/edit"
      expect(page).to have_field(:name)
      expect(page).to have_field(:employed)
      expect(page).to have_field(:age)
    end

    it "updates the Citizen's current attributes" do
      israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)
      citizen = israel.citizens.create!(name: "Rifkah", employed: false, age: 35)

      visit "/citizens/#{citizen.id}/edit"
      # When I fill in the form with the citizen's new attributes:
      fill_in(:name, with: "David")
      select("true", from: :employed)
      fill_in(:age, with: 36)
      # When I click the button to submit the form "Update Citizen"
      click_button("Update Citizen")
      # Then a `PATCH` request is sent to '/child_table_name/:id',
      # the Citizen's data is updated,
      # and I am redirected to the Citizen Show page where I see the Citizen's updated information
      expect(current_path).to eq("/citizens/#{citizen.id}")
      expect(page).to have_content("David")
      expect(page).to have_content("Is Employed")
      expect(page).to have_content("36")
      # ActiveRecord
    end
  end

end