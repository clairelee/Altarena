Feature: Create Notes
  As a director/music director/actor/musician
  So I can archive details about people I've worked with
  I want to create notes about them
  
  Background:
    Given a dummy production exists
    And a dummy director exists
    And a dummy music director exists
    And a dummy actor_actress exists
    And a dummy musician exists
    And I am on the Notes page

  Scenario: View template for notes about a director
    #FIXME talk to Armando about criterias
  
  Scenario: Create notes about a director
    Given the endorsements are filled
    And I check "Director"
    And I fill in "First_Name" with "Dummy"
    And I fill in "Last_Name" with "Dummy"
    And I fill in "Production" with "Dummy"
    And I press "Submit"
    Then I should see "Success!"
  
  Scenario: View template for notes about a music director
    #FIXME talk to Armando about criterias  
    
  Scenario: Create notes about a music director
    Given the endorsements are filled
    And I check "Music_Director"
    And I fill in "First_Name" with "Dummy"
    And I fill in "Last_Name" with "Dummy"
    And I fill in "Production" with "Dummy"
    And I press "Submit"
    Then I should see "Success!"
    
  Scenario: View template for notes about an actor/actress
    Given I check "Actor_Actress"
    Then I should see "recommend"
    And I should see "reads music"
    And I should see "harmony music"
    And I should see "attitude"
  
  Scenario: Create notes about an actor/actress
    Given the endorsements are filled
    And I check "Actor_Actress"
    And I fill in "First_Name" with "Dummy"
    And I fill in "Last_Name" with "Dummy"
    And I fill in "Production" with "Dummy"
    And I press "Submit"
    Then I should see "Success!"
    
  Scenario: View template for notes about a musician
    Given I check "Musician"
    Then I should see "recommend"
    And I should see "star sub"
    And I should see "maturity/experience"
    And I should see "attitude"
    
  Scenario: Create notes about a musician
    Given the endorsements are filled
    And I check "Musician"
    And I fill in "First_Name" with "Dummy"
    And I fill in "Last_Name" with "Dummy"
    And I fill in "Production" with "Dummy"
    And I press "Submit"
    Then I should see "Success!"
    
  Scenario: Create notes about a user who doesn't exist
    Given the endorsements are filled
    And I check "Musician"
    And I fill in "First_Name" with "Non"
    And I fill in "Last_Name" with "Existent"
    And I fill in "Production" with "Dummy"
    And I press "Submit"
    Then I should see "Non Existent is not an existing user!"
    
  Scenario: Create notes about a production that doesn't exist
    Given the endorsements are filled
    And I check "Music_Director"
    And I fill in "First_Name" with "Dummy"
    And I fill in "Last_Name" with "Dummy"
    And I fill in "Production" with "Wrong Production"
    And I press "Submit"
    Then I should see "Wrong Production is not an existing production!"