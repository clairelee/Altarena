Feature: Home Page Views
  
  As a user
  I want to see all the features
  So that I can easily navigate to each view
  
  Background:
    Given I am on the home page
    And I follow "Sign in with Facebook"
    
  Scenario: I can navigate to adding a production
    When I follow "Add Prod"
    Then I should be on the new_production page

  Scenario: I can navigate to adding a profile
    When I follow "Add Profile"
    Then I should be on the new_profile page
  
  Scenario: I can navigate to adding a note
    When I follow "Add Note"
    Then I should be on the new_note page