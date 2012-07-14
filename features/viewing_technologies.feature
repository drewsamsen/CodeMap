Feature: Viewing the list of technologies
  As a user
  I want to view the technologies
  In order to see a list of technologies

  Background: Viewing all technologies
    Given there is a technology called "Ruby"
    And there is a technology called "JavaScript"
    And I am on the technology page
    Then I should see "Ruby" in element ".tech_list"
    And I should see "JavaScript" in element ".tech_list"