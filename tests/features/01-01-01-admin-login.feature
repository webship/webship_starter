Feature: Webmaster login
  As the Webmaster of the site
  I want to log in
  So that I can administer the site

  Scenario: The Webmaster logs in and reaches the administration
    Given I am a logged in user with the "Webmaster" user
     Then I should be logged in
      And I should be allowed access to "/admin/content"
