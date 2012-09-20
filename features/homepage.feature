Feature: Homepage

  Scenario Outline: Game List
    Given I am on the homepage
    Then I should see <game_name> in the list of games

  Examples:
    | game_name  |
    | "Warcards" |

  Scenario: Warcards
    Given I am on the homepage
    When I click the link to warcards
    Then I am taken to the warcards game