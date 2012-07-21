Feature: Showing and hiding links based on logged in status
  As a user
  I want to see certain links and not see others
  In order to keep me from being temped to try things I'm not authorized to do

  Scenario: Hiding "Log In" and "Sign Up" links when already logged in
    Given there are the following users:
      | email             | password |
      | admin@codemap.com | password |
    And I am signed in as "admin@codemap.com"
    Given I am on the homepage
    Then I should not see "Sign Up"
    And I should not see "Log In"
    But I should see "Log Out"

  Scenario: Can't see edit link if not signed in
    Given there is a note called "Ruby Objects"
    And I am on the homepage
    When I follow "Ruby Objects"
    Then I should not see "Edit"

  Scenario: Can't see delete link if not signed in
    Given there is a note called "Ruby Objects"
    And I am on the homepage
    When I follow "Ruby Objects"
    Then I should not see "Delete"

  Scenario: "New Note" link is hidden on homepage if not signed in
    Given I am on the homepage
    Then I should not see "New Note"