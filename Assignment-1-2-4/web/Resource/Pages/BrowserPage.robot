*** Settings ***
Resource  ./PagesSettings.robot

*** Keywords ***
User go to saucedemo website
    [Arguments]  ${url}  ${browser}
    ${chrome_option}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method  ${chrome_option}  add_argument  --guest
    Call Method  ${chrome_option}  add_argument  --no-sandbox
    Call Method  ${chrome_option}  add_argument  --disable-dev-shm-usage
    Call Method  ${chrome_option}  add_argument  --disable-gpu
    Open Browser  ${url}  ${browser}  options=${chrome_option}
    Maximize Browser Window

User close the browser
    Close Browser