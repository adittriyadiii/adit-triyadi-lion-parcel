*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}    https://reqres.in
${id}          2
${response}    ${EMPTY}

*** Test Cases ***
Verify user successfully get single user by api
    Given User create session for reqres API
    When User send GET request to get single user with id ${id}
    Then User should receive response with status code 200
    And User see response header should contain Content-Type application/json; charset=utf-8
    And User see response body should contain user data with id ${id}
    And User see response body should contain user first name Janet
    And User see response body should contain user last name Weaver
    And User see response body should contain user email janet.weaver@reqres.in
    And User see response body should contain user avatar https://reqres.in/img/faces/2-image.jpg
    And User see response body should contain support information

*** Keywords ***
User create session for reqres API
    Create Session    user_api    ${base_url}

User send GET request to get single user with id ${user_id}
    ${response}=    GET On Session    user_api    /api/users/${user_id}
    Set Test Variable    ${response}

User should receive response with status code ${expected_status}
    Status Should Be    ${expected_status}    ${response}
    Log Full Response Body

User see response header should contain Content-Type ${expected_content_type}
    Dictionary Should Contain Item    ${response.headers}    Content-Type    ${expected_content_type}

User see response body should contain user data with id ${expected_id}
    ${response_json}=    Set Variable    ${response.json()}
    Should Be Equal As Integers    ${response_json['data']['id']}    ${expected_id}

User see response body should contain user first name ${expected_first_name}
    ${response_json}=    Set Variable    ${response.json()}
    Should Be Equal As Strings    ${response_json['data']['first_name']}    ${expected_first_name}

User see response body should contain user last name ${expected_last_name}
    ${response_json}=    Set Variable    ${response.json()}
    Should Be Equal As Strings    ${response_json['data']['last_name']}    ${expected_last_name}

User see response body should contain user email ${expected_email}
    ${response_json}=    Set Variable    ${response.json()}
    Should Be Equal As Strings    ${response_json['data']['email']}    ${expected_email}

User see response body should contain user avatar ${expected_avatar}
    ${response_json}=    Set Variable    ${response.json()}
    Should Be Equal As Strings    ${response_json['data']['avatar']}    ${expected_avatar}

User see response body should contain support information
    ${response_json}=    Set Variable    ${response.json()}
    Should Be Equal As Strings    ${response_json['support']['url']}     https://contentcaddy.io?utm_source=reqres&utm_medium=json&utm_campaign=referral
    Should Be Equal As Strings    ${response_json['support']['text']}    Tired of writing endless social media content? Let Content Caddy generate it for you.

Log Full Response Body
    ${response_json}=    Set Variable    ${response.json()}
    ${formatted_json}=    Evaluate    json.dumps($response_json, indent=3)    json
    Log To Console     ${formatted_json}