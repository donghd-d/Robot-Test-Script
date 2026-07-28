*** Settings ***
Documentation    Generated Redfish tests for CPU.
Resource    /home/bmc/openbmc-test-automation/lib/resource.robot
Resource    /home/bmc/openbmc-test-automation/lib/bmc_redfish_resource.robot
Test Tags    CPU    Redfish

*** Test Cases ***
Verify CPU Status Sensor 00 Readable And Well Formed
    [Documentation]    Verify CPU Status Sensor 00 Readable And Well Formed through Redfish.
    [Tags]    CPU-05    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/CPU_STATUS_00    valid_status_codes=[200]
    Should Be Equal    ${response.dict}[Id]    CPU_STATUS_00
    Should Contain    ${response.dict}[@odata.type]    Sensor
    Should Not Be Equal    ${response.dict}[Reading]    ${EMPTY}
    Should Not Be Equal    ${response.dict}[ReadingRangeMin]    ${EMPTY}
    Should Not Be Equal    ${response.dict}[ReadingRangeMax]    ${EMPTY}

Verify CPU Status Sensor 01 Readable And Well Formed
    [Documentation]    Verify CPU Status Sensor 01 Readable And Well Formed through Redfish.
    [Tags]    CPU-06    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/CPU_STATUS_01    valid_status_codes=[200]
    Should Be Equal    ${response.dict}[Id]    CPU_STATUS_01
    Should Contain    ${response.dict}[@odata.type]    Sensor
    Should Not Be Equal    ${response.dict}[Reading]    ${EMPTY}
    Should Not Be Equal    ${response.dict}[ReadingRangeMin]    ${EMPTY}
    Should Not Be Equal    ${response.dict}[ReadingRangeMax]    ${EMPTY}

Verify CPU Status 00 Reading Is Valid Status Value
    [Documentation]    Verify CPU Status 00 Reading Is Valid Status Value through Redfish.
    [Tags]    CPU-07    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/CPU_STATUS_00    valid_status_codes=[200]
    Should Be True    ${response.dict}[Reading] >= 0
    Should Be True    ${response.dict}[Reading] <= 1
    Dictionary Should Contain Key    ${response.dict}    Id

Verify CPU Status 01 Reading Is Valid Status Value
    [Documentation]    Verify CPU Status 01 Reading Is Valid Status Value through Redfish.
    [Tags]    CPU-08    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/CPU_STATUS_01    valid_status_codes=[200]
    Should Be True    ${response.dict}[Reading] >= 0
    Should Be True    ${response.dict}[Reading] <= 1
    Dictionary Should Contain Key    ${response.dict}    Id
