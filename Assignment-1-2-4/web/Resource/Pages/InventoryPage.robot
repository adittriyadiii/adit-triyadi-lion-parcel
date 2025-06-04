*** Settings ***
Resource  ./PagesSettings.robot

*** Keywords ***
User click add to cart button for item ${item_name} on inventory page
    ${item_name_lower_case}=    Convert To Lower Case    ${item_name}
    ${item_name_lower_case}=    Replace String    ${item_name_lower_case}    ${SPACE}    -
    ${locator}=    Replace String    ${button_add_to_cart}    {item_name}    ${item_name_lower_case}
    Wait Until Element Is Visible    ${locator}    timeout=10s
    Wait Until Element Is Enabled    ${locator}    timeout=10s
    Click Element    ${locator}

User click shopping bag button on inventory page
    Wait Until Element Is Visible    ${button_shopping_bag}    timeout=10s
    Wait Until Element Is Enabled    ${button_shopping_bag}    timeout=10s
    Click Element    ${button_shopping_bag}