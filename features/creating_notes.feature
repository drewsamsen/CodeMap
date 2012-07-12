Feature: Creating notes
  As a user
  I want to create notes
  In order to record and track what I learn

  Scenario: Creating a note
    Given I am on the homepage
    And I follow "New Note"
    And I fill in "Subject" with "Ruby Objects"
    And I press "Create Note"
    Then I should see "Note has been created."
    And I should be on the note page for "Ruby Objects"
    And I should see "CodeMap | Ruby Objects"