*** Settings ***
Resource  ../Pages/PagesSettings.robot

*** Keywords ***
User input first name on checkout page
    [Arguments]  ${first_name}
    Input Text  ${textfield_first_name}  ${first_name}

User input last name on checkout page
    [Arguments]  ${last_name}
    Input Text  ${textfield_last_name}  ${last_name}

User input postal code on checkout page
    [Arguments]  ${postal_code}
    Input Text  ${textfield_postal_code}  ${postal_code}

User click continue button on checkout page
    Click Button  ${button_continue}

User see item ${item_name} with qty ${qty} and price ${price} on checkout page
    ${item_name_locator}=    Replace String    ${label_item_name}       {item_name}    ${item_name}
    ${item_qty_locator}=     Replace String    ${label_item_quantity}   {item_name}    ${item_name}
    ${item_price_locator}=   Replace String    ${label_item_price}      {item_name}    ${item_name}

    ${actual_item_name}=     Get Text    ${item_name_locator}
    ${actual_item_qty}=      Get Text    ${item_qty_locator}
    ${actual_item_price}=    Get Text    ${item_price_locator}

    Should Be Equal    ${actual_item_name}     ${item_name}
    Should Be Equal    ${actual_item_qty}      ${qty}
    Should Be Equal    ${actual_item_price}    ${price}

User see payment information is ${payment_info} on checkout page
    ${actual_payment_info}  Get Text  ${label_payment_info}
    Should Be Equal  ${actual_payment_info}  ${payment_info}

User see shipping information is ${shipping_info} on checkout page
    ${actutal_shipping_info}  Get Text  ${label_shipping_info}
    Should Be Equal  ${actutal_shipping_info}  ${shipping_info}

User see price total information with item total ${item_total_price} and tax ${tax_price} on checkout page
    ${item_total_price_text}  Get Text  ${label_item_total_price}
    ${tax_price_text}  Get Text  ${label_tax_price}

    ${actual_item_total_price}  Replace String  ${item_total_price_text}  Item total: $  $
    ${actual_tax_price}  Replace String  ${tax_price_text}  Tax: $  $

    Should Be Equal  ${actual_item_total_price}  ${item_total_price}
    Should Be Equal  ${actual_tax_price}  ${tax_price}

User see total is ${total_price} on checkout page
    ${total_price_text}  Get Text  ${label_total_price}
    ${actual_total_price}  Replace String  ${total_price_text}  Total: $  $
    Should Be Equal  ${actual_total_price}  ${total_price}

User click finish button on checkout page
    Click Button  ${button_finish}

User see success message ${thankyou_message} on checkout page
    ${label_thankyou_order_text}  Get Text  ${label_thankyou_order}
    Should Be Equal  ${label_thankyou_order_text}  ${thankyou_message}