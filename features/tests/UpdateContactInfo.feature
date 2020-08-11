Feature: update Contact info

  Scenario: Verify User is able to update contact info

    Given User have launched the parabank application
    And User have logged in with the correct Username and Password
    And user have visited update Contact info Page
    And User have entered below data as contact info
      | Phone_Number | City |
      | 310-447-4123 | Mum   |
    When User clicks update profile button
    Then User gets the valid message saying profile updated


  Scenario: Verify User is able to update contact info

    Given User have launched the parabank application
    And User have logged in with the correct Username and Password
    And user have visited update Contact info Page
    And User have entered Phone number and city data as contact info
    When User clicks update profile button
    Then User gets the valid message saying profile updated