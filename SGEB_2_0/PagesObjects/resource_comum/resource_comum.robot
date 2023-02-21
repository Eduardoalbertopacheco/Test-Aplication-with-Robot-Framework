*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${BROUSER}        chrome

*** Keywords ***
Abrir navegador
    Open Browser        about:blank     ${BROUSER}

Fechar navegador
    Capture Page Screenshot
    Close Browser