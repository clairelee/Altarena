Feature: Create User Record
  
  As a user
  So I can create notes about someone I've worked with
  I want to be able to create a Record for them
  
  Background:
    Given I am on the home page
  
  Scenario: Create record
    When I click "Add User"
    Then I am on the create new user page
    
  Scenario: Create actor record for non existing user
    Given I am on the create new user page
    When I fill in "First_Name" with "Calley"
    And I fill in "Last_Name" with "Wang"
    And I check "Actor"
    And I press "Create"
    Then I should see "Success!"
    
  Scenario: Create musician record for non existing user
    Given I am on the create new user page
    When I fill in "First_Name" with "Claire"
    And I fill in "Last_Name" with "Lee"
    And I check "Musician"
    And I press "Create"
    Then I should see "Success!"
    
  Scenario: Not specifying name
    Given I am on the create new user page
    And I press "Create"
    Then I should see "Invalid submission"
    
  Scenario: Not specifying role
    Given I am on the create new user page
    When I fill in "First_Name" with "Karan"
    And I fill in "Last_Name" with "Das"
    And I press "Create"
    Then I should see "Invalid submission"
  
  