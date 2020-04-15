*** Settings ***


*** Variables ***
${USER_NOTIFY_SUCCESS_CHANNEL_ACTIVATION_MESSAGE} =  Канал активовано успішно
${USER_NOTIFY_UNSUCCESS_CHANNEL_ACTIVATION_MESSAGE} =  Помилка коду активації
${USER_NOTIFY_UNSUCCESS_CHANNEL_ACTIVATION_TIMEOUT_MESSAGE} =  Час очікування вичерпався

*** Keywords ***
Check Success Message
    wait until page contains  ${USER_NOTIFY_SUCCESS_CHANNEL_ACTIVATION_MESSAGE}

Check Unsuccess Message
    wait until page contains  ${USER_NOTIFY_UNSUCCESS_CHANNEL_ACTIVATION_MESSAGE}

Check Unsuccess Message Timeout
    wait until page contains  ${USER_NOTIFY_UNSUCCESS_CHANNEL_ACTIVATION_TIMEOUT_MESSAGE}
