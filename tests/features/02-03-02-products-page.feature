Feature: The Products site section page
      As a anonymous user
      I want to be able to visit the products page
      So that I can see the list of products.

  Scenario: Check the Products page.
    Given I am an anonymous user
     When I go to "/products"
     Then I should see "Products"
      And I should see "Marigold"

  Scenario Outline: Check the example product and its releases.
    Given I am an anonymous user
     When I go to "<path>"
     Then I should see "<title>"

    Examples:
      | path                              | title    |
      | /products/marigold                | Marigold |
      | /products/marigold/releases/1.1.0 | 1.1.0    |
      | /products/marigold/releases/1.0.0 | 1.0.0    |
