# dozorro-robot-tests

Launch tests with:
robot --listener .\Resources\EmailListener.py -v SEND_TO_EMAIL:send_to_email -v USER_LOGIN:user_login -v USER_PASS:user_password -d .\Results\ .\Tests\Front.robot

Add '-v LOGIN_PROVIDER:facebook' if you want to launch test with Facebook login, Google is used by default
