require 'rails_helper'

RSpec.describe Country do
  describe "Relationships" do
    it { should have_many :citizens }
  end
  
  describe "class methods" do
    it "returns all countries in order by most recently created" do
      israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)
      usa = Country.create!(name: "USA", democratic: true, year_founded: 1776)
      phillipines = Country.create!(name: "Phillipines", democratic: true, year_founded: 1800)
      
      expect(Country.countries_ordered).to eq([phillipines, usa, israel])
    end
  end

  describe "instance methods" do
    it "counts citizens of a country" do
      israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)
      expect(israel.census).to eq(0)

      shilo = Citizen.create!(name: "Shilo", employed: true, age: 28, country_id: israel.id)
      rifkah = israel.citizens.create!(name: "Rifkah", employed: false, age: 23)
      expect(israel.census).to eq(2)
    end
  end
end