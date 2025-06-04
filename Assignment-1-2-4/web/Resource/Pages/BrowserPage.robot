*** Settings ***
Resource  ./PagesSettings.robot

*** Keywords ***
User go to saucedemo website
    [Arguments]  ${url}  ${browser}
    ${chrome_option}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method  ${chrome_option}  add_argument  --guest
    Open Browser  ${url}  ${browser}  options=${chrome_option}
    Maximize Browser Window

User close the browser
    Close Browser