*** Settings ***
Resource  ./PO/Email.robot

*** Variables ***


*** Keywords ***
Activate Channel Subscription with Correct Url Token
    Email.Login
    Email.Search for Url Token Message
    Email.Extract Url Token from Message
    Email.Nativage to Correct Url Token
    Email.Delete Url Token Message
    Email.Logout
    
Try to Activate Channel Subscription with Incorrect Url Token
    Email.Login
    Email.Search for Url Token Message
    Email.Extract Url Token from Message
    Email.Nativage to Incorrect Url Token
    Email.Logout
