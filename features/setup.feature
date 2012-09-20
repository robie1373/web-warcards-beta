Feature: Setup page

  Scenario: Player name
    Given I am on the setup page
    When I set my name
    And I set the difficulty
    And I select the test questions
    And I submit the page
    Then the game should know the difficulty
    And the game should know which questions to use