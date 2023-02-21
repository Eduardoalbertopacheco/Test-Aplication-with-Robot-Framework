

*** Settings ***
Resource         ../../login/resource_login.robot
Resource         ../../cadastroAgencia/resource_Agencia.robot
Resource         ../resource_ConsultarAgencia.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Cenário 01 - Consultar Agência
    Dado que estou no dasboard do sistema
    E clico em Agência
    O sistema deve apresentar a tela de consulta de Agência
    Quando eu digitar 'AGENCIA 03' no campo nome da agencia
    # E clicar na AGENCIA 03 da lista para selecionar
    Quando clicar em Consultar
    Então o sistema deve mostrar a agencia no resultado da consulta
    E os botões Visualizar, Editar e Excluir 