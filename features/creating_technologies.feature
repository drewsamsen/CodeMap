Feature: Creating Technologies
  As a user
  I want to create technologies
  In order to have additional technologies to match with my notes

  Background:
    Given there are the following users:
      | email             | password |
      | admin@codemap.com | password |
    And I am signed in as "admin@codemap.com"
    Given I am on the homepage
    And the technology "Ruby" exists
    When I follow "Technologies"
    Then I should be on the technology page
    And I should see "Ruby"

  Scenario: Adding a new technology
    Given I fill in "name" with "JavaScript"
    When I press "Add"
    Then I should be on the technology page
    And I should see "JavaScript"
    And I should see "Ruby"