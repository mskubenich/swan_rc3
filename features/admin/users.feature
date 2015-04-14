@javascript
Feature: Admin Users

  Scenario: Users Index
    Given I have a registered user
    When I visit admin page
    Then I should see "Users" link
    When I follow "Users" link
    Then I should see "Users list"
    When I follow "Back to Admin page" link
    Then I should see "Hallo Admin"

  Scenario: Show User
    Given I have a registered user
    When I visit admin page
    Then I should see "Users" link
    When I follow "Users" link
    Then I should see "Users list"
    When I follow "Show user" link
    Then I should see "User's name"
    When I follow "Back to users list" link
    Then I should see "Users list"