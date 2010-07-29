Feature: User creates a new request
  In order to perform a certain task using an item, a skill, or a transport 
  As a person who does not have the required item, skill, or transport
  I want to be able to request an item, a favor, or transport I need from other users
  
  Scenario: Creating a new item request successfully
    Given I am logged in
    And I am on the home page
    When I follow "Request something"
    And I check "Buy"
    And I fill in "listing_title" with "Sledgehammer"
    And I fill in "listing_description" with "My description"
    And I fill in "listing_tag_list" with "tools, hammers"
    And I attach "Australian_painted_lady.jpg" image to the "listing_image" file field
    And I press "Save request"
    Then I should see "Item request: Sledgehammer" within "h1"
    And I should see "borrow, buy" within ".share_types"
    And I should see "hammers, tools" within ".tags"
    And I should see "Request created successfully" within "#notifications"
    And I should see tag "img[@src*='']"
  
  Scenario: Creating a new favor request successfully
    Given I am logged in
    And I am on the home page
    When I follow "Request something"
    And I follow "Favor"
    And I fill in "listing_title" with "Massage"
    And I fill in "listing_description" with "My description"
    And I press "Save request"
    Then I should see "Favor request: Massage" within "h1"
    And I should see "Request created successfully" within "#notifications"
    
  Scenario: Creating a new rideshare request successfully
    Given I am logged in
    And I am on the home page
    When I follow "Request something"
    And I follow "Rideshare"
    And I fill in "listing_origin" with "Otaniemi"
    And I fill in "listing_destination" with "Turku"
    And I press "Save request"
    Then I should see "Rideshare request: Otaniemi - Turku" within "h1"
    And I should see "Request created successfully" within "#notifications" 
    
  Scenario: Trying to create a new request without being logged in
    Given I am not logged in
    And I am on the home page
    When I follow "Request something"
    Then I should see "You must log in to Kassi to create a new request." within "#notifications"
    And I should see "Log in to Kassi" within "h2"

  @javascript
  Scenario: Trying to create a new request with insufficient information
    Given I am logged in
    And I am on the home page
    When I follow "Request something"
    And I uncheck "borrow"
    And I press "Save request"
    Then I should see "This field is required." within ".error"
    And I should see "You must check at least one of the boxes above." within ".error"