Feature: Write Articles
  As a blog administrator
  In order to cleanup artiles
  I want to be able to merge two articles together

  Background:
    Given the blog is set up

  Scenario: as an admin I should see Merge Articles option
    And I am logged into the admin panel
    Given I am on the new article page
    Then I should see "Merge Articles"

  Scenario: as a publisher I should not see Merge Articles option
    And I am logged into the admin panel as publisher
    Given I am on the new article page
    Then I should not see "Merge Articles"


  Scenario: Successfully loggin in as admin
    And I am logged into the admin panel
    Given I am on the new article page
    When I fill in "article_title" with "article1"
    And I fill in "article__body_and_extended_editor" with "content1"
    And I press "Publish"
    Then I should be on the admin content page
    When I go to the home page
    Then I should see "article1"
    When I follow "article1"
    Then I should see "content1"

  Scenario: Successfully loggin in as admin as publisher
    And I am logged into the admin panel as publisher
    Given I am on the new article page
    When I fill in "article_title" with "article2"
    And I fill in "article__body_and_extended_editor" with "content2"
    And I press "Publish"
    Then I should be on the admin content page
    When I go to the home page
    Then I should see "article2"
    When I follow "article2"
    Then I should see "content2"
    And I should not see "content1"
