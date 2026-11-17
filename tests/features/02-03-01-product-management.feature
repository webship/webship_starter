Feature: The Product content type management
      As the Webmaster
      I want to be able to add products
      So that they will show up in the products site section.

  Scenario: The Webmaster opens the form to add a product
    Given I am a logged in user with the "Webmaster" user
     When I go to "/node/add/product"
     Then I should see "Create Product"
