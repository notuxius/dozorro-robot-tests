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

# TODO should this vars be initialized?
${SEND_TO_EMAIL} =  
${USER_LOGIN_AND_FB_EMAIL} =  
${USER_LOGIN_EMAIL_PASS} =  
${USER_FB_PASS} =  

*** Test Cases ***
User should be able to activate and deactivate email channel subscription with correct url token
    [Documentation]  Test case
    [Tags]  Subscription
    # Home.Navigate to
    # Home.Verify Page Loaded
    # Home.Close Initial Survey Popup
    FrontApp.Login as User
    FrontApp.Send Activation Email
    EmailApp.Activate Channel Subscription with Correct Url Token
    FrontApp.Verify Email Channel is Activated
    FrontApp.Deactivate Email Channel Subscription
    FrontApp.Restore Email Channel Subscription
    FrontApp.Remove Email Channel Subscription

User should not be able to activate email channel subscription with incorrect url token
    [Documentation]  Test case
    [Tags]  Subscription
    FrontApp.Login as User
    FrontApp.Send Activation Email
    EmailApp.Try to Activate Channel Subscription with Incorrect Url Token
    FrontApp.Verify Email Channel is not Activated
    Email.Nativage to Correct Url Token
    Email.Delete Url Token Message
    FrontApp.Verify Email Channel is Activated
    FrontApp.Remove Email Channel Subscription

User should not be able to activate email channel subscription with expired url token
    [Documentation]  Test case
    [Tags]  Subscription
    FrontApp.Login as User
    FrontApp.Send Activation Email
    Common.Wait 1h
    EmailApp.Activate Channel Subscription with Correct Url Token
    FrontApp.Verify Email Channel is not Activated due to Timeout
    FrontApp.Verify Email Field is Available for Input
    EmailApp.Delete Url Token Message
