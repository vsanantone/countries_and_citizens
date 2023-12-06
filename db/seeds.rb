# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


    israel = Country.create!(name: "Israel", democratic: true, year_founded: 1948)
    usa = Country.create!(name: "USA", democratic: true, year_founded: 1776)
    phillipines = Country.create!(name: "Phillipines", democratic: true, year_founded: 1800)
    
    shilo = Citizen.create!(name: "Shilo", employed: true, age: 28, country_id: israel.id)
    rifkah = israel.citizens.create!(name: "Rifkah", employed: false, age: 23)
    levi = israel.citizens.create!(name: "Levi", employed: true, age: 22)

    artemy = Citizen.create!(name: "Artemy", employed: true, age: 30, country: usa)
    bob = Citizen.create!(name: "Bob", employed: true, age: 38, country: usa)
    mariah = Citizen.create!(name: "Mariah", employed: true, age: 32, country: usa)


    marjory = phillipines.citizens.create!(name: "Marjory", employed: true, age: 35)
    kathy = phillipines.citizens.create!(name: "Kathy", employed: false, age: 28)
    manny = phillipines.citizens.create!(name: "Manny", employed: true, age: 48)


