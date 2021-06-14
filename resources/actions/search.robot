* Settings *
Documentation        Ações da funcionalidade de busca de restaurantes

* Variables *
${DIV_BOX}       css=div[class="place-info-box"][style="opacity: 1;"]

* Keywords *
Go To Restaurants
    Click           text=Estou com fome!
     # Checkpoint
    Get Text        h1 strong   contains    Ta na hora de matar a fome!

Choose Restaurant
    [Arguments]         ${super_var}

    Click          text=${super_var["restaurant"]}

    Wait For Elements State         css=#detail     visible     ${DEFAULT_TIMEOUT}
    Get Text    css=#detail     contains        ${super_var["desc"]}

Search By
    [Arguments]    ${value}

    Click                       css=.search-link
    Fill Text                   css=input[formcontrolname= "searchControl"]        ${value}

Should Be Visible
    [Arguments]    ${name}

    Wait For Elements State    ${DIV_BOX}   visible  ${DEFAULT_TIMEOUT}
    Get Text                   ${DIV_BOX}   contains     ${name}

Count
    [Arguments]    ${qtd}

    Wait For Elements State    ${DIV_BOX}   visible  ${DEFAULT_TIMEOUT}
    Get Element Count          ${DIV_BOX}   equal        ${qtd}
