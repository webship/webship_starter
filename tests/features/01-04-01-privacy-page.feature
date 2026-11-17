Feature: No privacy page in the site template
      As a site owner
      I want to write the privacy policy of my own site
      So that the site template ships no privacy page.

  The template installs a front page, the Make it yours and Support pages,
  the documentation, the products and the contact form; a site adds its own
  privacy policy.

  Scenario: The site template has no privacy page
    Given I am an anonymous user
     When I go to "/privacy"
     Then the response status code should be 404
