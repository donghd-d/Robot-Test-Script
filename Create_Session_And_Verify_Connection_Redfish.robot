*** Settings ***
Documentation    Generated Redfish tests for Account-Service.
Resource    /home/bmc/openbmc-test-automation/lib/resource.robot
Resource    /home/bmc/openbmc-test-automation/lib/bmc_redfish_resource.robot
Suite Setup    Redfish.Login    auth=basic
Suite Teardown    Redfish.Logout
Test Tags    Account-Service    Redfish

*** Test Cases ***
Create Session
    [Documentation]    Create one Redfish session while Suite Setup uses Basic Auth.
    [Tags]    Account-Service-32    RW
    ${payload}=    Create Dictionary    UserName=${OPENBMC_USERNAME}    Password=${OPENBMC_PASSWORD}
    ${response}=    Redfish.Post    /redfish/v1/SessionService/Sessions    body=&{payload}    valid_status_codes=[201]
    ${created_session_uri}=    Set Variable    ${response.session_location}
    Set Suite Variable    ${created_session_uri}

Verify Created Session Connection
    [Documentation]    Verify the captured Session resource through Redfish.
    [Tags]    Account-Service-33    RO
    ${response}=    Redfish.Get    ${created_session_uri}    valid_status_codes=[200]
    Should Be Equal    ${response.dict}[UserName]    ${OPENBMC_USERNAME}
    Dictionary Should Contain Key    ${response.dict}    Id
    Dictionary Should Contain Key    ${response.dict}    Name

Delete Created Session
    [Documentation]    Delete only the Session created by this suite.
    [Tags]    Account-Service-34    RW
    ${response}=    Redfish.Delete    ${created_session_uri}    valid_status_codes=[204]
