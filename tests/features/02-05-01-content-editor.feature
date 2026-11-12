Feature: Content editor
      As a content editor
      I want to be able to edit the example content of the site template
      So that I can change the pages the template installs without the administrator

  Scenario: Check if the content editor can edit and save the Support page.
    Given I am a logged in user with the "Content editor" user
     When I go to "/admin/content"
     Then I should see the "Edit" operation for the "Support" content
     When I open the "Edit" operation in the "Support" row
      And I save the content
     Then I should see "has been updated."
