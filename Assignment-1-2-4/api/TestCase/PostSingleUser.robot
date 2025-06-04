*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    DateTime

*** Variables ***
${base_url}    https://reqres.in
${name}        lion
${job}         qa
${response}  ${EMPTY}

*** Test Cases ***
Verify user successfully create new user by api
    Given User create session for reqres API
    When User send POST request to create new user with name ${name} and job ${job}
    Then User should receive response with status code 201
    And User see response header should contain Content-Type application/json; charset=utf-8
    And User see response body should contain created user name ${name}
    And User see response body should contain created user job ${job}
    And User see response body should contain valid id
    And User see response body should contain valid created at timestamp

*** Keywords ***
User create session for reqres API
    Create Session    user_api    ${base_url}

User send POST request to create new user with name ${user_name} and job ${user_job}
    ${headers}=    Create Dictionary    Content-Type=application/json    x-api-key=reqres-free-v1
    ${body}=    Create Dictionary    name=${user_name}    job=${user_job}
    ${response}=    POST On Session    user_api    /api/users    json=${body}    headers=${headers}
    Set Test Variable    ${response}

User should receive response with status code ${expected_status}
    Status Should Be    ${expected_status}    ${response}

User see response header should contain Content-Type ${expected_content_type}
    Dictionary Should Contain Item    ${response.headers}    Content-Type    ${expected_content_type}

User see response body should contain created user name ${expected_name}
    ${response_json}=    Set Variable    ${response.json()}
    Should Be Equal As Strings    ${response_json['name']}    ${expected_name}

User see response body should contain created user job ${expected_job}
    ${response_json}=    Set Variable    ${response.json()}
    Should Be Equal As Strings    ${response_json['job']}    ${expected_job}

User see response body should contain valid id
    ${response_json}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${response_json}    id
    Should Not Be Empty    ${response_json['id']}

User see response body should contain valid created at timestamp
    ${response_json}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${response_json}    createdAt
    ${timestamp}=    Set Variable    ${response_json['createdAt']}
    Should Match Regexp    ${timestamp}    ^\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}\\.\\d{3}Z$ 