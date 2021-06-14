* Settings *
Documentation       Ações da funcionalidade de fechamento de Pedido 

* Keywords *
Go To Checkout
    Click       text=Fechar Pedido

    ${element}  Set Variable    css=.page-header

    Wait For Elements State    ${element}        visible     ${DEFAULT_TIMEOUT}
    Get Text                   ${element}        contains    Finalize o seu pedido

Fill Customer Data
    [Arguments]     ${customer}

    Fill Text       css=input[placeholder="Nome"]                       ${customer["name"]}
    Fill Text       css=input[placeholder="E-mail"]                     ${customer["email"]}
    Fill Text       css=input[formcontrolname="emailConfirmation"]      ${customer["email"]}

    Fill Text       css=input[placeholder="Endereço"]                   ${customer["address"]}
    Fill Text       css=input[placeholder="Número"]                     ${customer["number"]}

Select Payment Option
    [Arguments]     ${payment}

    IF  "${payment}" == "Dinheiro"

        Click   xpath=(//mt-radio//label)[1]//div

    ELSE IF  "${payment}" == "Cartão de Débito"

        Click   xpath=(//mt-radio//label)[2]//div

    ELSE IF  "${payment}" == "Cartão de Débito"

        Click   xpath=(//mt-radio//label)[32]//div

    ELSE    
    
        Fail     Invalid Payment Type

    END

Place Order
    Click       text=Concluir Pedido

Order Success
     Wait For Elements State     css=h2 >> text=Pedido Conluído     visible     ${DEFAULT_TIMEOUT}