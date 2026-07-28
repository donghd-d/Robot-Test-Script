*** Settings ***
Documentation    Generated Redfish tests for Account-Service.
Resource    /home/bmc/openbmc-test-automation/lib/resource.robot
Resource    /home/bmc/openbmc-test-automation/lib/bmc_redfish_resource.robot
Test Tags    Account-Service    Redfish

*** Test Cases ***
Get Account Collection
    [Documentation]    Get Account Collection through Redfish.
    [Tags]    Account-Service-17    RO
    ${response}=    Redfish.Get    /redfish/v1/AccountService/Accounts    valid_status_codes=[200]
    Should Be True    len(${response.dict}["Members"]) > 0
    Should Contain    ${response.dict}["@odata.type"]    AccountCollection
    Dictionary Should Contain Key    ${response.dict}    @odata.id

Create User With PrivUser Role
    [Documentation]    Create User With PrivUser Role through Redfish.
    [Tags]    Account-Service-18    RW
    ${payload}=    Create Dictionary    UserName=testuser    Password=${OPENBMC_PASSWORD}    RoleId=priv-user    Enabled=${True}
    ${response}=    Redfish.Post    /redfish/v1/AccountService/Accounts    body=&{payload}    valid_status_codes=[201]
    ${created_account_uri}=    Set Variable    ${response.headers['Location']}
    Set Suite Variable    ${created_account_uri}

Verify Created User Detail By GET
    [Documentation]    Verify Created User Detail By GET through Redfish.
    [Tags]    Account-Service-19    RO
    ${response}=    Redfish.Get    ${created_account_uri}    valid_status_codes=[200]
    Should Be Equal    ${response.dict}["UserName"]    testuser
    Should Be Equal    ${response.dict}["RoleId"]    priv-user
    Should Be Equal    ${response.dict}["Enabled"]    ${True}
    Dictionary Should Contain Key    ${response.dict}    Id

Modify User Role Via PATCH
    [Documentation]    Modify User Role Via PATCH through Redfish.
    [Tags]    Account-Service-20    RW
    ${payload}=    Create Dictionary    RoleId=priv-admin
    ${response}=    Redfish.Patch    ${created_account_uri}    body=&{payload}    valid_status_codes=[204]

Verify Modified User Role By GET
    [Documentation]    Verify Modified User Role By GET through Redfish.
    [Tags]    Account-Service-21    RO
    ${response}=    Redfish.Get    ${created_account_uri}    valid_status_codes=[200]
    Should Be Equal    ${response.dict}["RoleId"]    priv-admin
    Dictionary Should Contain Key    ${response.dict}    Id

Delete Created User For Cleanup
    [Documentation]    Delete Created User For Cleanup through Redfish.
    [Tags]    Account-Service-22    RW
    ${response}=    Redfish.Delete    ${created_account_uri}    valid_status_codes=[204]
