*** Settings ***
Library    ../libraries/CommonKeywords.py
Library    ../libraries/APIKeywords.py


*** Test Cases ***
Update Existing Post
    ${session}=    Create API Session
    ${response}=    Update Post    ${session}    1    Updated Title    Updated body content
    Check Status Code    ${response}    200
    Check Post Contains    ${response}    Updated Title    Updated body content

Attempt to Update Non-Existing Post
    ${session}=    Create API Session
    ${response}=    Update Post    ${session}    9999    Updated Title    Updated body content
    Check Status Code    ${response}    404