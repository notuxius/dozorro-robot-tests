*** Settings ***
Resource  ./PO/Home.robot
Resource  ./PO/TopNav.robot
Resource  ./PO/UserSettings.robot
Resource  ./PO/UserNotify.robot

*** Variables ***


*** Keywords ***
Login as User
    Home.Navigate to
    Home.Verify Page Loaded
    Home.Close Initial Survey Popup
    TopNav.Click Login Button
    Home.Click Facebook Login Popup Button
    # Home.Click Google Login Popup Button
    Home.Input Facebook Login Popup User Email
    Home.Input Facebook Login Popup User Password
    Home.Verify User Logged In

Send Activation Email
    TopNav.Click User Nofications Link
    UserSettings.Verify Page Loaded
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
    UserNotify.Check Success Message

Verify Email Channel is not Activated
    UserNotify.Check Unsuccess Message

Verify Email Channel is not Activated due to Timeout
    UserNotify.Check Unsuccess Message Timeout

Verify Email Field is Available for Input
    UserSettings.Navigate to
    UserSettings.Check Email Field is Enabled for Input