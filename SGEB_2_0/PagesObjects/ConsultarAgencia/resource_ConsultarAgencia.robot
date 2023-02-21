

*** Settings ***
Library    SeleniumLibrary


*** Keywords ***

O sistema deve apresentar a tela de consulta de Agência
    Wait Until Element Is Visible    locator=//app-pesquisar-agencia/block-ui/div/div/div[1]
    Element Should Be Visible        locator=//app-pesquisar-agencia/block-ui/div/div/div[1]

Quando eu digitar 'AGENCIA 03' no campo nome da agencia
    Input Text    locator=//input[@placeholder='Procurar uma Agência pelo nome. Ex: PRF']    text=AGENCIA 03

# E clicar na AGENCIA 03 da lista para selecionar
#     Wait Until Element Is Visible    locator=//*[@id="pr_id_22_list"]/li[2]
#     # Click Element    locator=//*[@id="pr_id_20_list"]/li[1]/div/div
#     Click Element   locator=//*[@id="pr_id_22_list"]/li[2]

Quando clicar em Consultar
    Click Element    locator=//span[contains(.,'Consultar')]

Então o sistema deve mostrar a agencia no resultado da consulta
    Element Should Be Visible    locator=//div[@class='col-md-6 padding-left-0'][contains(.,'Resultado da Pesquisa')]
    Element Should Be Visible    locator=//td[contains(.,'AGENCIA 03')]
E os botões Visualizar, Editar e Excluir    
    Element Should Be Visible    locator=//div/div/div[3]/div/p-table/div/div/table/tbody/tr/td[9]
