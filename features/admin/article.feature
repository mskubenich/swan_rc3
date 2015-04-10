@javascript
Feature: Admin Articles

  Scenario: Create Article
    Given I visit admin articles page
    When I follow "New article"
    And I fill in title with "Example title text"
    And I fill in text with "Example text"
    And I press "Create"
    Then I should see "Example title text"
    And I should see "Example text"

  Scenario: Show Article
    Given I have article
    And I visit admin articles page
    And I should see "Example title text"
    When  I follow "Show"
    Then I should see "Example text"

  Scenario: Edit Article
    Given I have article
    And I visit admin articles page
    And I should see "Example title text"
    When I follow "Edit"
    And I fill in title with "Changed title text"
    And I fill in text with "Changed text"
    And I press "Save"
    Then I should see "Changed title text"
    And I should see "Changed text"

  Scenario: Destroy Article
    Given I have article
    And I visit admin articles page
    And I should see "Example title text"
    When I follow "Destroy"
    And I confirm the dialog
    Then I should not see "Example title text"
    And I should not see "Example text"

  Scenario: Article validations
    Given I visit admin articles page
    When I follow "New article"
    And I fill in title with "Example title text"
    And I fill in text with " "
    And I press "Create"
    Then I should see "Text can't be blank"
    When I fill in title with " "
    And I fill in text with "Example text"
    And I press "Create"
    Then I should see "Title can't be blank"
    And I should see "Title is too short (minimum is 15 characters)"
    When I fill in title with " "
    And I fill in text with " "
    And I press "Create"
    Then I should see "Title is too short (minimum is 15 characters)"
    And I should see "Text can't be blank"
    And I should see "Title can't be blank"
