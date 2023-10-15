# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

![](./israel.png)
[ ] done

User Story 1, Country Index 

For each country table
As a visitor
When I visit '/countries'
Then I see the name of each country record in the system

[ ] done

User Story 2, Countries Show 

As a visitor
When I visit '/countries/:id'
Then I see the citizen with that id including the countries' attributes
(data from each column that is on the countries table)

[ ] done

User Story 3, Citizen Index 

As a visitor
When I visit '/citizens'
Then I see each Citizen in the system including the Citizen's attributes
(data from each column that is on the citizens table)

[ ] done

User Story 4, Citizen Show 

As a visitor
When I visit '/Citizens/:id'
Then I see the Citizen with that id including the Citizen's attributes
(data from each column that is on the Citizen table)
[ ] done

User Story 5, Country Citizen Index 

As a visitor
When I visit '/Countries/:Country_id/Citizens'
Then I see each Citizen that is associated with that Country's with each Citizen's attributes
(data from each column that is on the Citizen table)