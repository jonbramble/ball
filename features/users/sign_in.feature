Feature: Sign In
	
	Scenario: User visits the website
		When I visit the site
		Then I should see the home page
		And I should see the title "Astbury May Ball"
                And I should see a sign in link

	Scenario: User views login page
		Given I am a user
		When I visit the login page
		And enter valid login credentials
		Then I should see the users page

	Scenario: User enters incorrect password
		Given I am a user
		When I visit the login page
		And enter an invalid password
		Then I should be signed out
		And see an invalid login message

	Scenario: User enters no password
		Given I am a user
		When I visit the login page
		And enter no password
		Then I should be signed out
		And see an invalid login message

	Scenario: User enters wrong email
      		Given I am a user
		When I visit the login page
      		And I sign in with a wrong email
      		Then I should be signed out
		And see an invalid login message
