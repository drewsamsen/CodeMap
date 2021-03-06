Feature: Creating notes
  As a user
  I want to create notes
  In order to record and track what I learn

  Background: 
    Given there are the following users:
      | email             | password |
      | admin@codemap.com | password |
    And I am signed in as "admin@codemap.com"
    Given I am on the homepage
    # must seed now for later scenario
    And the technology "Ruby" exists
    And I follow "New Note"    

  Scenario: Creating a note
    And I fill in "note_subject" with "Ruby Objects"
    And I fill in "note_description" with "omg how do they work?"
    And I fill in "note_resources" with "Rails 3 in Action"
    And I fill in "note_technology_name" with "Ruby"
    And I choose "note_importance_5"
    And I choose "note_understanding_5"
    When I press "Create Note"
    Then I should see "Note has been created."
    And I should be on the note page for "Ruby Objects"
    And I should see "Ruby Objects"
    And I should see "omg how do they work?"
    And I should see "Rails 3 in Action"
    And I should see "Ruby" in element ".note_technology"
    And I should see "5" in element ".importance_value"
    And I should see "5" in element ".understanding_value"
    And I should see "100" in element ".mastery_value"

  Scenario: Subject can't be blank
    When I press "Create Note"
    Then I should see "Note has not been created."
    Then I should see "Subject can't be blank"


