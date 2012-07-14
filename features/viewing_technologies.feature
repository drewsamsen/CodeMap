Feature: Viewing the list of technologies
  As a user
  I want to view the technologies
  In order to see a list of technologies

  Background: Viewing all technologies
    Given there are the following notes:
      | subject              |
      | recursive functions  |
      | spaceship operator   |
      | lexical scoping      |
    And the note "recursive functions" has the technology "JavaScript"
    And the note "lexical scoping" has the technology "JavaScript"
    And the note "spaceship operator" has the technology "Ruby"

  Scenario: Viewing all technologies
    Given I am on the homepage
    And I follow "Technologies"
    Then I should be on the technology page
    Then I should see "Ruby" in element ".tech_list"
    And I should see "JavaScript" in element ".tech_list"

  Scenario: Viewing all notes under a selected technology
    Given I am on the technology page
    And I follow "Ruby"
    Then I should be on the technology page for "Ruby"
    And I should see "spaceship operator"

  Scenario: Easily see how many notes are belong to each technology
    Given I am on the technology page
    Then I should see "2" in element ".note_count"  