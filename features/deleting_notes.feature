Feature: Deleting notes
  As a user
  I want to delete notes
  In order to clear out needless notes

  Scenario: Deleting a note
    Given there is a note called "Ruby Objects"
    And I am on the homepage
    And I follow "Ruby Objects"
    And I follow "Delete"
    Then I should see "Note has been deleted."
    And I should not see "Ruby Objects"