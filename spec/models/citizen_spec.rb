require 'rails_helper'

RSpec.describe Citizen, type: :model do
  describe "Relationships" do
    it { should belong_to :country }
  end

  describe "class methods" do
    it "returns all citizens that are employed" do
      israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)
      usa = Country.create!(name: "USA", democratic: true, year_founded: 1776)
      phillipines = Country.create!(name: "Phillipines", democratic: true, year_founded: 1800)
      
      shilo = Citizen.create!(name: "Shilo", employed: true, age: 28, country_id: israel.id)
      rifkah = israel.citizens.create!(name: "Rifkah", employed: false, age: 23)
      artemy = Citizen.create!(name: "Artemy", employed: true, age: 30, country: usa)
      marjory = phillipines.citizens.create!(name: "Marjory", employed: true, age: 35)
      expect(Citizen.employed).to eq([shilo, artemy, marjory])
    end

    it "sorts citizens by name" do
      israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)
      shilo = Citizen.create!(name: "Shilo", employed: true, age: 28, country_id: israel.id)
      rifkah = israel.citizens.create!(name: "Rifkah", employed: false, age: 23)
      artemy = Citizen.create!(name: "Artemy", employed: true, age: 30, country: israel)
      marjory = israel.citizens.create!(name: "Marjory", employed: true, age: 35)
      
      expect(Citizen.alpha_sort("name")).to eq([artemy, marjory, rifkah, shilo])
    end
  end
end
