Feature: Create Profile
  As a user
  So I can create notes about someone I've worked with
  I want to be able to create a Profile for them
  
  Background:
    Given I am on the home page
    And I follow "Sign in with Facebook"
    And I follow "Add Profile"
    Then I should be on the new_profile page
    
  Scenario: Add new profile
    When I fill in "profile[name]" with "Cal Ho"
    And I press "Create"
    Then I should be on the notes_home page
    And I should see "Cal Ho was successfully created."
  
  Scenario: Create existing production
    Given the profile "Cal Ho" already exists
    When I fill in "profile[name]" with "Cal Ho"
    And I press "Create"
    Then I should be on the new_profile page
    And I should see "Cal Ho already exists!"
  
  