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
        And I should see a table of all users

      Scenario: User receives a welcome email
        When I visit new users page
        And I add a new guest with name "A Guest" and email "guest@party.com"
        Then "guest@party.com" should receive an email with subject "Astbury May Ball 2013"
        When "guest@party.com" opens the email
        Then they should see "Welcome A Guest" in the email body

	
