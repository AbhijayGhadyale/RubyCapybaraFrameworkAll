Feature: Open new Account Page

  Scenario: Verify User is able to get open account page

    Given User have launched the parabank application
    And User have logged in with the correct Username and Password
    When User clicks Open new Account Page
    Then User gets the Open new Account Page