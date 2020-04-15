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
    Home.Click Login Popup Facebook Button
    # Home.Click Login Popup Google Button
    Home.Input Login Popup User Email
    Home.Input Login Popup User Password
    Home.Verify User Logged In

Send Activation Email
    TopNav.Click User Nofications Link
    UserSettings.Verify Page Loaded
    UserSettings.Click Settings Tab
    UserSettings.Enter Channel Subscription Email
    UserSettings.Click Activate Email Channel Subscription Button

Verify Email Channel Activation
    UserNotify.Check Success Message

Verify Email Channel is not Activated
    UserNotify.Check Unsuccess Message

Verify Email Channel is not Activated due to Timeout
    UserNotify.Check Unsuccess Message Timeout

Deactivate Email Channel Subscription
    UserSettings.Navigate to
    UserSettings.Click Deactivate Email Channel Subscription Button
    UserSettings.Click Deactivate Email Channel Subscription Confirmation Yes Button