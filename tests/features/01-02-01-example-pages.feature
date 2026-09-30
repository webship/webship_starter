Feature: Check the example pages of the site template
      As an anonymous user
      I want to be able to visit the front, Make it yours and Support pages
      So that I can see what the site does and how to change it.

  Scenario: Check the front page
    Given I am an anonymous user
     When I go to "/"
     Then I should see "One site for your software."
      And I should see "Make it yours"
      And I should see "Marigold"

  Scenario: Check the Make it yours page
    Given I am an anonymous user
     When I go to "/make-it-yours"
     Then I should see "Make it yours"
      And I should see "Change the look"

  Scenario: Check the Support page
    Given I am an anonymous user
     When I go to "/support"
     Then I should see "Support"
      And I should see "Frequently asked"
