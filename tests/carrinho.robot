* Settings *
Resource        ${EXECDIR}/resources/base.robot

Test Setup     Start Session      
Test Teardown  Take Screenshot

* Test Cases *

Deve adicionar um item ao carrinho

    #${name}         Set Variable    STARBUGS COFFEE
    #${description}  Set Variable    Nada melhor que um café pra te ajudar a resolver um bug.

    &{restaurant}   Create Dictionary       restaurant=STARBUGS COFFEE    description=Nada melhor que um café pra te ajudar a resolver um bug.

    Go To Restaurants
    Choose Restaurant       ${restaurant}

    Add To Cart             Starbugs 500 error
    Should Add To cart      Starbugs 500 error

    Total Should Be    15,60 

Deve adicionar 3 itens ao carrinho
    #[tags]      default

    #${name}         Set Variable    STARBUGS COFFEE
    #${description}  Set Variable    Nada melhor que um café pra te ajudar a resolver um bug.

    ${cart}        Get JSON        cart.json

    Go To Restaurants
    Choose Restaurant           ${cart["restaurant"]}

    FOR  ${product}     IN      @{cart["products"]}
        Add To Cart             ${product["name"]}
        Should Add To Cart      ${product["name"]}
    END
        
    Total Cart Be        ${cart["total"]}

    #sleep 10