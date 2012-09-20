Feature: HeaderLinks

  Scenario Outline: links
    Given I am on  <start_page>
    When I click the <link>
    Then I should be on the <result_page>

  Examples:
    | start_page         | link    | result_page |
    | "/"                | "home"  | "/"          |
    | "/warcards/setup"  | "home"  | "/"          |
#    | "/warcards/verify" | "home"  | "/"          |
    | "/warcards/play?"  | "home"  | "/"          |
    | "/warcards/play"   | "home"  | "/"          |
    | "/"                | "about" | "/about"     |
    | "/warcards/setup"  | "about" | "/about"     |
#    | "/warcards/verify" | "about" | "/about"     |
    | "/warcards/play?"  | "about" | "/about"     |
    | "/warcards/play"   | "about" | "/about"     |
