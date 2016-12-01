Feature: Create Notes
  As a director/music director/actor/musician
  So I can archive details about people I've worked with
  I want to create notes about them
  
  Background:
    Given I am on the home page
    And I follow "Sign in with Facebook"
    And I follow "Add Prod"
    Then I should be on the new_production page
    And I fill in "production[name]" with "Mulan"
    And I fill in "production[company]" with "Disney"
    And I fill in "production[opening_date]" with "1/11/2011"
    And I press "Create"
    Then I should be on the notes_home page
    And I should see "Mulan was successfully created."
    And I follow "Add Note"
    And I fill in "note[name]" with "John Ho"
    And I select "Mulan" from "note[production_id]"
    And I press "Next"
    Then I should be on the view notes page for "John Ho"
    
  Scenario: Add an actor note
    When I go to the Create notes page
    And I fill in "note[name]" with "Calley Wang"
    And I select "Mulan" from "note[production_id]"
    And I select "Actor/Actress" from "note[role]"
    And I choose "note_rating_5"
    And I choose "note_attitude_4"
    And I press "Next"
    Then I should be on the new actor notes page
    And I choose "note_reads_music_3"
    And I choose "note_harmony_singer_4"
    And I fill in "note[description]" with "All around good guy"
    And I press "Create Note"
    Then I should be on the view notes page for "Calley Wang"
    And I should see "Calley Wang" 
    And I should see "Mulan"
    And I should see "Actor/Actress"
    And I should see "All around good guy"
    
  Scenario: Add a musician note
    When I go to the Create notes page
    And I fill in "note[name]" with "Gunsoo Kim"
    And I select "Mulan" from "note[production_id]"
    And I select "Musician" from "note[role]"
    And I choose "note_rating_1"
    And I choose "note_attitude_1"
    And I press "Next"
    Then I should be on the new musician notes page
    And I choose "note_star_sub_true"
    And I choose "note_musical_maturity_4"
    And I fill in "note[description]" with "Never work with him again"
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
    When I fill in "note[name]" with "Karan Das"
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
    Then I should see "Missing name or production."
