Feature: Viewing another person's Profile
  As a user
  So I can view biographical information and all notes about someone
  I want to view that person's Profile
  
  Scenario: View profile from search record
    Given I am on the search results page
    
    When I click on any record
    Then I should see "Photo url"
    And I should see "Resume url"
    
    
    