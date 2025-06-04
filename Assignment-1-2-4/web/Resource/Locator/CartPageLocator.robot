*** Variables ***
${button_checkout}  id=checkout

# Label Cart Item
${cart_item}  //div[@class="cart_item" and .//div[@data-test="inventory-item-name"][text()="{item_name}"]]
${label_item_name}  xpath=${cart_item}//div[@data-test="inventory-item-name"]
${label_item_quantity}  xpath=${cart_item}//div[@data-test="item-quantity"]
${label_item_price}  xpath=${cart_item}//div[@data-test="inventory-item-price"]