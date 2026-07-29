*** Settings ***
Documentation    Generated Redfish tests for Account-Service.
Resource    /home/bmc/openbmc-test-automation/lib/resource.robot
Library    /home/bmc/openbmc-test-automation/lib/bmc_redfish.py    https://${OPENBMC_HOST}:${HTTPS_PORT}    ${OPENBMC_USERNAME}    ${OPENBMC_PASSWORD}    AS    Redfish
Suite Setup    Redfish.Login    auth=basic
Suite Teardown    Redfish.Logout
Test Tags    Account-Service    Redfish

*** Test Cases ***
Get Roles Collection And Verify NonEmpty
    [Documentation]    Get Roles Collection And Verify NonEmpty through Redfish.
    [Tags]    Account-Service-44    RO
    ${response}=    Redfish.Get    /redfish/v1/AccountService/Roles    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    Members
    Dictionary Should Contain Key    ${response.dict}    Members@odata.count
    Dictionary Should Contain Key    ${response.dict}    @odata.id

Verify PrivAdmin AssignedPrivileges Mapping
    [Documentation]    Verify PrivAdmin AssignedPrivileges Mapping through Redfish.
    [Tags]    Account-Service-45    RO
    ${response}=    Redfish.Get    /redfish/v1/AccountService/Roles/priv-admin    valid_status_codes=[200]
    Should Be Equal    ${response.dict}[Id]    priv-admin
    Dictionary Should Contain Key    ${response.dict}    AssignedPrivileges

Verify PrivOperator AssignedPrivileges Mapping
    [Documentation]    Verify PrivOperator AssignedPrivileges Mapping through Redfish.
    [Tags]    Account-Service-46    RO
    ${response}=    Redfish.Get    /redfish/v1/AccountService/Roles/priv-operator    valid_status_codes=[200]
    Should Be Equal    ${response.dict}[Id]    priv-operator
    Dictionary Should Contain Key    ${response.dict}    AssignedPrivileges

Verify PrivUser AssignedPrivileges Mapping
    [Documentation]    Verify PrivUser AssignedPrivileges Mapping through Redfish.
    [Tags]    Account-Service-47    RO
    ${response}=    Redfish.Get    /redfish/v1/AccountService/Roles/priv-user    valid_status_codes=[200]
    Should Be Equal    ${response.dict}[Id]    priv-user
    Dictionary Should Contain Key    ${response.dict}    AssignedPrivileges

Verify PrivNoAccess AssignedPrivileges Mapping
    [Documentation]    Verify PrivNoAccess AssignedPrivileges Mapping through Redfish.
    [Tags]    Account-Service-48    RO
    ${response}=    Redfish.Get    /redfish/v1/AccountService/Roles/priv-noaccess    valid_status_codes=[200]
    Should Be Equal    ${response.dict}[Id]    priv-noaccess
    Dictionary Should Contain Key    ${response.dict}    AssignedPrivileges
