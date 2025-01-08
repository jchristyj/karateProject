Feature: Demoo API

Background:
   * url 'https://reqres.in/api'
   * header Accept = 'application/json' 
  
#Simple Get reuqest
# rule url,.ethos status is small and urls give in single cots, GET in caps,
Scenario: demo1
Given url 'https://reqres.in/api/users?page=2'
When method GET
Then status 200
And print response
And print responseStatus
And print responseTime
And print responseCookies
And print responseHeaders

#get with Background and path
#path aslos in single cots
Scenario: demo2
Given path '/users?page=2'
When method GET
Then status 200
And print response

#get with Background,path and param
Scenario: demo3
Given path '/users'
And param page = 2
When method GET
Then status 200
And print response

#get with Assertions
Scenario: demo4
Given path '/users'
And param page = 2
When method GET
Then status 200
And print response
And match response.data[0].first_name != null
And assert response.data.length == 6
And match $.data[1].id == 8
And match $.data[3].last_name == 'Feilds'



