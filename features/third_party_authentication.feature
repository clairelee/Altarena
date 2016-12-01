Feature: Third Party Authentication
  
  As a user
  So I can begin to use the application
  I want to be able to log-in using 3rd party authorization
  
  Background:
    Given I am on the home page
    
  Scenario: Successfully Login through Facebook
    When I follow "Sign in with Facebook"
    Then I should be on the notes_home page
    
  Scenario: Successfully Login through LinkedIn
    When I follow "Sign in with Linkedin"
    Then I should be on the notes_home page
