Feature: greeter says hello
  In order to start learing RSpec and Turnip
  As a reader of The RSpec Book
  I want a greeter to say Hello

  Scenario: greeter say hello
    Given a greeter
    When I send it the greet message
    Then I should see "Hello Turnip!"
