Feature: Create User Record
  
  As a user
  So I can create notes about someone I've worked with
  I want to be able to create a Record for them
  
  Background:
    Given I am on the User Record page
  
  Scenario: Create record for non existing user
    When I fill in "First_Name" with "Calley"
    And I fill in "Last_Name" with "Wang"
    And I check "Director"
    And I press "Create_User_Record"
    Then I should see "Success!"
    
  Scenario: Create record for existing user with different role
    And user "Calley" "Wang" "Actor" exists
    When I fill in "First_Name" with "Calley"
    And I fill in "Last_Name" with "Wang"
    And I check "Director"
    And I press "Create_User_Record"
    Then I should see "Success!"
  
  Scenario: Create record for existing user with same role
    And user "Calley" "Wang" "Actor" exists
    When I fill in "First_Name" with "Calley"
    And I fill in "Last_Name" with "Wang"
    And I check "Actor"
    And I press "Create_User_Record"
    Then I should see "Calley Wang, Actor already exists!"