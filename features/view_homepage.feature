Feature: View Homepage
	Scenario: See the welcome message on the home page
	        Given I am a user
		When I visit the home page
		Then I should see the title "Astbury Ball 2013"
