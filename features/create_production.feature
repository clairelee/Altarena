Feature: Create Production
  
  As a user
  So I can create and view notes based on a specific Production
  I want to create a Production
  
  Background:
    Given I am on the Production page
  
  Scenario: Create new production
    When I fill in "title" with "New"
    And I press "Create"
    Then I should see "Success"
    
  Scenario: Create existing production
    Given the production "Old" already exists
    When I fill in "title" with "Old"
    And I press "Create"
    Then I should see "This Production Already Exists!"