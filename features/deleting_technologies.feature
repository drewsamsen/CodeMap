Feature: Deleting Technologies
  As a user
  I want to delte technologies
  In order to remove unneeded technologies

  Background:
    Given there are the following users:
      | email             | password |
      | admin@codemap.com | password |
    And I am signed in as "admin@codemap.com"
    Given there are the following notes:
      | subject              |
      | recursive functions  |
    And the note "recursive functions" has the technology "JavaScript"
    And the technology "Ruby" exists
    Given I am on the homepage
    When I follow "Technologies"
    Then I should be on the technology page
    And I should see "Ruby"
    And I should see "JavaScript"

  Scenario: Deleting an empty technology
    And I follow "DeleteRuby"
    Then I should see "Technology has been deleted."
    And I should see "JavaScript"
    But I should not see "Ruby"

  Scenario: Cannot delete a non-empty technology
    And I follow "DeleteJavaScript"
    Then I should see "Cannot delete non-empty technology categories."
    Given I follow "JavaScript"
    Then I should see "recursive functions"
    Given I follow "recursive functions"
    And I follow "Delete"
    Then I should see "Note has been deleted."
    And I should not see "recursive functions"
    When I follow "Technologies"
    And I follow "DeleteJavaScript"
    Then I should see "Technology has been deleted."
    And I should not see "JavaScript"