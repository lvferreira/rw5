* Settings *
Documentation        Ações da funcionalidade do carrinho de compras

* Keywords *
Add To Cart
    [Arguments]     ${name}
    
    Click       xpath=//span[text()="${name}"]/..//a[@class="add-to-cart"]

Should Add To cart
    [Arguments]     ${name}

    Wait For Elements State     css=#cart tr >> text=${name}     visible     ${DEFAULT_TIMEOUT}

Total Should Be
    [Arguments]     ${total}
    
    Get Text        xpath=//th[contains(text(),"Total")]/..//td     contains    ${total}
    Log             ${total}