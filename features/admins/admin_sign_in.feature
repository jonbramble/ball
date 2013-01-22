Feature: Admin Page
  To manage users
  the admin must be able to access the admin pages

  Scenario: Admin can see admin pages
	Given I am an admin
	When I visit the login page
	And enter valid login credentials
	When I visit the admin page
	Then I should see the admin page
	And I should see the title "Admin Area" 

    Scenario: Normal users cannot see admin pages
	Given I am a user
	When I visit the login page
	And enter valid login credentials
	When I visit the admin page
	Then I should not see the admin page 

    Scenario: Not logged in users cannot see admin pages
	When I visit the admin page
	Then I should not see the admin page 
