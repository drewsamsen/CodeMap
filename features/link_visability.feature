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