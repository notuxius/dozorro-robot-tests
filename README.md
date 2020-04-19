# dozorro-robot-tests

Launch tests with:
robot --listener .\Resources\EmailListener.py -v SEND_TO_EMAIL:send_to_email -v USER_LOGIN:user_login -v USER_PASS:user_password -d .\Results\ .\Tests\Front_End.robot

Add '-v LOGIN_PROVIDER:facebook' if you want to launch tests with Facebook login, Google login is used by default

Dependency libraries:
robotframework-imaplibrary
robotframework-seleniumlibrary

Link to modified init file in order for imaplibrary to work properly with tests:
https://gist.github.com/notuxius/19be04cd27d7249ea4612448b9ae9563