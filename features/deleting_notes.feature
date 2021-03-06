Feature: Deleting notes
  As a user
  I want to delete notes
  In order to clear out needless notes

  Scenario: Deleting a note
    Given there are the following users:
      | email             | password |
      | admin@codemap.com | password |
    And I am signed in as "admin@codemap.com"
    Given there is a note called "Ruby Objects"
    And I am on the homepage
    When I follow "Ruby Objects"
    And I follow "Delete"
    Then I should see "Note has been deleted."
    And I should not see "Ruby Objects"