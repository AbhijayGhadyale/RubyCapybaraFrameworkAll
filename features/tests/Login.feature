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

  Scenario Outline: Verification of correct login credentials for multiple username and passwords
    Given User have launched the parabank application
    And User have entered the <username> and <password>
    When User clicks Login Button
    Then User gets the <page_text> text after login

    Examples:
      | username     | password    | page_text         |
      | admin        | admin       | Error!            |
      | john         | demo        | Accounts Overview |
      | demo         | demo        | Error!            |