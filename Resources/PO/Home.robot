*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${HOME_WRAPPER} =                             class=wrapper-main
${HOME_INIT_SURVEY_POPUP_CLOSE_LINK} =        xpath=//div[@id="review_form3"]//a[@class='delete']
${HOME_FACEBOOK_LOGIN_POPUP_BUTTON} =         class=btn-facebook
${HOME_FACEBOOK_LOGIN_POPUP_EMAIL_INPUT} =    id=email
${HOME_FACEBOOK_LOGIN_POPUP_PASS_INPUT} =     id=pass
${HOME_GOOGLE_LOGIN_POPUP_BUTTON} =           class=btn-google
${HOME_GOOGLE_LOGIN_POPUP_EMAIL_INPUT} =      id=identifierId
${HOME_GOOGLE_LOGIN_POPUP_PASS_INPUT} =       xpath=//input[@type="password"]
${HOME_USER_NAME} =                           class=user_login

*** Keywords ***
Navigate to
    go to    ${URL}

Verify Page Loaded
    wait until page contains element    ${HOME_WRAPPER}

Close Initial Survey Popup
    click link                          ${HOME_INIT_SURVEY_POPUP_CLOSE_LINK}
    wait until page does not contain    ${HOME_INIT_SURVEY_POPUP_CLOSE_LINK}

Click Facebook Login Popup Button
    click link    ${HOME_FACEBOOK_LOGIN_POPUP_BUTTON}

Click Google Login Popup Button
    click link    ${HOME_LOGIN_POPUP_GOOGLE_BUTTON}

Input Facebook Login Popup User Email
    press keys    ${HOME_FACEBOOK_LOGIN_POPUP_EMAIL_INPUT}    ${USER_LOGIN_AND_FB_EMAIL}

Input Facebook Login Popup User Password
    press keys    ${HOME_FACEBOOK_LOGIN_POPUP_PASS_INPUT}    ${USER_FB_PASS}
    press keys    ${HOME_FACEBOOK_LOGIN_POPUP_PASS_INPUT}    RETURN

Verify User Logged In
    wait until page contains element    ${HOME_USER_NAME}    10s
