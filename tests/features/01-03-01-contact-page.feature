Feature: Check the contact page
      As an anonymous user
      I want to be able to visit the contact page
      So that I will able to see the address and fill in the contact form.

  Scenario: The contact page has the contact form
    Given I am an anonymous user
     When I go to "/contact"
     Then I should see "Contact" in the "h1" element
      And I should see "We'd love to talk to you"
      And every form field should have an accessible label

  # Role switch: a visitor sends the form, then the Webmaster removes the
  # submission, so the site keeps no test data. The form has a time limit
  # (Honeypot): the visitor waits it out before sending.
  @role-switch
  Scenario: A visitor sends the contact form
    Given I am an anonymous user
     When I go to "/contact"
      And I fill in "Your Name" with "Jon Smith"
      And I fill in "Company name" with "Webship.co"
      And I fill in "Business email" with "contact-starter@example.com"
      And I fill in "Phone number" with "+212 (367) 487-7851"
      And I fill in "Your message" with "This is an automated test of the contact form."
      And I wait out the form time limit
      And I press "Submit"
     Then I should see "Your message has been sent."
    Given I am a logged in user with the "Webmaster" user
     When I go to "/admin/structure/webform/manage/contact/results/submissions"
      And I open the "Delete" operation in the "contact-starter@example.com" row
      And I confirm the deletion
     Then I should see "has been deleted"
