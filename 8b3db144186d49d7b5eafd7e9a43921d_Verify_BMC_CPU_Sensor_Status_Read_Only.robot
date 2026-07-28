*** Settings ***
Documentation    Generated Redfish tests for CPU.
Resource    /home/bmc/openbmc-test-automation/lib/resource.robot
Library    /home/bmc/openbmc-test-automation/lib/bmc_redfish.py    https://${OPENBMC_HOST}:${HTTPS_PORT}    ${OPENBMC_USERNAME}    ${OPENBMC_PASSWORD}    AS    Redfish
Suite Setup    Redfish.Login    auth=basic
Suite Teardown    Redfish.Logout
Test Tags    CPU    Redfish

*** Test Cases ***
Verify Cpu Status Sensor CPU_STATUS_00
    [Documentation]    Verify Cpu Status Sensor CPU_STATUS_00 through Redfish.
    [Tags]    CPU-DRAFT-01    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/CPU_STATUS_00    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    Id
    Dictionary Should Contain Key    ${response.dict}    Name
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    ReadingType

Verify Cpu Temp Sensor CPU_TEMP_00
    [Documentation]    Verify Cpu Temp Sensor CPU_TEMP_00 through Redfish.
    [Tags]    CPU-DRAFT-02    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/CPU_TEMP_00    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    Id
    Dictionary Should Contain Key    ${response.dict}    Name
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    ReadingType
    Dictionary Should Contain Key    ${response.dict}    ReadingUnits

Verify Cpu Power Sensor CPU_POWER
    [Documentation]    Verify Cpu Power Sensor CPU_POWER through Redfish.
    [Tags]    CPU-DRAFT-03    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/CPU_POWER    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    Id
    Dictionary Should Contain Key    ${response.dict}    Name
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    ReadingType
    Dictionary Should Contain Key    ${response.dict}    ReadingUnits
