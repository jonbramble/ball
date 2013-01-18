Feature: View Homepage
	Scenario: See the welcome message on the home page
		When I visit the home page
		Then I should see the message "Astbury Ball 2013"
