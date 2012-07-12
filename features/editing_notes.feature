Feature: Editing notes
  As a user
  I want to be able to edit existing notes
  In order to update my learing progress

  Background:
    Given there is a note called "Ruby Objects"
    And I am on the homepage
    And I follow "Ruby Objects"
    And I follow "Edit"

  Scenario: Updating a note
    And I fill in "Subject" with "Ruby Object structure"
    And I press "Update Note"
    Then I should see "Note has been updated."
    And I should be on the note page for "Ruby Object structure"

  Scenario: Updating a note with invalide subject
    And I fill in "Subject" with ""
    And I press "Update Note"
    Then I should see "Note has not been updated."
