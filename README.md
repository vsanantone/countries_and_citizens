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

Iteration 1
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

User Story 6, Country Index sorted by Most Recently Created 

As a visitor
When I visit the Country index,
I see that records are ordered by most recently created first
And next to each of the records I see when it was created

[ ] done

User Story 7, Country citizen Count

As a visitor
When I visit a Country's show page
I see a count of the number of citizen's associated with this Country

User Story 8, Citizen Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the Citizen Index
[ ] done

User Story 9, Country Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the Country Index
[ ] done

User Story 10, Country Citizen Index Link

As a visitor
When I visit a Country's show page ('/Countries/:id')
Then I see a link to take me to that Country's `Citizens` page ('/Countries/:id/Citizens')

Iteration 2

CRUD
[ ] done

User Story 11, Country Creation 

As a visitor
When I visit the Country Index page
Then I see a link to create a new Country record, "New Country"
When I click this link
Then I am taken to '/Countries/new' where I  see a form for a new Country record
When I fill out the form with a new Country's attributes:
And I click the button "Create Country" to submit the form
Then a `POST` request is sent to the '/Countries' route,
a new Country record is created,
and I am redirected to the Country Index page where I see the new Country displayed.