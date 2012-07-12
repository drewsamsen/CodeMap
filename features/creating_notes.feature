Feature: Creating notes
  As a user
  I want to create notes
  In order to record and track what I learn

  Background:
    Given I am on the homepage
    And I follow "New Note"

  Scenario: Creating a note
    And I fill in "Subject" with "Ruby Objects"
    And I press "Create Note"
    Then I should see "Note has been created."
    And I should be on the note page for "Ruby Objects"
    And I should see "CodeMap | Ruby Objects"

  Scenario: Subject can't be blank
    And I press "Create Note"
    Then I should see "Note has not been created."
    Then I should see "Subject can't be blank"