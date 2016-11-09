Feature: Create Notes
  As a director/music director/actor/musician
  So I can archive details about people I've worked with
  I want to create notes about them
  
  Background:
    Given I am on the Notes page
    And the following notes exist:
    |name    |role |
    |John Ho |Actor|
    
  Scenario: Add an actor note
    When I go to the Create notes page
    And I fill in "Name" with "Calley Wang"
    And I fill in "Production" with "Lion King"
    And I fill in "Role" with "Actor"
    And I choose "5 Yes!!"
    And I choose "4 Brings joy to every rehearsal"
    And I press "Next"
    Then I should be on the new actor notes page
    And I choose "3 Very well"
    And I choose "4 Pro/Veteran"
    And I fill in "Description" with "All around good guy"
    And I press "Create Note"
    Then I should be on the view notes page for "Calley Wang"
    And I should see "Calley Wang" 
    And I should see "Lion King"
    And I should see "Actor"
    And I should see "All around good guy"
    
  Scenario: Add a musician note
    When I go to the Create notes page
    And I fill in "Name" with "Gunsoo Kim"
    And I fill in "Production" with "Mulan"
    And I fill in "Role" with "Musician"
    And I choose "1 Definitely not"
    And I choose "1 Difficult"
    And I press "Next"
    Then I should be on the new musician notes page
    And I choose "No"
    And I choose "1 Green"
    And I fill in "Description" with "Never work with him again"
    And I press "Create Note"
    Then I should be on the view notes page for "Gunsoo Kim"
    And I should see "Gunsoo Kim" 
    And I should see "Mulan"
    And I should see "Musician"
    And I should see "Never work with him again"
    
  Scenario: Edit note
    Given I am on the notes page
    When I follow "Edit"
    Then I should be on the edit notes page for "John Ho"
    When I fill in "Name" with "Karan Das"
    And I press "Update"
    Then I should see "Karan Das"
    
  Scenario: Delete note
    Given I am on the notes page
    When I follow "Delete"
    Then I should be on the notes page
    And I should not see "John Ho"
    
  Scenario: Empty note
    When I go to the Create notes page
    And I press "Next"
    Then I should see "Invalid submission"
  
  # Background:
  #   Given a dummy production exists
  #   And a dummy director exists
  #   And a dummy music director exists
  #   And a dummy actor_actress exists
  #   And a dummy musician exists
  #   And I am on the Notes page

  # Scenario: View template for notes about a director
  #   #FIXME talk to Armando about criterias
  
  # Scenario: Create notes about a director
  #   Given the endorsements are filled
  #   And I check "Director"
  #   And I fill in "First_Name" with "Dummy"
  #   And I fill in "Last_Name" with "Dummy"
  #   And I fill in "Production" with "Dummy"
  #   And I press "Submit"
  #   Then I should see "Success!"
  
  # Scenario: View template for notes about a music director
  #   #FIXME talk to Armando about criterias  
    
  # Scenario: Create notes about a music director
  #   Given the endorsements are filled
  #   And I check "Music_Director"
  #   And I fill in "First_Name" with "Dummy"
  #   And I fill in "Last_Name" with "Dummy"
  #   And I fill in "Production" with "Dummy"
  #   And I press "Submit"
  #   Then I should see "Success!"
    
  # Scenario: View template for notes about an actor/actress
  #   Given I check "Actor_Actress"
  #   Then I should see "recommend"
  #   And I should see "reads music"
  #   And I should see "harmony music"
  #   And I should see "attitude"
  
  # Scenario: Create notes about an actor/actress
  #   Given the endorsements are filled
  #   And I check "Actor_Actress"
  #   And I fill in "First_Name" with "Dummy"
  #   And I fill in "Last_Name" with "Dummy"
  #   And I fill in "Production" with "Dummy"
  #   And I press "Submit"
  #   Then I should see "Success!"
    
  # Scenario: View template for notes about a musician
  #   Given I check "Musician"
  #   Then I should see "recommend"
  #   And I should see "star sub"
  #   And I should see "maturity/experience"
  #   And I should see "attitude"
    
  # Scenario: Create notes about a musician
  #   Given the endorsements are filled
  #   And I check "Musician"
  #   And I fill in "First_Name" with "Dummy"
  #   And I fill in "Last_Name" with "Dummy"
  #   And I fill in "Production" with "Dummy"
  #   And I press "Submit"
  #   Then I should see "Success!"
    
  # Scenario: Create notes about a user who doesn't exist
  #   Given the endorsements are filled
  #   And I check "Musician"
  #   And I fill in "First_Name" with "Non"
  #   And I fill in "Last_Name" with "Existent"
  #   And I fill in "Production" with "Dummy"
  #   And I press "Submit"
  #   Then I should see "Non Existent is not an existing user!"
    
  # Scenario: Create notes about a production that doesn't exist
  #   Given the endorsements are filled
  #   And I check "Music_Director"
  #   And I fill in "First_Name" with "Dummy"
  #   And I fill in "Last_Name" with "Dummy"
  #   And I fill in "Production" with "Wrong Production"
  #   And I press "Submit"
  #   Then I should see "Wrong Production is not an existing production!"