Feature: Viewing another person's Profile
  As a user
  So I can view biographical information and all notes about someone
  I want to view that person's Profile
  
  Background:
    Given I am on the home page
    And I follow "Sign in with Facebook"
    And I follow "Add Prod"
    Then I should be on the new_production page
    And I fill in "production[name]" with "Mulan"
    And I fill in "production[company]" with "Disney"
    And I fill in "production[opening_date]" with "1/11/2011"
    And I press "Create"
    Then I should be on the notes_home page
    And I should see "Mulan was successfully created."
    And I follow "Add Note"
    And I fill in "note[name]" with "John Ho"
    And I select "Mulan" from "note[production_id]"
    And I press "Next"
    Then I should be on the view notes page for "John Ho"
    
  Scenario: View profile 
    Given I am on the profiles page
    When I follow "Show"
    Then I should see "John Ho"
    And I should see "Mulan"
    
    
    