Feature: Third Party Authentication
  
  As a user
  So I can begin to use the application
  I want to be able to log-in using 3rd party authorization
  
  Background:
    Given I am on the home page
    
  @omniauth_test_success
  Scenario: Successfully Login through Facebook
    When I follow "Sign in with Facebook"
    Then I should be on the home page
    
  @omniauth_test_success
  Scenario: Successfully Login through LinkedIn
    When I follow "Sign in with Linkedin"
    Then I should be on the home page
    
# https://github.com/omniauth/omniauth/wiki/Integration-Testing

  Scenario: Connect LinkedIn to Facebook
    When I am logged in with Facebook
    Then I connect with LinkedIn
    Then I should be on the home page
  
  Scenario: Connect Facebook to LinkedIn
    When I am logged in with LinkedIn
    Then I connect with Facebook
    Then I should be on the home page