Feature: Create new categories
  As a blog administrator
  In order to classify articles
  I want to be able to create new categories

  Background:
    Given the blog is set up

  Scenario: as an admin I should see Merge Articles option
    And I am logged into the admin panel
    Given I am on the Categories page
    Then I should see "Your category slug"

