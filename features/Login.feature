Feature:Login functionality of Application

  Scenario: Verification of wrong login credentials
    Given User have launched the parabank application
    And User have entered the wrong Username and Password
    When User clicks Login Button
    Then User gets the error message

  Scenario: Verification of correct login credentials
    Given User have launched the parabank application
    And User have entered the correct Username and Password
    When User clicks Login Button
    Then User gets the account overview page
