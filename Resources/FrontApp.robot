*** Settings ***
Resource    ./PO/Home.robot
Resource    ./PO/TopNav.robot
Resource    ./PO/UserSettings.robot
Resource    ./PO/UserNotify.robot

*** Variables ***

*** Keywords ***
Log in with Facebook
    Home.Open Login Popup
    Home.Click Facebook Login Popup Button
    Home.Enter Facebook Login Popup User Email
    Home.Enter Facebook Login Popup User Password
    Home.Verify User Logged In

Log in with Google
    Home.Open Login Popup
    Home.Click Google Login Popup Button
    Home.Enter Google Login Popup User Email
    Home.Enter Google Login Popup User Password
    Home.Verify User Logged In

Send Activation Email
    TopNav.Click User Nofications Link
    UserSettings.Click Settings Tab
    UserSettings.Enter Channel Subscription Email
    UserSettings.Click Activate Email Channel Subscription Button

Deactivate Email Channel Subscription
    UserSettings.Navigate to
    UserSettings.Click Deactivate Email Channel Subscription Button
    UserSettings.Click Deactivate Email Channel Subscription Confirmation Yes Button

Restore Email Channel Subscription
    UserSettings.Navigate to
    UserSettings.Click Restore Email Channel Subscription Button
    UserSettings.Click Restore Email Channel Subscription Confirmation Yes Button

Remove Email Channel Subscription
    UserSettings.Navigate to
    UserSettings.Click Remove Email Channel Subscription Button
    UserSettings.Click Remove Email Channel Subscription Confirmation Yes Button

Repeat Email Channel Activation
    UserSettings.Navigate to
    UserSettings.Click Repeat Email Channel Activation Button

Verify Email Channel is Activated
    UserNotify.Verify Success Message

Verify Email Channel is not Activated
    UserNotify.Verify Unsuccess Message

Verify Email Channel is not Activated due to Timeout
    UserNotify.verify Unsuccess Message Timeout

Verify Email Field is Available for Input
    UserSettings.Navigate to
    UserSettings.Verify Email Channel Subscription Input Field is Enabled