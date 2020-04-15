*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${HOME_WRAPPER} =  class=wrapper-main
${HOME_INIT_SURVEY_POPUP_CLOSE_LINK} =  xpath=//div[@id="review_form3"]//a[@class='delete']
${HOME_LOGIN_POPUP_FACEBOOK_BUTTON} =  class=btn-facebook
# ${HOME_LOGIN_POPUP_GOOGLE_BUTTON} =  class=btn-google
${HOME_LOGIN_POPUP_FACEBOOK_EMAIL_INPUT} =  id=email
# ${HOME_LOGIN_POPUP_GOOGLE_EMAIL_INPUT} =  id=identifierId
${HOME_LOGIN_POPUP_FACEBOOK_PASS_INPUT} =  id=pass
# ${HOME_LOGIN_POPUP_GOOGLE_PASS_INPUT} =  xpath=//input[@type="password"]

*** Keywords ***
Navigate to
    go to  ${URL}

Verify Page Loaded
    wait until page contains element  ${HOME_WRAPPER}

Close Initial Survey Popup
    click link  ${HOME_INIT_SURVEY_POPUP_CLOSE_LINK}
    # TODO change to wait until page not contains
    sleep  0.5s

Click Login Popup Facebook Button
    click link  ${HOME_LOGIN_POPUP_FACEBOOK_BUTTON}

# Click Login Popup Google Button
#     click link  ${HOME_LOGIN_POPUP_GOOGLE_BUTTON}

Input Login Popup User Email
    press keys  ${HOME_LOGIN_POPUP_FACEBOOK_EMAIL_INPUT}  ${USER_LOGIN_FB_EMAIL}
    
Input Login Popup User Password
    press keys  ${HOME_LOGIN_POPUP_FACEBOOK_PASS_INPUT}  ${USER_FB_PASS}
    press keys  ${HOME_LOGIN_POPUP_FACEBOOK_PASS_INPUT}  RETURN

Verify User Logged In
    wait until page contains  ${USER_FB_NAME}  10s
    