*** Settings ***
Documentation    Test suite
Library          SeleniumLibrary
Resource         ../Resources/FrontEndApp.robot
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
Often changing test that is used for testing the app itself
    [Documentation]                    Test case
    [Tags]                             Dum
    Home.Navigate to
    UserSettings.Click Settings Tab

User should be able to activate and deactivate email channel subscription with correct url token
    [Documentation]                                                               Test case
    [Tags]                                                                        Sub
    FrontEndApp.Log in
    FrontEndApp.Send Activation Email
    EmailApp.Activate Channel Subscription with Correct Url Token
    FrontEndApp.Verify Email Channel is Activated
    FrontEndApp.Deactivate Email Channel Subscription
    FrontEndApp.Restore Email Channel Subscription
    FrontEndApp.Remove Email Channel Subscription
    FrontEndApp.Verify Email Channel Subscription Field is Available for Input

User should not be able to activate email channel subscription with incorrect url token
    [Documentation]                                                               Test case
    [Tags]                                                                        Sub
    FrontEndApp.Log in
    FrontEndApp.Send Activation Email
    EmailApp.Try to Activate Channel Subscription with Incorrect Url Token
    FrontEndApp.Verify Email Channel is not Activated
    Email.Nativage to Correct Url Token
    FrontEndApp.Verify Email Channel is Activated
    Email.Delete Url Token Message
    Email.Logout
    FrontEndApp.Remove Email Channel Subscription
    FrontEndApp.Verify Email Channel Subscription Field is Available for Input

User should not be able to activate email channel subscription with expired url token
    [Documentation]                                                               Test case
    [Tags]                                                                        Wait
    FrontEndApp.Log in
    FrontEndApp.Send Activation Email
    Common.Wait 1h
    EmailApp.Activate Channel Subscription with Correct Url Token
    FrontEndApp.Verify Email Channel is not Activated due to Timeout
    FrontEndApp.Repeat Email Channel Activation
    EmailApp.Activate Channel Subscription with Correct Url Token
    FrontEndApp.Verify Email Channel is Activated
    FrontEndApp.Remove Email Channel Subscription
    FrontEndApp.Verify Email Channel Subscription Field is Available for Input
