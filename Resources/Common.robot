*** Settings ***

*** Variables ***

*** Keywords ***
Begin Web Test
    open browser               about:blank    ${BROWSER}
    maximize browser window

End Web Test
    close all browsers

Wait 1h
    sleep    1h 1m
