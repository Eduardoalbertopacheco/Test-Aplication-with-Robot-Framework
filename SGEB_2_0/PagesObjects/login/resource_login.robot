*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}                     chrome
${URL}                         https://sgeb-dsv.prf.gov.br/#/dashboard
${BRASAO_lOGIN_PAGE}           //img[@src='assets/img/brand/brasao-lg.png']
${USER_NAME}                    02180747004
${USER_SENHA}                   123
${USER_TOKEN}                   123456

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Dado que eu acesso a tela de login do sistema
    Go To    url=${URL}
    Element Should Be Visible    locator=${BRASAO_lOGIN_PAGE}

Quando preencher as credenciais
    Input Text    locator=//input[contains(@formcontrolname,'chave')]    text=${USER_NAME}
    Input Password    locator=//input[@type='password']   password=${USER_SENHA}
    Input Text    locator=//input[contains(@placeholder,'Token')]   text=${USER_TOKEN} 

E clicar em Entrar
    Click Button    locator=//button[contains(@type,'submit')]

 Então devo logar com suscesso no sistema
    Element Should Be Visible    locator=//div[@class='card-body text-center'][contains(.,'SGEBSistema de Gerenciamento de Escolta e Batedor')]

E não preencho nenhum campo
    No Operation

Então devo visualizar Msg de campo abrigatório para usuário
    Element Should Be Visible    locator=//div[2]/div/div/form/div[1]/app-mensagens-sistema/div

Então devo visualizar Msg de campo abrigatório para Senha
    Element Should Be Visible    locator=//div[2]/div/div/form/div[2]/app-mensagens-sistema/div

Então devo visualizar Msg de campo abrigatório para token
    Element Should Be Visible    locator=//div[2]/div/div/form/div[3]/app-mensagens-sistema/div


E prencho o campo 'Usuário'
    Input Text    locator=//input[contains(@formcontrolname,'chave')]    text=${USER_NAME}

E prencho o campo 'Senha' com uma senha Incorreta
    Input Password    locator=//input[@type='password']   password=12

E prencho o campo 'Token'    
    Input Text    locator=//input[contains(@placeholder,'Token')]   text=${USER_TOKEN}

Então devo visualizar um popup de problema com a senha
    Wait Until Element Is Visible    locator=//div[@class='p-toast-detail'][contains(.,'Problema na solicitação de Login. Procurar DIASI/CGPLAM.')]
    Element Should Be Visible    locator=//div[@class='p-toast-detail'][contains(.,'Problema na solicitação de Login. Procurar DIASI/CGPLAM.')]

