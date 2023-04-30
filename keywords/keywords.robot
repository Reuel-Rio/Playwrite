*** Settings ***
Resource    ../resource/resource.robot
Resource    ../variable/default-variables.robot

*** Keywords ***
Navigate at ${URL} with ${Browser}
    Open Browser    ${URL}    ${Browser}

Espere pelo elemento ${ELEMENT} e clique
    Wait For Elements State    ${ELEMENT}
    Click                      ${ELEMENT}

Espere pelo elemento ${ELEMENT}
    Wait For Elements State    ${ELEMENT}

Preencher com nome: ${Name} e email: ${Email}
    ${NAME_PERSON}=        FakerLibrary.First Name    #a library "faker" so funciona quando retornada a uma variavel local.
    ${EMAIL_PERSON}=       FakerLibrary.Email         #a library "faker" so funciona quando retornada a uma variavel local.
    Set Global Variable    ${NAME_PERSON}
    Set Global Variable    ${EMAIL_PERSON}
    Type Text              ${Name}                    ${NAME_PERSON}
    log                    ${NAME_PERSON}
    Type Text              ${Email}                   ${EMAIL_PERSON}
    log                    ${EMAIL_PERSON}

Preencher completamente o formulario de cadastro
    ${LAST_NAME_PERSON}=       FakerLibrary.Last Name
    ${COMPANY}=                FakerLibrary.Company
    ${ADRESS1}=                FakerLibrary.Street Address
    ${ADRESS2}=                FakerLibrary.Street Address
    ${STATE}=                  FakerLibrary.State
    ${CITY}=                   FakerLibrary.City
    ${ZIPCODE}=                FakerLibrary.Postcode
    ${PHONE_NUMBER}=           FakerLibrary.Phone Number
    Set Global Variable        ${LAST_NAME_PERSON}
    Set Global Variable        ${COMPANY}
    Set Global Variable        ${ADRESS1}
    Set Global Variable        ${ADRESS2}
    Set Global Variable        ${STATE}
    Set Global Variable        ${CITY}
    Set Global Variable        ${ZIPCODE}
    Set Global Variable        ${PHONE_NUMBER}
    Click                      ${Title_Person}
    Type Text                  ${Password_Person}                                                123456
    Scroll To Element          ${Inp_Company}
    Select Options By          ${Click_day_Combobox}                                             value                  18
    Select Options By          ${Click_month_Combobox}                                           value                  7
    Select Options By          ${Click_year_Combobox}                                            value                  1970
    Click                      ${Checkbox_newsletter}
    Click                      ${Checkbox_receive}
    Type Text                  ${First_Name}                                                     ${NAME_PERSON}
    Type Text                  ${Last_Name}                                                      ${LAST_NAME_PERSON}
    Type Text                  ${Inp_Company}                                                    ${COMPANY}
    Type Text                  ${Inp_Adress1}                                                    ${ADRESS1}
    Type Text                  ${Inp_Adress2}                                                    ${ADRESS2}
    Select Options By          ${Click_contry_Combobox}                                          value                  Israel
    Type Text                  ${Inp_State}                                                      ${STATE}
    Type Text                  ${Inp_City}                                                       ${CITY}
    Type Text                  ${Inp_Zipcode}                                                    ${ZIPCODE}
    Type Text                  ${Inp_Mobile}                                                     ${PHONE_NUMBER}
    Click                      ${Submit_Form}
    Wait For Elements State    ${Title_count_create} 
    Click                      ${Btn_continue}
    Wait For Elements State    xpath=//*[@id="header"]//*[contains(text(),"${NAME_PERSON}")] 

Excluir usuario logado
    Wait For Elements State    ${Btn_Delet_user}
    Click                      ${Btn_Delet_user}
    Wait For Elements State    ${Title_Delete}
    Click                      ${Btn_continue}