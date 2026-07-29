*** Settings ***
Documentation    Generated Redfish tests for Account-Service.
Resource    /home/bmc/openbmc-test-automation/lib/resource.robot
Library    /home/bmc/openbmc-test-automation/lib/redfish/bmc_redfish.py    https://${OPENBMC_HOST}:${HTTPS_PORT}    ${OPENBMC_USERNAME}    ${OPENBMC_PASSWORD}    AS    Redfish
Suite Setup    Redfish.Login    auth=basic
Suite Teardown    Redfish.Logout
Test Tags    Account-Service    Redfish

*** Test Cases ***
Verify Account Service
    [Documentation]    Verify Account Service through Redfish.
    [Tags]    Account-Service-49    RO
    ${response}=    Redfish.Get    /redfish/v1/AccountService    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    ServiceEnabled
    Dictionary Should Contain Key    ${response.dict}    Id

Verify Accounts Collection
    [Documentation]    Verify Accounts Collection through Redfish.
    [Tags]    Account-Service-50    RO
    ${response}=    Redfish.Get    /redfish/v1/AccountService/Accounts    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    Members
    Dictionary Should Contain Key    ${response.dict}    @odata.id

Verify Roles Collection
    [Documentation]    Verify Roles Collection through Redfish.
    [Tags]    Account-Service-51    RO
    ${response}=    Redfish.Get    /redfish/v1/AccountService/Roles    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    Members
    Dictionary Should Contain Key    ${response.dict}    @odata.id

Verify PrivUser Role Permissions
    [Documentation]    Verify PrivUser Role Permissions through Redfish.
    [Tags]    Account-Service-52    RO
    ${response}=    Redfish.Get    /redfish/v1/AccountService/Roles/priv-user    valid_status_codes=[200]
    Should Be Equal    ${response.dict}[RoleId]    priv-user
    Dictionary Should Contain Key    ${response.dict}    AssignedPrivileges
    Dictionary Should Contain Key    ${response.dict}    Id

Create Random Temporary Account
    [Documentation]    Create Random Temporary Account through Redfish.
    [Tags]    Account-Service-53    RW
    ${created_account_uri_username_suffix}=    Generate Random String    8    [LOWER][NUMBERS]
    ${created_account_uri_username}=    Set Variable    robotlif${created_account_uri_username_suffix}
    Set Suite Variable    ${created_account_uri_username}
    ${created_account_password}=    Evaluate    ''.join(random.sample('ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz23456789', 16)) + 'Aa1!'    modules=random
    Set Suite Variable    ${created_account_password}
    ${payload}=    Create Dictionary    UserName=${created_account_uri_username}    Password=${created_account_password}    RoleId=priv-user    Enabled=${True}
    ${response}=    Redfish.Post    /redfish/v1/AccountService/Accounts    body=&{payload}    valid_status_codes=[201]
    ${created_account_uri}=    Set Variable    ${response.session_location}
    Set Suite Variable    ${created_account_uri}

Verify Created Temporary Account
    [Documentation]    Verify Created Temporary Account through Redfish.
    [Tags]    Account-Service-54    RO
    ${response}=    Redfish.Get    ${created_account_uri}    valid_status_codes=[200]
    ${created_account_etag}=    Set Variable    ${response.getheader("ETag")}
    Set Suite Variable    ${created_account_etag}
    Should Be Equal    ${response.dict}[UserName]    ${created_account_uri_username}
    Should Be Equal    ${response.dict}[RoleId]    priv-user
    Should Be Equal    ${response.dict}[Enabled]    ${True}
    Dictionary Should Contain Key    ${response.dict}    Id

Update Temporary Account Role
    [Documentation]    Update Temporary Account Role through Redfish.
    [Tags]    Account-Service-55    RW
    ${payload}=    Create Dictionary    RoleId=priv-operator
    ${headers}=    Create Dictionary    If-Match=${created_account_etag}
    ${response}=    Redfish.Patch    ${created_account_uri}    body=&{payload}    headers=&{headers}    valid_status_codes=[200, 204]

Verify Updated Temporary Account
    [Documentation]    Verify Updated Temporary Account through Redfish.
    [Tags]    Account-Service-56    RO
    ${response}=    Redfish.Get    ${created_account_uri}    valid_status_codes=[200]
    ${created_account_etag}=    Set Variable    ${response.getheader("ETag")}
    Set Suite Variable    ${created_account_etag}
    Should Be Equal    ${response.dict}[UserName]    ${created_account_uri_username}
    Should Be Equal    ${response.dict}[RoleId]    priv-operator
    Should Be Equal    ${response.dict}[Enabled]    ${True}
    Dictionary Should Contain Key    ${response.dict}    Id

Delete Temporary Account
    [Documentation]    Delete Temporary Account through Redfish.
    [Tags]    Account-Service-57    RW
    ${headers}=    Create Dictionary    If-Match=${created_account_etag}
    ${response}=    Redfish.Delete    ${created_account_uri}    headers=&{headers}    valid_status_codes=[200, 204]
