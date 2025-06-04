*** Settings ***
Resource  ./TestCaseSettings.robot

*** Test Cases ***
Verify user successfully checkout a product on saucedemo.com
    Given User go to saucedemo website  ${url}  ${browser}
    And User input username on login page  ${username}
    And User input password on login page  ${password}
    And User click login button on login page
    And User click add to cart button for item Sauce Labs Backpack on inventory page
    And User click shopping bag button on inventory page
    And User see item Sauce Labs Backpack with qty 1 and price $29.99 on cart page
    And User click checkout button on cart page
    And User input first name on checkout page  ${first_name}
    And User input last name on checkout page  ${last_name}
    And User input postal code on checkout page  ${postal_code}
    And User click continue button on checkout page
    And User see item Sauce Labs Backpack with qty 1 and price $29.99 on checkout page
    And User see payment information is SauceCard #31337 on checkout page
    And User see shipping information is Free Pony Express Delivery! on checkout page
    And User see price total information with item total $29.99 and tax $2.40 on checkout page
    And User see total is $32.39 on checkout page
    When User click finish button on checkout page
    Then User see success message Thank you for your order! on checkout page
    And User close the browser