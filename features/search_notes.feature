Feature: Search notes
  As a user
  So I can look at a specific subset of my notes
  I want to be able to search/filter my notes
  
  Background:
    Given I am on the Notes page
    And the following notes exist:
    |name       |role       |
    |John Ho    |Actor      |
    |Gunsoo Kim |Musician   |
    |Claire Lee |Musician   |
    |Lee Kim    |Actor      |
    
  Scenario: Sort names by first name
    When I follow "name"
    Then I should see "Claire Lee" before "Gunsoo Kim"
    
  Scenario: Filter by role (actor)
    When I check "Actor"
    And I press "Search"
    Then I should see "John Ho"
    And I should see "Lee Kim"
    
  Scenario: Filter by role (musician)
    When I check "Musician"
    And I press "Search"
    Then I should see "Gunsoo Kim"
    And I should see "Claire Lee"
    
  Scenario: Search by name
    When I fill in "Name" with "Lee"
    And I press "Search"
    Then I should see "Claire Lee"
    And I should see "Lee Kim"
    
  Scenario: Clicking the search button
    When I press "Search"
    Then I should see "John Ho"
    And I should see "Gunsoo Kim"
    And I should see "Claire Lee"
    And I should see "Lee Kim"
    

    
    
    