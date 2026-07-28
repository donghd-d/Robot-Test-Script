*** Settings ***
Documentation    Generated Redfish tests for Account-Service.
Resource    /home/bmc/openbmc-test-automation/lib/resource.robot
Resource    /home/bmc/openbmc-test-automation/lib/bmc_redfish_resource.robot
Test Tags    Account-Service    Redfish

*** Test Cases ***
Get Account Service Configuration
    [Documentation]    Get Account Service Configuration through Redfish.
    [Tags]    Account-Service-23    RO
    ${response}=    Redfish.Get    /redfish/v1/AccountService    valid_status_codes=[200]
    Should Be Equal    ${response.dict}[ServiceEnabled]    ${True}
    Should Not Be Equal    ${response.dict}[Accounts]    ${EMPTY}
    Should Not Be Equal    ${response.dict}[Roles]    ${EMPTY}
    Should Be True    ${response.dict}[MinPasswordLength] > 0
    Should Be True    ${response.dict}[MaxPasswordLength] > 0
    Should Be True    ${response.dict}[AccountLockoutThreshold] >= 0
    Dictionary Should Contain Key    ${response.dict}    Id

List All BMC Accounts
    [Documentation]    List All BMC Accounts through Redfish.
    [Tags]    Account-Service-24    RO
    ${response}=    Redfish.Get    /redfish/v1/AccountService/Accounts    valid_status_codes=[200]
    Should Be True    len(${response.dict}[Members]) > 0
    Should Be True    ${response.dict}[Members@odata][count] > 0
    Dictionary Should Contain Key    ${response.dict}    @odata.id

List Predefined Roles
    [Documentation]    List Predefined Roles through Redfish.
    [Tags]    Account-Service-25    RO
    ${response}=    Redfish.Get    /redfish/v1/AccountService/Roles    valid_status_codes=[200]
    Should Be True    len(${response.dict}[Members]) > 0
    Dictionary Should Contain Key    ${response.dict}    @odata.id

Verify ReadOnly Role Privileges
    [Documentation]    Verify ReadOnly Role Privileges through Redfish.
    [Tags]    Account-Service-26    RO
    ${response}=    Redfish.Get    /redfish/v1/AccountService/Roles/priv-user    valid_status_codes=[200]
    Should Be Equal    ${response.dict}[IsPredefined]    ${True}
    Should Be Equal    ${response.dict}[RoleId]    priv-user
    Should Be True    len(${response.dict}[AssignedPrivileges]) > 0
    Dictionary Should Contain Key    ${response.dict}    Id

Create User With PrivUser Role
    [Documentation]    Create User With PrivUser Role through Redfish.
    [Tags]    Account-Service-27    RW
    ${payload}=    Create Dictionary    UserName=testflowuser    Password=${OPENBMC_PASSWORD}    RoleId=priv-user    Enabled=${True}
    ${response}=    Redfish.Post    /redfish/v1/AccountService/Accounts    body=&{payload}    valid_status_codes=[201]
    ${created_account_uri}=    Set Variable    ${response.headers['Location']}
    Set Suite Variable    ${created_account_uri}

Verify Created User By GET
    [Documentation]    Verify Created User By GET through Redfish.
    [Tags]    Account-Service-28    RO
    ${response}=    Redfish.Get    ${created_account_uri}    valid_status_codes=[200]
    Should Be Equal    ${response.dict}[UserName]    testflowuser
    Should Be Equal    ${response.dict}[RoleId]    priv-user
    Should Be Equal    ${response.dict}[Enabled]    ${True}
    Dictionary Should Contain Key    ${response.dict}    Id

Modify Created User Role Via PATCH
    [Documentation]    Modify Created User Role Via PATCH through Redfish.
    [Tags]    Account-Service-29    RW
    ${payload}=    Create Dictionary    RoleId=priv-operator
    ${response}=    Redfish.Patch    ${created_account_uri}    body=&{payload}    valid_status_codes=[204]

Verify Modified User Role By GET
    [Documentation]    Verify Modified User Role By GET through Redfish.
    [Tags]    Account-Service-30    RO
    ${response}=    Redfish.Get    ${created_account_uri}    valid_status_codes=[200]
    Should Be Equal    ${response.dict}[RoleId]    priv-operator
    Should Be Equal    ${response.dict}[UserName]    testflowuser
    Dictionary Should Contain Key    ${response.dict}    Id

Delete Created User For Cleanup
    [Documentation]    Delete Created User For Cleanup through Redfish.
    [Tags]    Account-Service-31    RW
    ${response}=    Redfish.Delete    ${created_account_uri}    valid_status_codes=[204]

Negative Delete Predefined Role Rejected
    [Documentation]    Negative Delete Predefined Role Rejected through Redfish.
    [Tags]    Account-Service-32    RW
    ${response}=    Redfish.Delete    /redfish/v1/AccountService/Roles/priv-admin    valid_status_codes=[204]
