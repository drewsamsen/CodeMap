Feature: Viewing Notes
  As a user
  I want to see a list of notes
  In order to keep track of what I learn

  Scenario: Listing all notes
    Given there is a note called "Ruby Objects"
    And I am on the homepage
    Then I should see "Ruby Objects"
    When I follow "Ruby Objects"
    Then I should be on the note page for "Ruby Objects"