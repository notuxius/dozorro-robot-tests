*** Settings ***

*** Variables ***
${TOP_NAV_LOGIN_LINK} =        xpath=//a[@data-formjs="open_login"]
${TOP_NAV_USER_NAME_LINK}      class=user_login
${TOP_NAV_USER_NOTIFY_LINK}    css=ul.dropdown-menu a[href$='/user/notify']

*** Keywords ***
Click Login Button
    click element    ${TOP_NAV_LOGIN_LINK}

Click User Nofications Link
    click element    ${TOP_NAV_USER_NAME_LINK}
    click element    ${TOP_NAV_USER_NOTIFY_LINK}
