Feature: Search notes
  As a user
  So I can look at a specific subset of my notes
  I want to be able to search/filter my notes
  
  Background:
    Given I am on the home page
    And I follow "Sign in with Facebook"
    And the production "Lion King" already exists
    And the production "Aladdin" already exists
    And the profile "John Ho" already exists
    And the profile "Gunsoo Kim" already exists
    And the profile "Calley Wang" already exists
    And the following notes exist:
    |name        |role              | production_id | user_id | profile_id |
    |John Ho     |Actor/Actress     | 1             | 1       | 1          |
    |Gunsoo Kim  |Musician          | 2             | 1       | 2          |
    |Calley Wang |Actor/Actress     | 2             | 1       | 3          |
    
  Scenario: Land on the Home Page
    Then I should be on the Notes Home page
  
  Scenario: Search names by first name
    When I fill in "note[name]" with "Gunsoo Kim"
    And I press "Search"
    Then I should see "Gunsoo Kim"
    And I should not see "John Ho"
    And I should not see "Calley Wang"
    
  Scenario: Filter by role (actor)
    When I select "Actor/Actress" from "note[role]"
    And I press "Search"
    Then I should see "John Ho"
    And I should see "Calley Wang"
    And I should not see "Gunsoo Kim"
    
  Scenario: Filter by role (musician)
    When I select "Musician" from "note[role]"
    And I press "Search"
    Then I should see "Gunsoo Kim"
    And I should not see "John Ho"
    And I should not see "Calley Wang"
    
  Scenario: Search by substring name
    When I fill in "note[name]" with "Gu"
    And I press "Search"
    Then I should see "Gunsoo Kim"
    And I should not see "John Ho"
    And I should not see "Calley Wang"
    
  Scenario: Search by production name
    When I select "Aladdin" from "note[production_id]"
    And I press "Search"
    Then I should see "Calley Wang"
    And I should see "Gunsoo Kim"
    And I should not see "John Ho"
  
  Scenario: Search by Name and Production
    When I fill in "note[name]" with "Calley"
    And I select "Aladdin" from "note[production_id]"
    And I press "Search"
    Then I should see "Calley Wang"
    And I should not see "Gunsoo Kim"
    And I should not see "John Ho"
    
  Scenario: Search by Name and Role
    When I fill in "note[name]" with "Ho"
    And I select "Actor/Actress" from "note[role]"
    And I press "Search"
    Then I should see "John Ho"
    And I should not see "Gunsoo Kim"
    And I should not see "Calley Wang"
    
  Scenario: Search by Name, Role, Production that does not match anyone
    When I fill in "note[name]" with "Cal"
    And I select "Musician" from "note[role]"
    And I select "Aladdin" from "note[production_id]"
    And I press "Search"
    Then I should not see "John Ho"
    Then I should not see "Gunsoo Kim"
    Then I should not see "Calley Wang"

    
    
    