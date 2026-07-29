*** Settings ***
Documentation    Generated Redfish tests for Network.
Resource    /home/bmc/openbmc-test-automation/lib/resource.robot
Library    /home/bmc/openbmc-test-automation/lib/bmc_redfish.py    https://${OPENBMC_HOST}:${HTTPS_PORT}    ${OPENBMC_USERNAME}    ${OPENBMC_PASSWORD}    AS    Redfish
Suite Setup    Redfish.Login    auth=basic
Suite Teardown    Redfish.Logout
Test Tags    Network    Redfish

*** Test Cases ***
Verify EthernetInterfaces Collection Non-Empty
    [Documentation]    Verify EthernetInterfaces Collection Non-Empty through Redfish.
    [Tags]    Network-01    RO
    ${response}=    Redfish.Get    /redfish/v1/Managers/1/EthernetInterfaces    valid_status_codes=[200]
    Should Be True    len(${response.dict}[Members]) > 0
    Dictionary Should Contain Key    ${response.dict}    @odata.id

Verify Eth0 Status Enabled
    [Documentation]    Verify Eth0 Status Enabled through Redfish.
    [Tags]    Network-02    RO
    ${response}=    Redfish.Get    /redfish/v1/Managers/1/EthernetInterfaces/eth0    valid_status_codes=[200]
    Should Be Equal    ${response.dict}[Status][State]    Enabled
    Dictionary Should Contain Key    ${response.dict}    Id

Verify Eth1 Status Enabled
    [Documentation]    Verify Eth1 Status Enabled through Redfish.
    [Tags]    Network-03    RO
    ${response}=    Redfish.Get    /redfish/v1/Managers/1/EthernetInterfaces/eth1    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}[Status]    State
    Dictionary Should Contain Key    ${response.dict}    Id
