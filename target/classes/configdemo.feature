Feature: config demo

  Background: 
    * url baseURL
    * header Accept = 'application/json'

  Scenario: config demo 1
    Given print name

  #Simple Get reuqest
  Scenario: demo1
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response
