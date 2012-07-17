Feature: Creating notes
  As a user
  I want to create notes
  In order to record and track what I learn

  Background: 
    Given I am on the homepage
    # must seed now for later scenario
    And the technology "Ruby" exists
    And I follow "New Note"

  Scenario: Creating a note
    And I fill in "note_subject" with "Ruby Objects"
    And I fill in "note_description" with "omg how do they work?"
    And I fill in "note_resources" with "Rails 3 in Action"
    And I select "Ruby" from "note_technology_name" 
    And I press "Create Note"
    Then I should see "Note has been created."
    And I should be on the note page for "Ruby Objects"
    And I should see "Ruby Objects"
    And I should see "omg how do they work?"
    And I should see "Rails 3 in Action"
    And I should see "Ruby" in element ".note_technology"

  Scenario: Subject can't be blank
    And I press "Create Note"
    Then I should see "Note has not been created."
    Then I should see "Subject can't be blank"

  Scenario: Setting the note's technology tag
    And I fill in "note_subject" with "Objects"
    And I fill in "note_description" with "omg how do they work?"
