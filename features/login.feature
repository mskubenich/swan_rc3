@javascript

Feature: Login

  Scenario: Successful login and logout
    Given I visit login page and create user
    When I fill in "Email" with current_user.email
    And I fill in "Password" with "secret"
    And I press button "Log in"
    Then I should see link "Log out" and press "Log out"
