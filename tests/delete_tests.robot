*** Settings ***
Library    ../libraries/CommonKeywords.py
Library    ../libraries/APIKeywords.py

*** Test Cases ***
Delete Existing Post
    ${session}=    Create API Session
    ${response}=    Delete Post    ${session}    1
    Check Status Code    ${response}    200

Attempt to Delete Non-Existing Post
    ${session}=    Create API Session
    ${response}=    Delete Post    ${session}    9999
    Check Status Code    ${response}    200
