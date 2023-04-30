*** Settings ***
Resource    ../keywords/keywords.robot

*** Test Case ***
Test Case 1: Register User
    Navigate at https://automationexercise.com/ with chromium
    Espere pelo elemento ${login} e clique
    Espere pelo elemento ${NewUser}
    Preencher com nome: ${Name} e email: ${Email}
    Click                                                        ${SubmitSingIn}
    Espere pelo elemento ${Title_Information}
    Preencher completamente o formulario de cadastro
    Excluir usuario logado
    Sleep                                                        5s
    Close Browser