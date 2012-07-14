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

  Scenario: Viewing notes and their technology association
    Given there are the following notes:
      | subject              |
      | recursive functions  |
    And the note "recursive functions" has the technology "JavaScript"
    And I am on the homepage
    Then I should see "recursive functions"
    And I should see "JavaScript" in element ".technology"
