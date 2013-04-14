Feature: Edit Menu
  The users must be able to edit their menus

  Background:
   	Given I am a signed in "user"

  Scenario: Edit link      
        Then I should see the users page
	And I should see an edit menu link

   Scenario: Edit menu
	When I visit the menu edit page
	Then I should see the menu
	And I should see the menu edit form

   Scenario: Edit menu submit 
	When I visit the menu edit page
	When the menu edit form is submitted
	Then I should see the users page




