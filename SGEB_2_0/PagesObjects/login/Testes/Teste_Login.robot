*** Settings ***
Resource         ../resource_login.robot
Resource         ../resource_login.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
Cenário 01 - Login Sem Preencher nenhum Campo
    Dado que eu acesso a tela de login do sistema
    E não preencho nenhum campo
    E clicar em Entrar
    Então devo visualizar Msg de campo abrigatório para usuário
    Então devo visualizar Msg de campo abrigatório para Senha
    Então devo visualizar Msg de campo abrigatório para token

Cenário 02 - Login Com Senha Incorreta
    Dado que eu acesso a tela de login do sistema
    E prencho o campo 'Usuário'
    E prencho o campo 'Senha' com uma senha Incorreta
    E prencho o campo 'Token'
    E clicar em Entrar
    Então devo visualizar um popup de problema com a senha  

Cenário 03 - Realizae Login Com Suceso no Sitema
    Dado que eu acesso a tela de login do sistema
    Quando preencher as credenciais
    E clicar em Entrar
    Então devo logar com suscesso no sistema



  