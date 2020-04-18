*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TOP_NAV_LOGIN_LINK} =               xpath=//a[@data-formjs="open_login"]
${TOP_NAV_USER_NAME_LINK}             class=user_login
${TOP_NAV_USER_NOTIFICATIONS_LINK}    css=ul.dropdown-menu a[href$='/user/notify']

*** Keywords ***
Click Login Button
    click element    ${TOP_NAV_LOGIN_LINK}

Click User Nofications Link
    click element    ${TOP_NAV_USER_NAME_LINK}
    click element    ${TOP_NAV_USER_NOTIFICATIONS_LINK}
