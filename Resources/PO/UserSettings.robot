*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${USER_SETTINGS_URL} =  ${URL}/user/settings
${USER_SETTINGS_WRAPPER} =  id=app
${USER_SETTINGS_TAB}  css=li a[href$='/user/settings']
${USER_SETTINGS_EMAIL_CHANNEL_SUBS_INPUT}  css=.settings-info input
${USER_SETTINGS_ACTIVATE_EMAIL_CHANNEL_SUBS_BUTTON}  xpath=//span[contains(text(), 'Активувати')]
${USER_SETTINGS_ACTIVATE_EMAIL_CHANNEL_NOTIFICATION_TEXT}  xpath=//span[contains(text(), 'Перевірте пошту')]
${USER_SETTINGS_DEACTIVATE_EMAIL_CHANNEL_SUBS_BUTTON}  class=icon-pause
${USER_SETTINGS_DEACTIVATE_EMAIL_CHANNEL_SUBS_CONF_YES_BUTTON}  xpath=//a[contains(text(), 'Ок')]
${USER_SETTINGS_REMOVE_EMAIL_CHANNEL_SUBS_BUTTON}  class=icon-remove
${USER_SETTINGS_REMOVE_EMAIL_CHANNEL_SUBS_CONF_YES_BUTTON}  xpath=//a[contains(text(), 'Так, видалити')]
${USER_SETTINGS_RESTORE_EMAIL_CHANNEL_SUBS_BUTTON}  xpath=//span[contains(text(), 'Відновити')]
${USER_SETTINGS_RESTORE_EMAIL_CHANNEL_SUBS_CONF_YES_BUTTON}  xpath=(//a[contains(text(), 'Ок')])[2]

*** Keywords ***
Navigate to
    go to  ${USER_SETTINGS_URL}

Verify Page Loaded
    wait until page contains element  ${USER_SETTINGS_WRAPPER}

Click Settings Tab
    click element  ${USER_SETTINGS_TAB}

Enter Channel Subscription Email
    clear element text  ${USER_SETTINGS_EMAIL_CHANNEL_SUBS_INPUT}  # TODO check if email is already in the field here before clearing it
    press keys  ${USER_SETTINGS_EMAIL_CHANNEL_SUBS_INPUT}  ${USER_LOGIN_AND_FB_EMAIL}

Click Activate Email Channel Subscription Button
    click element  ${USER_SETTINGS_ACTIVATE_EMAIL_CHANNEL_SUBS_BUTTON}
    wait until page contains element  ${USER_SETTINGS_ACTIVATE_EMAIL_CHANNEL_NOTIFICATION_TEXT}

Click Deactivate Email Channel Subscription Button
    wait until page contains element  ${USER_SETTINGS_DEACTIVATE_EMAIL_CHANNEL_SUBS_BUTTON}
    click element  ${USER_SETTINGS_DEACTIVATE_EMAIL_CHANNEL_SUBS_BUTTON}

Click Deactivate Email Channel Subscription Confirmation Yes Button
    wait until page contains element  ${USER_SETTINGS_DEACTIVATE_EMAIL_CHANNEL_SUBS_CONF_YES_BUTTON}
    click element  ${USER_SETTINGS_DEACTIVATE_EMAIL_CHANNEL_SUBS_CONF_YES_BUTTON}
    wait until page contains element  ${USER_SETTINGS_RESTORE_EMAIL_CHANNEL_SUBS_BUTTON}

Click Restore Email Channel Subscription Button
    wait until page contains element  ${USER_SETTINGS_RESTORE_EMAIL_CHANNEL_SUBS_BUTTON}
    click element  ${USER_SETTINGS_RESTORE_EMAIL_CHANNEL_SUBS_BUTTON}

Click Restore Email Channel Subscription Confirmation Yes Button
    wait until page contains element  ${USER_SETTINGS_RESTORE_EMAIL_CHANNEL_SUBS_CONF_YES_BUTTON}
    click element  ${USER_SETTINGS_RESTORE_EMAIL_CHANNEL_SUBS_CONF_YES_BUTTON}
    wait until page contains element  ${USER_SETTINGS_DEACTIVATE_EMAIL_CHANNEL_SUBS_BUTTON}

Click Remove Email Channel Subscription Button
    wait until page contains element  ${USER_SETTINGS_REMOVE_EMAIL_CHANNEL_SUBS_BUTTON}
    click element  ${USER_SETTINGS_REMOVE_EMAIL_CHANNEL_SUBS_BUTTON}

Click Remove Email Channel Subscription Confirmation Yes Button
    wait until page contains element  ${USER_SETTINGS_REMOVE_EMAIL_CHANNEL_SUBS_CONF_YES_BUTTON}
    click element  ${USER_SETTINGS_REMOVE_EMAIL_CHANNEL_SUBS_CONF_YES_BUTTON}
    wait until page contains element  ${USER_SETTINGS_EMAIL_CHANNEL_SUBS_INPUT}

Check Email Field is Enabled for Input
    wait until page contains element  ${USER_SETTINGS_EMAIL_CHANNEL_SUBS_INPUT}