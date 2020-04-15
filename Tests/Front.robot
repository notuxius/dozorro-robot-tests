*** Settings ***
Documentation  Test suite
Resource  ../Resources/FrontApp.robot
Resource  ../Resources/EmailApp.robot
Resource  ../Resources/Common.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

*** Variables ***
${BROWSER} =  chrome
${URL} =  https://dev.dozorro.work

${USER_LOGIN_FB_EMAIL} =  Set login email password from command line with '-v USER_LOGIN_FB_EMAIL:login_fb_email'
${USER_LOGIN_EMAIL_PASS} =  Set login email password from command line with '-v USER_LOGIN_EMAIL_PASS:login_email_password'
${USER_FB_NAME} =  Set Facebook name from command line with "-v USER_FB_NAME:'fb_name'"
${USER_FB_PASS} =  Set Facebook password from command line with '-v USER_FB_PASS:fb_password'

*** Test Cases ***
User should be able to activate and deactivate email channel subscription with correct url token
    [Documentation]  Test case
    [Tags]  Subscription
    FrontApp.Login as User
    FrontApp.Send Activation Email
    EmailApp.Activate Channel Subscription with Correct Url Token
    FrontApp.Verify Email Channel Activation
    FrontApp.Deactivate Email Channel Subscription
    # TODO add deactivatated email channel subscription and delete url token message on teardown

User should not be able to activate email channel subscription with incorrect url token
    [Documentation]  Test case
    [Tags]  Subscription
    FrontApp.Login as User
    FrontApp.Send Activation Email
    EmailApp.Try to Activate Channel Subscription with Incorrect Url Token
    FrontApp.Verify Email Channel is not Activated
    # TODO add activate email channel subscription and delete url token message on teardown

User should not be able to activate email channel subscription with expired url token
    [Documentation]  Test case
    [Tags]  Subscription
    FrontApp.Login as User
    FrontApp.Send Activation Email
    sleep  1h 1m
    EmailApp.Activate Channel Subscription with Correct Url Token
    FrontApp.Verify Email Channel is not Activated due to Timeout
    # TODO add activate email channel subscription and delete url token message on teardown
