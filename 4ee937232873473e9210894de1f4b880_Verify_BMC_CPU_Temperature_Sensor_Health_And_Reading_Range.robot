*** Settings ***
Documentation    Generated Redfish tests for Sensor.
Resource    /home/bmc/openbmc-test-automation/lib/resource.robot
Library    /home/bmc/openbmc-test-automation/lib/bmc_redfish.py    https://${OPENBMC_HOST}:${HTTPS_PORT}    ${OPENBMC_USERNAME}    ${OPENBMC_PASSWORD}    AS    Redfish
Suite Setup    Redfish.Login    auth=basic
Suite Teardown    Redfish.Logout
Test Tags    Sensor    Redfish

*** Test Cases ***
Verify Cpu0 Temp Sensor Health And Reading Range
    [Documentation]    Verify Cpu0 Temp Sensor Health And Reading Range through Redfish.
    [Tags]    Sensor-DRAFT-01    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/CPU_TEMP_00    valid_status_codes=[200]
    Should Be Equal    ${response.dict}[Status][State]    Enabled
    Should Be Equal    ${response.dict}[Status][Health]    OK
    Should Be True    ${response.dict}[Reading] >= ${response.dict}[ReadingRangeMin] and ${response.dict}[Reading] <= ${response.dict}[ReadingRangeMax]
    Dictionary Should Contain Key    ${response.dict}    Id

Verify Cpu1 Temp Sensor Health And Reading Range
    [Documentation]    Verify Cpu1 Temp Sensor Health And Reading Range through Redfish.
    [Tags]    Sensor-DRAFT-02    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/CPU_TEMP_01    valid_status_codes=[200]
    Should Be Equal    ${response.dict}[Status][State]    Enabled
    Should Be Equal    ${response.dict}[Status][Health]    OK
    Should Be True    ${response.dict}[Reading] >= ${response.dict}[ReadingRangeMin] and ${response.dict}[Reading] <= ${response.dict}[ReadingRangeMax]
    Dictionary Should Contain Key    ${response.dict}    Id
