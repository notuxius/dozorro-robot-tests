*** Settings ***
Documentation    Test suite
Resource         ../Resources/FrontApp.robot
Resource         ../Resources/EmailApp.robot
Resource         ../Resources/Common.robot
Suite Setup      Set Screenshot Directory       EMBED
Test Setup       Common.Begin Web Test
Test Teardown    Common.End Web Test

*** Variables ***
${BROWSER} =           chrome
${URL} =               https://dev.dozorro.work
${LOGIN_PROVIDER} =    google

*** Test Cases ***
User should not be able to click settings tab on homepage
    [Documentation]                    Test case
    [Tags]                             Dummy
    Home.Navigate to
    UserSettings.Click Settings Tab

User should not be able to navigate to close initial survey popup twice
    [Documentation]                    Test case
    [Tags]                             Dummy
    Home.Navigate to
    Home.Close Initial Survey Popup
    Home.Navigate to
    Home.Close Initial Survey Popup

User should be able to activate and deactivate email channel subscription with correct url token
    [Documentation]                                                  Test case
    [Tags]                                                           Subscription
    Run Keyword If                                                   '${LOGIN_PROVIDER}'=='facebook'    FrontApp.Log in with Facebook
    ...                                                              ELSE                               FrontApp.Log in with Google
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
    FrontApp.Log in with Facebook
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
    FrontApp.Log in with Facebook
    FrontApp.Send Activation Email
    Common.Wait 1h
    EmailApp.Activate Channel Subscription with Correct Url Token
    FrontApp.Verify Email Channel is not Activated due to Timeout
    FrontApp.Repeat Email Channel Activation
    EmailApp.Activate Channel Subscription with Correct Url Token
    FrontApp.Verify Email Channel is Activated
    FrontApp.Remove Email Channel Subscription
    FrontApp.Verify Email Field is Available for Input
