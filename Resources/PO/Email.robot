*** Settings ***
Library    ImapLibrary
Library    Collections
Library    String

*** Variables ***
${EMAIL_HOST} =         imap.gmail.com
${EMAIL_PORT} =         993
${EMAIL_SENDER} =       notify@bot.dozorro.org
${EMAIL_POLL_FREQ} =    2
${EMAIL_TIMEOUT} =      30
# TODO improve URL regex selection
${EMAIL_URL_TOKEN_REGEXP} =                      https://.*
${EMAIL_URL_TOKEN_WITHOUT_LAST_CHAR_REGEXP} =    ^.*?(?=\d$)

*** Keywords ***
# TODO refactor keywords
# TODO refactor into setup keyword
Login
    open mailbox    host=${EMAIL_HOST}    user=${USER_LOGIN}    password=${USER_PASS}    port=${EMAIL_PORT}

# TODO refactor into more atomic keywords
Search for Url Token Message
    # TODO sometimes IMAP search doesn't work
    ${url_token_message} =    wait for email          sender=${EMAIL_SENDER}    poll_frequency=${EMAIL_POLL_FREQ}    timeout=${EMAIL_TIMEOUT}
    [Return]                  ${url_token_message}

Extract Url Token from Message
    ${searched_url_token_message} =    Search for Url Token Message
    @{url_token} =                     get matches from email          ${searched_url_token_message}    ${EMAIL_URL_TOKEN_REGEXP}
    ${first_url_token} =               Get From List                   ${url_token}                     0
    [Return]                           ${first_url_token}

# TODO refactor into Front End keyword
Nativage to Correct Url Token
    ${extracted_url_token} =    Extract Url Token from Message
    go to                       ${extracted_url_token}

# TODO refactor into Front End keyword
Nativage to Incorrect Url Token
    ${extracted_url_token} =    Extract Url Token from Message
    # TODO replace with Remove String Using Regexp
    ${incorrect_url_token} =    Remove String                     ${extracted_url_token}    4    5    6
    go to                       ${incorrect_url_token}

Delete Url Token Message
    ${searched_url_token_message} =    Search for Url Token Message
    delete email                       ${searched_url_token_message}

# TODO refactor into teardown keyword
Logout
    close mailbox
