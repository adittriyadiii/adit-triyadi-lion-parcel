*** Settings ***
Resource  ./PagesSettings.robot

*** Keywords ***
User input username on login page
    [Arguments]  ${username}
    Input Text  ${textfield_username}  ${username}

User input password on login page
    [Arguments]  ${password}
    Input Password  ${textfield_password}  ${password}

 User click login button on login page
     Click Button  ${button_login}