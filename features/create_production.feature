Feature: Create Production
  
  As a user
  So I can create and view notes based on a specific Production
  I want to create a Production
  
  Background:
    Given I am on the Notes Home page
    When I press "Add Production"
    Then I should be on the Create productions page
    
  Scenario: Add new production
    When I fill in "Name" with "Lion King"
    And I fill in "Company" with "Disney"
    And I press "Create"
    Then I should be on the Notes Home page
  
  Scenario: Create existing production
    Given the production "Lion King" already exists
    When I fill in "Name" with "Lion King"
    And I press "Create"
    Then I should be on the Create productions page