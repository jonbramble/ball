Feature: Admin users
 The admin must be able to manage the users

   Background:
   	Given I am a signed in "admin"
	And I visit the admin page

    Scenario: Admin can see users
	Then I should see a table of all users
        And I should see an add users link

     Scenario: Admin can see users
	When I visit new users page
	Then I should see an new user form
	
