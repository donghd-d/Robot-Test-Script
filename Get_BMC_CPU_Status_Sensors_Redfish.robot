*** Settings ***
Documentation    Generated Redfish tests for Sensor.
Resource    /home/bmc/openbmc-test-automation/lib/resource.robot
Library    /home/bmc/openbmc-test-automation/lib/bmc_redfish.py    https://${OPENBMC_HOST}:${HTTPS_PORT}    ${OPENBMC_USERNAME}    ${OPENBMC_PASSWORD}    AS    Redfish
Suite Setup    Redfish.Login    auth=basic
Suite Teardown    Redfish.Logout
Test Tags    Sensor    Redfish

*** Test Cases ***
Get Cpu Status 00 Sensor
    [Documentation]    Get Cpu Status 00 Sensor through Redfish.
    [Tags]    Sensor-13    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/CPU_STATUS_00    valid_status_codes=[200]
    Should Be Equal    ${response.dict}[Status][State]    Enabled
    Should Be Equal    ${response.dict}[Status][Health]    OK
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    Id

Get Cpu Status 01 Sensor
    [Documentation]    Get Cpu Status 01 Sensor through Redfish.
    [Tags]    Sensor-14    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/CPU_STATUS_01    valid_status_codes=[200]
    Should Be Equal    ${response.dict}[Status][State]    Enabled
    Should Be Equal    ${response.dict}[Status][Health]    OK
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    Id

Get Cpu Temp 00 Sensor
    [Documentation]    Get Cpu Temp 00 Sensor through Redfish.
    [Tags]    Sensor-15    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/CPU_TEMP_00    valid_status_codes=[200]
    Should Be Equal    ${response.dict}[Status][State]    Enabled
    Should Be Equal    ${response.dict}[Status][Health]    OK
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    Id

Get Cpu Temp 01 Sensor
    [Documentation]    Get Cpu Temp 01 Sensor through Redfish.
    [Tags]    Sensor-16    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/CPU_TEMP_01    valid_status_codes=[200]
    Should Be Equal    ${response.dict}[Status][State]    Enabled
    Should Be Equal    ${response.dict}[Status][Health]    OK
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    Id

Get Cpu Power Sensor
    [Documentation]    Get Cpu Power Sensor through Redfish.
    [Tags]    Sensor-17    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/CPU_POWER    valid_status_codes=[200]
    Should Be Equal    ${response.dict}[Status][State]    Enabled
    Should Be Equal    ${response.dict}[Status][Health]    OK
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    Id

Get Cpu0 Dimm Temp Sensor
    [Documentation]    Get Cpu0 Dimm Temp Sensor through Redfish.
    [Tags]    Sensor-18    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/CPU0_DIMM_TEMP    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}[Status]    State
    Dictionary Should Contain Key    ${response.dict}[Status]    Health
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    Id

Get Cpu1 Dimm Temp Sensor
    [Documentation]    Get Cpu1 Dimm Temp Sensor through Redfish.
    [Tags]    Sensor-19    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/CPU1_DIMM_TEMP    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}[Status]    State
    Dictionary Should Contain Key    ${response.dict}[Status]    Health
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    Id

Get Cpu0 Vr Temp Sensor
    [Documentation]    Get Cpu0 Vr Temp Sensor through Redfish.
    [Tags]    Sensor-20    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/CPU0_VR_TEMP    valid_status_codes=[200]
    Should Be Equal    ${response.dict}[Status][State]    Enabled
    Should Be Equal    ${response.dict}[Status][Health]    OK
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    Id

Get Cpu1 Vr Temp Sensor
    [Documentation]    Get Cpu1 Vr Temp Sensor through Redfish.
    [Tags]    Sensor-21    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/CPU1_VR_TEMP    valid_status_codes=[200]
    Should Be Equal    ${response.dict}[Status][State]    Enabled
    Should Be Equal    ${response.dict}[Status][Health]    OK
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    Id

Get P0 Vddcr Cpu0 Sensor
    [Documentation]    Get P0 Vddcr Cpu0 Sensor through Redfish.
    [Tags]    Sensor-22    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/P0_VDDCR_CPU0    valid_status_codes=[200]
    Should Be Equal    ${response.dict}[Status][State]    Enabled
    Should Be Equal    ${response.dict}[Status][Health]    OK
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    Id
