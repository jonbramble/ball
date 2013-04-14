Feature: Edit Menu email
  The users must be receive an email

  Background:
   	Given I am a signed in "user"
        And I visit the menu edit page
   
     	Scenario Outline: Allergies Information
        	When <allergies> is entered for "meal_allergies"
        	When the menu edit form is submitted
        	Then the user should receive an email
		When the user opens the email
		And they should see <allergies_text> in the email body

        	Examples:
        	| allergies | allergies_text |
        	| "Nuts"     |  "Allergies/Intolerances: Nuts" |
        	| ""     	|  "Allergies/Intolerances: None" |

    	Scenario Outline: Friend Information
        	When <friends> is entered for "meal_friends"
        	When the menu edit form is submitted
        	Then the user should receive an email
		When the user opens the email
		And they should see <friends_text> in the email body

        	Examples:
        		| friends | friends_text |
        		| "Best Friend"     |  "Selected Friends: Best Friend" |
        		| ""     		      |  "Selected Friends: None selected" |

    	Scenario Outline: Wine Selection
        	When <wine> is selected for "meal_wine"
        	When the menu edit form is submitted
        	Then the user should receive an email
		When the user opens the email
		And they should see <wine_text> in the email body

       		Examples:
    			| wine | wine_text |
    			|  "White Wine" | "Wine or soft drink: White Wine"  |
    			|  "Red Wine" |  "Wine or soft drink: Red Wine" |
        		|  "No Wine Preference" |  "Wine or soft drink: No Wine Preference" |
        		|  "Soft Drink" | "Wine or soft drink: Soft Drink" |

    	Scenario Outline: Coffee Selection
       		And <coffee> is chosen for "meal_coffee"
        	When the menu edit form is submitted
        	Then the user should receive an email
		When the user opens the email
	 	And they should see <coffee_text> in the email body

      		Examples:
        		| coffee | coffee_text |
        		| yes     |  "Coffee: Yes Please" |
        		| no     |  "Coffee: No Thanks" |

    	Scenario Outline: Vegetarian Selection
       		And <vegetarian> is chosen for "meal_vegetarian"
       		When the menu edit form is submitted
       		Then the user should receive an email
		When the user opens the email
		And they should see <vegetarian_text> in the email body

      		Examples:
        		| vegetarian | vegetarian_text |
        		| yes     |  "Vegetarian Menu" |
        		| no     |  "Standard Menu" |
