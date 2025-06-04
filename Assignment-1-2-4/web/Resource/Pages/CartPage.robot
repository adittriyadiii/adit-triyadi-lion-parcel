*** Settings ***
Resource  ./PagesSettings.robot

*** Keywords ***
User see item ${item_name} with qty ${qty} and price ${price} on cart page
    ${item_name_locator}=    Replace String    ${label_item_name}       {item_name}    ${item_name}
    ${item_qty_locator}=     Replace String    ${label_item_quantity}   {item_name}    ${item_name}
    ${item_price_locator}=   Replace String    ${label_item_price}      {item_name}    ${item_name}

    ${actual_item_name}=     Get Text    ${item_name_locator}
    ${actual_item_qty}=      Get Text    ${item_qty_locator}
    ${actual_item_price}=    Get Text    ${item_price_locator}

    Should Be Equal    ${actual_item_name}     ${item_name}
    Should Be Equal    ${actual_item_qty}      ${qty}
    Should Be Equal    ${actual_item_price}    ${price}

User click checkout button on cart page
    Click Button  ${button_checkout}