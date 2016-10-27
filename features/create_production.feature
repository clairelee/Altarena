Feature: Create Production
  
  As a user
  So I can create and view notes based on a specific Production
  I want to create a Production
  
  Background:
    Given I am on the production page
    
  Scenario: Add new production
    When I fill in name with "Lion King"
    And I fill in date with "12-21-2015"
    And I fill in director with "Armando Fox"
    Then I should see "Success"
  
  Scenario: Create existing production
    Given the production "Lion King" already exists
    When I fill in "title" with "Old"
    And I press "Create"
    Then I should see "This Production Already Exists!"