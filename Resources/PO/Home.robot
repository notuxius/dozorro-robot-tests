*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${HOME_INIT_SURVEY_POPUP_CLOSE_LINK} =        xpath=//div[@id="review_form3"]//a[@class='delete']
${HOME_FACEBOOK_LOGIN_POPUP_BUTTON} =         class=btn-facebook
${HOME_FACEBOOK_LOGIN_POPUP_EMAIL_INPUT} =    id=email
${HOME_FACEBOOK_LOGIN_POPUP_PASS_INPUT} =     id=pass
${HOME_GOOGLE_LOGIN_POPUP_BUTTON} =           class=btn-google
${HOME_GOOGLE_LOGIN_POPUP_EMAIL_INPUT} =      id=identifierId
${HOME_GOOGLE_LOGIN_POPUP_PASS_INPUT} =       xpath=//input[@type="password"]

*** Keywords ***
Navigate to
    go to    ${URL}

Close Initial Survey Popup
    click link                          ${HOME_INIT_SURVEY_POPUP_CLOSE_LINK}
    wait until page does not contain    ${HOME_INIT_SURVEY_POPUP_CLOSE_LINK}

Open Login Popup
    Home.Navigate to
    Close Initial Survey Popup
    TopNav.Click Login Button

Click Facebook Login Popup Button
    click link    ${HOME_FACEBOOK_LOGIN_POPUP_BUTTON}

Enter Facebook Login Popup User Email
    press keys    ${HOME_FACEBOOK_LOGIN_POPUP_EMAIL_INPUT}    ${USER_LOGIN}

Enter Facebook Login Popup User Password
    press keys    ${HOME_FACEBOOK_LOGIN_POPUP_PASS_INPUT}    ${USER_PASS}
    press keys    ${HOME_FACEBOOK_LOGIN_POPUP_PASS_INPUT}    RETURN

Click Google Login Popup Button
    click link    ${HOME_GOOGLE_LOGIN_POPUP_BUTTON}

Enter Google Login Popup User Email
    press keys    ${HOME_GOOGLE_LOGIN_POPUP_EMAIL_INPUT}    ${USER_LOGIN}
    press keys    ${HOME_GOOGLE_LOGIN_POPUP_EMAIL_INPUT}    RETURN

Enter Google Login Popup User Password
    wait until element is visible    ${HOME_GOOGLE_LOGIN_POPUP_PASS_INPUT}
    press keys                       ${HOME_GOOGLE_LOGIN_POPUP_PASS_INPUT}    ${USER_PASS}
    press keys                       ${HOME_GOOGLE_LOGIN_POPUP_PASS_INPUT}    RETURN

Verify User Logged In
    wait until page contains element    ${TOP_NAV_USER_NAME_LINK}    10s
