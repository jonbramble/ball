Feature: Sign out
  A signed in user
  Should be able to sign out

    Scenario: User signs out
      Given I am a signed in "user"
      When I sign out
      Then I should see the home page
      And I should see a signed out message
      
