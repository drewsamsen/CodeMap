Feature: Search!
  As a user
  I want to search notes
  In order to find the one I'm looking for

  Background:
    Given there are the following notes:
      | subject              |
      | recursive functions  |
      | spaceship operator   |
    And the note "recursive functions" has the technology "JavaScript"
    And the note "spaceship operator" has the technology "Ruby"
    And I am on the homepage
    Then I should see "recursive functions"
    And I should see "spaceship operator"

  Scenario: Searching by note subject should filter index results
    Given I fill in "search" with "Functions"
    And I press "Search"
    Then I should be on the homepage
    And I should see "recursive functions"
    But I should not see "spaceship operator"

  Scenario: Searching by technology should filter by technology type
    Given I select "Ruby" from "note_technology_id"
    And I press "Filter"
    Then I should be on the homepage
    And I should see "spaceship operator"
    But I should not see "recursive functions" 

