Feature: Authentication
  As a user
  I want to log in
  In order to be able to perform create, edit and destroy actions

  Scenario: Signing Up
    Given I am on the homepage
    When I follow "Sign Up"
    And I fill in "Email" with "admin@codemap.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    When I press "Sign Up"
    Then I should see "Successfully signed up!"
    And I should be on the homepage
    And I should see "Log Out"

  Scenario: Logging in as an existing user
    Given there are the following users:
      | email             | password |
      | admin@codemap.com | password |
    And I am on the homepage
    And I follow "Log In"
    And I fill in "Email" with "admin@codemap.com"
    And I fill in "Password" with "password"
    When I press "Log In"
    Then I should see "Welcome back! Successfully signed in!"
    And I should be on the homepage

  Scenario: Failed log in attempt
    Given there are the following users:
      | email             | password |
      | admin@codemap.com | password |
    And I am on the homepage
    And I follow "Log In"
    And I fill in "Email" with "admin@codemap.com"
    And I fill in "Password" with "fail"
    When I press "Log In"
    Then I should see "Email or password is invalid"

  Scenario: Logging out
    Given there are the following users:
      | email             | password |
      | admin@codemap.com | password |
    And I am signed in as "admin@codemap.com"
    Given I am on the homepage
    Then I should not see "Sign Up"
    And I should not see "Log In"
    But I should see "Log Out"
    When I follow "Log Out"
    Then I should see "Logged out."
    And I should be on the homepage
    And I should see "Log In"
