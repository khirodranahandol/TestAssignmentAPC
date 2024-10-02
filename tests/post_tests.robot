*** Settings ***
Library    ../libraries/CommonKeywords.py
Library    ../libraries/APIKeywords.py


*** Test Cases ***
Create New Post Successfully
    ${session}=    Create API Session
    ${response}=    Create Post    ${session}    New Post    This is a new post    1
    Check Status Code    ${response}    201
    Check Post Contains    ${response}    New Post    This is a new post

Create Post Without Required Fields
    ${session}=    Create API Session
    ${response}=   Create Post    ${session}    ""    ""    1
    Check Status Code    ${response}    201
