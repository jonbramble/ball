Feature: Admin users
 The admin must be able to manage the users

   Background:
   	Given I am a signed in "admin"
	And I visit the admin page

    Scenario: Admin can see users
	Then I should see a table of all users
        And I should see an add users link
        And I should see summary links

     Scenario: Admin can see users
	When I visit new users page
	Then I should see an new user form

     Scenario: Admin can add a new user
        When I visit new users page
        And I add a new guest
        Then I should see a table of all users

	
