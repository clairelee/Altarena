Feature: Third Party Authentication
  
  As a user
  So I can begin to use the application
  I want to be able to log-in using 3rd party authorization
  
  Background:
    Given I am on the home page
    
  Scenario: Successfully Login through Facebook
    When I press "Login_Facebook"
    Then I should be on the home page
    
  Scenario: Redirect to LinkedIn Login page
    When I press "Login_LinkedIn"
    Then I should be on the home page
