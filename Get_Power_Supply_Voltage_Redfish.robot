*** Settings ***
Documentation    Generated Redfish tests for Power-Control.
Resource    /home/bmc/openbmc-test-automation/lib/resource.robot
Resource    /home/bmc/openbmc-test-automation/lib/bmc_redfish_resource.robot
Suite Setup    Redfish.Login
Suite Teardown    Redfish.Logout
Test Tags    Power-Control    Redfish

*** Test Cases ***
Get Chassis Power And Verify Voltage Collections
    [Documentation]    Get Chassis Power And Verify Voltage Collections through Redfish.
    [Tags]    Power-Control-06    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Power    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    @odata.id
    Dictionary Should Contain Key    ${response.dict}    Id
    Dictionary Should Contain Key    ${response.dict}    Name
    Dictionary Should Contain Key    ${response.dict}    Voltages
    Dictionary Should Contain Key    ${response.dict}    PowerSupplies

Verify Voltage And PowerSupply Collections Non Empty
    [Documentation]    Verify Voltage And PowerSupply Collections Non Empty through Redfish.
    [Tags]    Power-Control-07    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Power    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    Voltages
    Dictionary Should Contain Key    ${response.dict}    PowerSupplies
    Dictionary Should Contain Key    ${response.dict}    Id

Verify Power Resource Status Enabled
    [Documentation]    Verify Power Resource Status Enabled through Redfish.
    [Tags]    Power-Control-08    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Power    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    Id
