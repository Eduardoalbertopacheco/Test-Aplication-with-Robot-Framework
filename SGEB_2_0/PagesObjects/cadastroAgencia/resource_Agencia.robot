*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Resource    ../login/resource_login.robot

*** Variables ***
${NOME_AGENCIA}                 //input[contains(@formcontrolname,'nomeAgencia')]
${SIGLA_AGENCIA}                //input[@formcontrolname='siglaAgencia']
${CNPJ_AGENCIA}                 //input[@formcontrolname='cnpjAgencia']
${EMAIL_AGENCIA}                //input[@formcontrolname='emailAgencia'] 
${TELEFONE_AGENCIA}             //input[@formcontrolname='telefoneAgencia']
${ESFERA_AGENCIA}               //div/div[1]/div[1]/div[6]/p-dropdown/div/span
${SELECT_ESFERA_ESTADUAL}       //div[6]/p-dropdown/div/div[3]/div/ul/p-dropdownitem[4]/li
${UF}                           //div[1]/div[1]/div[7]/p-dropdown/div/span     
${SELECT_UF_DF}                 //li[@role='option'][contains(.,'DF')]
${OTHERS_INFORMATIONS}          //textarea[@formcontrolname='informacaoAgencia']      
${MENU_LATERAL_AGENCIA}         //html/body/app-dashboard/div/app-sidebar/app-sidebar-nav/app-sidebar-nav-items/app-sidebar-nav-dropdown[1]/app-sidebar-nav-items/app-sidebar-nav-link[1]/a
${BTN_SALVAR}                   //button[contains(.,'Salvar')]


*** Keywords ***
Dado que estou no dasboard do sistema
    Dado que eu acesso a tela de login do sistema
    Quando preencher as credenciais
    E clicar em Entrar
    Então devo logar com suscesso no sistema

E clico em Agência
    Wait Until Element Is Visible    locator=${MENU_LATERAL_AGENCIA}
    Click Link    locator=${MENU_LATERAL_AGENCIA}

E clico em Incluir Nova Agência
    Wait Until Element Is Visible    locator=//button[contains(.,'Incluir Nova Agência')]
    Click Button    locator=//button[contains(.,'Incluir Nova Agência')]
    Element Should Be Visible    locator=//h5[contains(.,'Cadastrar Agência')]

Quando preencho todas as informações obrigatórios

    # FOR  ${i}   IN RANGE  3
    #     ${NOME_AGENCIA_FAKER}    FakerLibrary.Name
    #     Input Text        locator=${NOME_AGENCIA}        text=${NOME_AGENCIA_FAKER}
    #     ${SIGLA_AGENCIA_FAKER}    FakerLibrary.Word
    #     Input Text        locator=${SIGLA_AGENCIA}       text=${SIGLA_AGENCIA_FAKER}
    #     Input Text        locator=${CNPJ_AGENCIA}        text=47009598000143
    #     Input Text        locator=${EMAIL_AGENCIA}       text=eduardotester@gmail.com
    #     Input Text        locator=${TELEFONE_AGENCIA}    text=44555566333
    #     Click Element     locator=${ESFERA_AGENCIA}
    #     Click Element     locator=${SELECT_ESFERA_ESTADUAL}
    #     Click Element     locator=${UF}
    #     Click Element     locator=${SELECT_UF_DF}
    #     Input Text        locator=${OTHERS_INFORMATIONS}    text=TESTE COM ROBOT FRAMEWORK
    #     E clico em Salvar
    #     Então devo realizar o cadastro com sucesso
    #     Wait Until Element Is Visible    locator=//button[contains(.,'Incluir Nova Agência')]
    #     E clico em Incluir Nova Agência

    # END
    
    ${NOME_AGENCIA_FAKER}    FakerLibrary.Name
    Input Text        locator=${NOME_AGENCIA}        text=${NOME_AGENCIA_FAKER}
    ${SIGLA_AGENCIA_FAKER}    FakerLibrary.Word
    Input Text        locator=${SIGLA_AGENCIA}       text=${SIGLA_AGENCIA_FAKER}
    Input Text        locator=${CNPJ_AGENCIA}        text=47009598000143
    Input Text        locator=${EMAIL_AGENCIA}       text=eduardotester@gmail.com
    Input Text        locator=${TELEFONE_AGENCIA}    text=44555566333
    Click Element     locator=${ESFERA_AGENCIA}
    Click Element     locator=${SELECT_ESFERA_ESTADUAL}
    Click Element     locator=${UF}
    Click Element     locator=${SELECT_UF_DF}
    Input Text        locator=${OTHERS_INFORMATIONS}    text=TESTE COM ROBOT FRAMEWORK
E clico em Salvar
    Click Button      locator=//button[contains(.,'Salvar')]
Então devo realizar o cadastro com sucesso 
    Wait Until Element Is Visible    locator=//div[@class='p-toast-message-content'][contains(.,'Agência salva com sucesso.')]
    Element Should Be Visible        locator=//div[@class='p-toast-message-content'][contains(.,'Agência salva com sucesso')]
Quando eu não preencher os campos obrigatórios e clicar em salvar
    Click Button      locator=//button[contains(.,'Salvar')]

Então devo visualizar Msg de campo obrigatório para Nome da Agência
    Element Should Be Visible    locator=//*[@id="p-panel-1-content"]/div/div[1]/div[1]/div[1]/div
Então devo visualizar Msg de campo obrigatório para Sigla da Agência
    Element Should Be Visible    locator=//*[@id="p-panel-1-content"]/div/div[1]/div[1]/div[2]
Então devo visualizar Msg de campo obrigatório para Esfera da Agência
    Element Should Be Visible    locator=//*[@id="p-panel-1-content"]/div/div[1]/div[1]/div[6]
Então devo visualizar Msg de campo obrigatório para UF
    Element Should Be Visible    locator=//*[@id="p-panel-1-content"]/div/div[1]/div[1]/div[7]
Então devo visualizar Msg de campo obrigatório para País 
    Element Should Be Visible    locator=//*[@id="p-panel-1-content"]/div/div[1]/div[1]/div[8]
