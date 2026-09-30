Feature: The documentation site section page
      As an anonymous user
      I want to be able to visit the documentation page
      So that I can see the main Documentation page

  Scenario: Check the Docs page.
    Given I am on "/docs"
     Then I should see "Documentation"
      And I should see "Guides"

  Scenario Outline: Check the documentation guides.
    Given I am an anonymous user
     When I go to "<path>"
     Then I should see "<title>"

    Examples:
      | path                        | title                 |
      | /docs/getting-started       | Getting started       |
      | /docs/your-first-board      | Your first board      |
      | /docs/questions-and-answers | Questions and answers |
