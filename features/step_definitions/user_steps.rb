Given /^there are the following users:$/ do |table|
  table.hashes.each do |attributes|
    @user = User.create!(attributes)
  end
end

Given /^I am signed in as "([^\"]*)"$/ do |email|
  @user = User.find_by_email!(email)
  steps("Given I am signed in as them")
end

Given /^I am signed in as them$/ do
  steps(%Q{
    Given I am on the homepage
    And I follow "Log In"
    And I fill in "Email" with "#{@user.email}"
    And I fill in "Password" with "password"
    When I press "Log In"
    Then I should see "Welcome back! Successfully signed in!"
    And I should be on the homepage
  })
end