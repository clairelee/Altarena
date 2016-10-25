Feature: Third Party Authentication
  
  As a user
  So I can begin to use the application
  I want to be able to log-in using 3rd party authorization
  
  Background:
    Given I am on the Login page
  
  Scenario: Redirect to Facebook Login page
    When I press "sign_in"
    Then I should be on the Facebook Authentication page
    
  Scenario: Successfully Login through Facebook
    When I press "sign_in"
    And I press "Okay"
    Then I should see "Signed in"
    
  Scenario: Redirect to Google Login page
    When I press "Login_Google"
    Then I should be on the Google Authetication page
    
  Scenario: Successfully Login through Google
    When I press "Login_Google"
    And I press "Okay"
    Then I should see "Success!"