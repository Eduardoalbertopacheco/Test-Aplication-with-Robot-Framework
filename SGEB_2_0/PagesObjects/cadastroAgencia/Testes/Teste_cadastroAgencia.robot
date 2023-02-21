*** Settings ***
Resource         ../../login/resource_login.robot
Resource         ../resource_Agencia.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***

Caso de teste 01 - Cadastrar agencia com suscesso
   Dado que estou no dasboard do sistema
   E clico em Agência
   E clico em Incluir Nova Agência
   Quando preencho todas as informações obrigatórios
   E clico em Salvar
   Então devo realizar o cadastro com sucesso

Caso de teste 02 - Campos obrigatórios
   Dado que eu acesso a tela de login do sistema
   Quando preencher as credenciais
   E clicar em Entrar
   Então devo logar com suscesso no sistema
   E clico em Agência
   E clico em Incluir Nova Agência
   Quando eu não preencher os campos obrigatórios e clicar em salvar
   Então devo visualizar Msg de campo obrigatório para Nome da Agência
   Então devo visualizar Msg de campo obrigatório para Sigla da Agência
   Então devo visualizar Msg de campo obrigatório para Esfera da Agência
   Então devo visualizar Msg de campo obrigatório para UF
   Então devo visualizar Msg de campo obrigatório para País
