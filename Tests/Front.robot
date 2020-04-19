*** Settings ***
Documentation    Test suite
# TODO use pipe separated syntax
# TODO take shots with ScreenCapLibrary with reduced size
Library          SeleniumLibrary
Resource         ../Resources/FrontApp.robot
Resource         ../Resources/EmailApp.robot
Resource         ../Resources/Common.robot
Suite Setup      SeleniumLibrary.Set Screenshot Directory    EMBED
Test Setup       Common.Begin Web Test
Test Teardown    Common.End Web Test

*** Variables ***
${BROWSER} =           chrome
${URL} =               https://dev.dozorro.work
${LOGIN_PROVIDER} =    google

*** Test Cases ***

User should not be able to navigate to close initial survey popup twice
    [Documentation]     Test case
    [Tags]              Dummy
    Home.Navigate to

User should be able to activate and deactivate email channel subscription with correct url token
    [Documentation]                                                  Test case
    [Tags]                                                           Subscription
    FrontApp.Log in
    FrontApp.Send Activation Email
    EmailApp.Activate Channel Subscription with Correct Url Token
    FrontApp.Verify Email Channel is Activated
    FrontApp.Deactivate Email Channel Subscription
    FrontApp.Restore Email Channel Subscription
    FrontApp.Remove Email Channel Subscription
    FrontApp.Verify Email Field is Available for Input

User should not be able to activate email channel subscription with incorrect url token
    [Documentation]                                                           Test case
    [Tags]                                                                    Subscription
    FrontApp.Log in
    FrontApp.Send Activation Email
    EmailApp.Try to Activate Channel Subscription with Incorrect Url Token
    FrontApp.Verify Email Channel is not Activated
    Email.Nativage to Correct Url Token
    FrontApp.Verify Email Channel is Activated
    Email.Delete Url Token Message
    Email.Logout
    FrontApp.Remove Email Channel Subscription
    FrontApp.Verify Email Field is Available for Input

User should not be able to activate email channel subscription with expired url token
    [Documentation]                                                  Test case
    [Tags]                                                           Subscription
    FrontApp.Log in
    FrontApp.Send Activation Email
    Common.Wait 1h
    EmailApp.Activate Channel Subscription with Correct Url Token
    FrontApp.Verify Email Channel is not Activated due to Timeout
    FrontApp.Repeat Email Channel Activation
    EmailApp.Activate Channel Subscription with Correct Url Token
    FrontApp.Verify Email Channel is Activated
    FrontApp.Remove Email Channel Subscription
    FrontApp.Verify Email Field is Available for Input
