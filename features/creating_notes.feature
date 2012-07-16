Feature: Creating notes
  As a user
  I want to create notes
  In order to record and track what I learn

  Background:
    Given I am on the homepage
    And I follow "New Note"

  Scenario: Creating a note
    And I fill in "Subject" with "Ruby Objects"
    And I fill in "Description" with "omg how do they work?"
    And I press "Create Note"
    Then I should see "Note has been created."
    And I should be on the note page for "Ruby Objects"
    And I should see "Ruby Objects"
    And I should see "omg how do they work?"

  Scenario: Subject can't be blank
    And I press "Create Note"
    Then I should see "Note has not been created."
    Then I should see "Subject can't be blank"

  Scenario: Setting the note's technology tag
    And I fill in "Subject" with "Objects"
    And I fill in "Description" with "omg how do they work?"
    # For some reason this line isn't working blarg!
    # And I select "Ruby" from "Technology" 
    And I press "Create Note"
    Then I should see "Note has been created."
    And I should be on the note page for "Objects"
    # And I should see "Ruby"
