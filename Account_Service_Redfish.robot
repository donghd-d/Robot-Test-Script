*** Settings ***
Documentation    Generated Redfish tests for Account-Service.
Resource    /home/bmc/openbmc-test-automation/lib/resource.robot
Resource    /home/bmc/openbmc-test-automation/lib/bmc_redfish_resource.robot
Test Tags    Account-Service    Redfish

*** Test Cases ***
Create Redfish User Account And Verify Login
    [Documentation]    Create Redfish User Account And Verify Login through Redfish.
    [Tags]    Account-Service-10    RW
    ${response}=    Redfish.Post    /redfish/v1/AccountService/Accounts    body={"UserName": "redfish_verify_user", "Password": "${OPENBMC_PASSWORD}", "RoleId": "priv-user", "Enabled": true, "PasswordChangeRequired": false}    valid_status_codes=[201]
    Dictionary Should Contain Key    ${response.dict}    @odata.id
    Dictionary Should Contain Key    ${response.dict}    UserName
    Dictionary Should Contain Key    ${response.dict}    RoleId
    Dictionary Should Contain Key    ${response.dict}    Enabled

Create Redfish User Account And Verify In Collection
    [Documentation]    Create Redfish User Account And Verify In Collection through Redfish.
    [Tags]    Account-Service-11    RW
    ${response}=    Redfish.Post    /redfish/v1/AccountService/Accounts    body={"UserName": "testuser01", "Password": "${OPENBMC_PASSWORD}", "RoleId": "priv-user", "Enabled": true}    valid_status_codes=[201]
    Dictionary Should Contain Key    ${response.dict}    @odata.id

Verify Individual Manager Account Status
    [Documentation]    Verify Individual Manager Account Status through Redfish.
    [Tags]    Account-Service-12    RO
    ${response}=    Redfish.Get    /redfish/v1/AccountService/Accounts/{id}    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    @odata.id
    Dictionary Should Contain Key    ${response.dict}    @odata.type
    Dictionary Should Contain Key    ${response.dict}    Id
    Dictionary Should Contain Key    ${response.dict}    Name
    Dictionary Should Contain Key    ${response.dict}    UserName
    Dictionary Should Contain Key    ${response.dict}    Enabled
    Dictionary Should Contain Key    ${response.dict}    Locked
    Dictionary Should Contain Key    ${response.dict}    RoleId
    Dictionary Should Contain Key    ${response.dict}    AccountTypes
    Dictionary Should Contain Key    ${response.dict}    PasswordChangeRequired

Verify Account Login Status
    [Documentation]    Verify Account Login Status through Redfish.
    [Tags]    Account-Service-13    RO
    ${response}=    Redfish.Get    /redfish/v1/AccountService/Accounts    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    @odata.id
    Dictionary Should Contain Key    ${response.dict}    @odata.type
    Dictionary Should Contain Key    ${response.dict}    Description
    Dictionary Should Contain Key    ${response.dict}    Members
    Dictionary Should Contain Key    ${response.dict}    Members@odata.count
    Dictionary Should Contain Key    ${response.dict}    Name
