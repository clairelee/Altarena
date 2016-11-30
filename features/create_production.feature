Feature: Create Production
  
  As a user
  So I can create and view notes based on a specific Production
  I want to create a Production
  
  Background:
    Given I am on the home page
    And I follow "Sign in with Facebook"
    And I follow "Add Prod"
    Then I should be on the new_production page
    
  Scenario: Add new production
    When I fill in "production[name]" with "Mulan"
    And I fill in "production[company]" with "Disney"
    And I fill in "production[opening_date]" with "1/11/2011"
    And I press "Create"
    Then I should be on the notes_home page
    And I should see "Mulan was successfully created."
  
  Scenario: Create existing production
    Given the production "Lion King" already exists
    When I fill in "production[name]" with "Lion King"
    And I press "Create"
    Then I should be on the Create productions page
    And I should see "Lion King already exists!"