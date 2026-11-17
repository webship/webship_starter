Feature: The documentation content type management
      As the Webmaster
      I want to be able to add Web Doc pages
      So that they will show up in the documentation page.

  Scenario: The Webmaster opens the form to add a Web Doc page
    Given I am a logged in user with the "Webmaster" user
     When I go to "/node/add/webdoc"
     Then I should see "Create Web Doc"
