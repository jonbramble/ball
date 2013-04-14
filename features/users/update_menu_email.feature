Feature: Edit Menu email
  The users must be receive an email

  Background:
   	Given I am a signed in "user"
        And I visit the menu edit page

   Scenario Outline: Edit menu email
        When <wine> is selected for "meal_wine"
        And "Nuts" is entered for "meal_allergies"
        And "Best Friend" is entered for "meal_friends"
	And yes is chosen for "meal_coffee"
        And yes is chosen for "meal_vegetarian"
	When the menu edit form is submitted
        Then the user should receive an email
	When the user opens the email
        Then they should see "Hello" in the email body
	And they should see "Menu: Vegetarian Menu" in the email body
        And they should see "Coffee: Yes Please" in the email body
        And they should see "Allergies/Intolerances: Nuts" in the email body
	And they should see "Wine or soft drink: <wine>" in the email body
        And they should see "Selected Friends: Best Friend" in the email body
    
       Examples:
    	| wine | 
    	|  "White Wine" |  
    	|  "Red Wine" | 
