Feature: Webpage management
      As the Webmaster
      I want to be able to add general Web Pages
      So that I can map the site map for the main site sections

  Scenario: The Webmaster opens the form to add a web page
    Given I am a logged in user with the "Webmaster" user
     When I go to "/node/add/webpage"
     Then I should see "Create Webpage"
