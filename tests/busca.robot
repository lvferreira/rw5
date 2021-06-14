* Settings *
Resource        ${EXECDIR}/resources/base.robot

Test Setup     Start Session      
Test Teardown  Take Screenshot

* Test Cases *

Buscar um restaurante

     Go To Restaurants
     Search By            Debuger
     Should Be Visible    DEBUGER KING
     Count                1

Deve buscar por categoria

     Go To Restaurants
     Search By            Cafe
     Should Be Visible    STARBUGS COFFEE

Deve buscar todos os restaurantes

     Go To Restaurants
     Search By    a
     Count        5 

