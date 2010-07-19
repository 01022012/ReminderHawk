Feature: Managing Companies
  So that I can use the app
  As a user 
  I want to be able to manage my company

Scenario: Create a new company
  Given an anonymous user
  When I go to the home page
  When I follow "Start Free Trial!"
  Then I should be on the new company page

   
