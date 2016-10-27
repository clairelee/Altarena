Feature: Home Page Views
  
  As a user
  I want to see all the profiles
  so that I can easily see everything in front of me
  
  Background:
    Given I am on the home page
    And user "1" exists 
    
  Scenario: Click new leads to new page
    When I click "new"
    Then I see the new page
    
  Scenario: Click production leads to production page
    When I click "production_1"
    Then I see the production page

  Scenario: Click name leads to profile page
    When I click "profile_1"
    Then I see the profile page

  Scenario: Click note leads to note page
    When I click "note_1"
    Then I see the note page
    