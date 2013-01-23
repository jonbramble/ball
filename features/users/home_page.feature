Feature: Home page links
  The users must see a login link on the home page

  Scenario: Login link
	Given I am a user
	And I visit the site
	Then I should see a sign in link

  Scenario: Logout link
	Given I am a user
	When I visit the login page
	And enter valid login credentials
	Then I should see a sign out link
	And no sign in link

  Scenario: Name on home page
	Given I am a user
	When I visit the login page
	And enter valid login credentials
	Then I should see my name

  Scenario: Login link as normal user
	Given I am a user
	When I visit the login page
	And enter valid login credentials
	Then I should not see an admin area link

  Scenario: Login link as admin user
	Given I am an admin
	When I visit the login page
	And enter valid login credentials
	Then I should see an admin area link
	
