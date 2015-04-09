@javascript

Feature: Visit page Sign up

  Scenario: Successful visit

    Given i am on the login page
    And i fill in First Name
    And i fill in Last Name
    And i fill in Full Name
    And i fill in Email
    And i fill in Password
    And i fill in Password Confirmation
    When i press "Register"
    Then i should see "Welcome to the Uzhhorod web portal!"


  Scenario: no parms

    Given i am on the login page
    And i not fill in First Name
    And i not fill in Last Name
    And i not fill in Full Name
    And i not fill in  Email
    And i not fill in Password
    And i no fill in Password Confirmation
    When i press "Register"
    Then they should see an error message

  Scenario: fill in invalid email

    Given i am on the login page
    And i fill in First Name
    And i fill in Last Name
    And i fill in Full Name
    And i fill in invalid Email
    And i fill in Password
    And i fill in Password Confirmation
    When i press "Register"
    Then they should see an error message

  Scenario: invalid password confirmation

    Given i am on the login page
    And i fill in First Name
    And i fill in Last Name
    And i fill in Full Name
    And i fill in Email
    And i fill in Password
    And i fill in invalid Password Confirmation
    When i press "Register"
    Then they should see an error message

