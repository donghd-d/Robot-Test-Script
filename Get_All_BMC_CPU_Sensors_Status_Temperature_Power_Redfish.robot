*** Settings ***
Documentation    Generated Redfish tests for Power-Control.
Resource    /home/bmc/openbmc-test-automation/lib/resource.robot
Resource    /home/bmc/openbmc-test-automation/lib/bmc_redfish_resource.robot
Suite Setup    Redfish.Login
Suite Teardown    Redfish.Logout
Test Tags    Power-Control    Redfish

*** Test Cases ***
GetCpuStatus00
    [Documentation]    GetCpuStatus00 through Redfish.
    [Tags]    Power-Control-01    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/CPU_STATUS_00    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    @odata.id
    Dictionary Should Contain Key    ${response.dict}    @odata.type
    Dictionary Should Contain Key    ${response.dict}    Id
    Dictionary Should Contain Key    ${response.dict}    Name
    Dictionary Should Contain Key    ${response.dict}    PhysicalContext
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    ReadingType

GetCpuStatus01
    [Documentation]    GetCpuStatus01 through Redfish.
    [Tags]    Power-Control-02    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/CPU_STATUS_01    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    @odata.id
    Dictionary Should Contain Key    ${response.dict}    @odata.type
    Dictionary Should Contain Key    ${response.dict}    Id
    Dictionary Should Contain Key    ${response.dict}    Name
    Dictionary Should Contain Key    ${response.dict}    PhysicalContext
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    ReadingType

GetCpuTemp00
    [Documentation]    GetCpuTemp00 through Redfish.
    [Tags]    Power-Control-03    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/CPU_TEMP_00    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    @odata.id
    Dictionary Should Contain Key    ${response.dict}    @odata.type
    Dictionary Should Contain Key    ${response.dict}    Id
    Dictionary Should Contain Key    ${response.dict}    Name
    Dictionary Should Contain Key    ${response.dict}    PhysicalContext
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    ReadingUnits
    Dictionary Should Contain Key    ${response.dict}    ReadingType

GetCpuTemp01
    [Documentation]    GetCpuTemp01 through Redfish.
    [Tags]    Power-Control-04    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/CPU_TEMP_01    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    @odata.id
    Dictionary Should Contain Key    ${response.dict}    @odata.type
    Dictionary Should Contain Key    ${response.dict}    Id
    Dictionary Should Contain Key    ${response.dict}    Name
    Dictionary Should Contain Key    ${response.dict}    PhysicalContext
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    ReadingUnits
    Dictionary Should Contain Key    ${response.dict}    ReadingType

GetCpuPower
    [Documentation]    GetCpuPower through Redfish.
    [Tags]    Power-Control-05    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/CPU_POWER    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    @odata.id
    Dictionary Should Contain Key    ${response.dict}    @odata.type
    Dictionary Should Contain Key    ${response.dict}    Id
    Dictionary Should Contain Key    ${response.dict}    Name
    Dictionary Should Contain Key    ${response.dict}    PhysicalContext
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    ReadingUnits
    Dictionary Should Contain Key    ${response.dict}    ReadingType
