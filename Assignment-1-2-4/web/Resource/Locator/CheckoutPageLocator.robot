*** Variables ***
${button_continue}  id=continue
${button_finish}  id=finish

# Label Cart Item
${cart_item}  //div[@class="cart_item" and .//div[@data-test="inventory-item-name"][text()="{item_name}"]]
${label_item_name}  xpath=${cart_item}//div[@data-test="inventory-item-name"]
${label_item_quantity}  xpath=${cart_item}//div[@data-test="item-quantity"]
${label_item_price}  xpath=${cart_item}//div[@data-test="inventory-item-price"]

# Label Checkout Information
${label_payment_info}  css=div[data-test="payment-info-value"]
${label_shipping_info}  css=div[data-test="shipping-info-value"]
${label_item_total_price}  css=div[data-test="subtotal-label"]
${label_tax_price}  css=div[data-test="tax-label"]
${label_total_price}  css=div[data-test="total-label"]
${label_thankyou_order}  css=h2[data-test="complete-header"]

# Textfield
${textfield_first_name}  id=first-name
${textfield_last_name}  id=last-name
${textfield_postal_code}  id=postal-code