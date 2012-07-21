Feature: Editing notes
  As a user
  I want to be able to edit existing notes
  In order to update my learing progress

  Background:
    Given there are the following users:
      | email             | password |
      | admin@codemap.com | password |
    And I am signed in as "admin@codemap.com"
    Given there is a note called "Ruby Objects"
    And I am on the homepage
    When I follow "Ruby Objects"
    And I follow "Edit"

  Scenario: Updating a note
    And I fill in "note_subject" with "Ruby Object structure"
    When I press "Update Note"
    Then I should see "Note has been updated."
    And I should be on the note page for "Ruby Object structure"

  Scenario: Updating a note with invalide subject
    And I fill in "note_subject" with ""
    When I press "Update Note"
    Then I should see "Note has not been updated."
