Feature: Home page links
  The users must see a login link on the home page

  Scenario: Login link
	Given I am a user
	And I visit the site
	Then I should see a sign in link

  
  Scenario: Login link
	Given I am a user
	When I visit the login page
	And enter valid login credentials
	Then I should see a sign out link
	And no sign in link
	
