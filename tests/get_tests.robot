*** Settings ***
Library    ../libraries/CommonKeywords.py
Library    ../libraries/APIKeywords.py


*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Retrieve All Posts
    ${session}=    Create API Session
    ${response}=    Retrieve All Posts    ${session}
    Check Status Code    ${response}    200
    Check Response Not Empty    ${response}

Retrieve Post By Valid ID
    ${session}=    Create API Session
    ${response}=    Retrieve Post By ID    ${session}    1
    Check Status Code    ${response}    200

Retrieve Invalid Post
    ${session}=    Create API Session
    ${response}=    Retrieve Invalid Post    ${session}    9999
    Check Status Code    ${response}    404

Retrieve Comments For Specific Post
    ${session}=    Create API Session
    ${response}=    Retrieve Comments For Post    ${session}    1
    Check Status Code    ${response}    200
    Check Response Not Empty    ${response}

Retrieve User By Valid ID
    ${session}=    Create API Session
    ${response}=   Retrieve User By ID    ${session}    1
    Check Status Code    ${response}    200