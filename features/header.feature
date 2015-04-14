@javascript
Feature: Header

  Scenario: Sign in
    Given I visit Home Page
    And I follow "Sign in"
    When I fill in "Email" with "current_user.email"
    And I fill in "Password" with "secret"
    And I press button "Log in"
    Then I should see user full_name

  Scenario: Sign out
    Given I visit Home Page
    And I follow "Sign in"
    When I fill in "Email" with "current_user.email"
    And I fill in "Password" with "secret"
    And I press button "Log in"
    Then I should see user full_name
    And I follow "Sign out"
    Then I should see "WELCOME TO THE UZHGOROD WEB PORTAL"

  Scenario: Profile
    Given I visit Home Page
    And I follow "Sign in"
    When I fill in "Email" with "current_user.email"
    And I fill in "Password" with "secret"
    And I press button "Log in"
    Then I should see user full_name
    When I visit Home Page
    And I follow "Profile"
    Then I should see user full_name

  Scenario: Home
    Given I visit Home Page
    When I follow "Home"
    Then I should see "WELCOME TO THE UZHGOROD WEB PORTAL"
