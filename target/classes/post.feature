Feature: Post API demo

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read('response1.json')

  Scenario: Post demo 1
    Given url 'https://reqres.in/api/users'
    And request {"name": "jo","job": "tester"}
    When method POST
    Then status 201
    And print response

  Scenario: Post demo 2
    Given path '/users'
    And request {"name": "chris","job": "tester"}
    When method POST
    Then status 201
    And print response

  Scenario: Post with assertions demo 3
    Given path '/users'
    And request {"name": "chris","job": "tester"}
    When method POST
    Then status 201
    And match response == {"name": "chris","job": "tester","id": "#string","createdAt": "#ignore"}
    And print response

  Scenario: Post with reponse file demo 4
    Given path '/users'
    And request {"name": "chris","job": "tester"}
    When method POST
    Then status 201
    And match response == expectedOutput
    And print response

  Scenario: Post read from request file demo 5
    Given path '/users'
    And def projectPath = karate.properties['user.dir']
    Then print projectPath
    And def filePath = projectPath + '/karateProject/src/test/java/data/request.json'
    Then print projectPath
    And def requestBody = filePath
    And request requestBody
    When method POST
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response

  Scenario: Post with reponse file demo 4
    Given path '/users'
    And def reqBody = read('request.json')
    And set reqBody.job = 'engineer'
    And request reqBody
    When method POST
    Then status 201
    And match response == expectedOutput
    And print response
