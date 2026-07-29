*** Settings ***
Documentation    Generated Redfish tests for Sensor.
Resource    /home/bmc/openbmc-test-automation/lib/resource.robot
Library    /home/bmc/openbmc-test-automation/lib/bmc_redfish.py    https://${OPENBMC_HOST}:${HTTPS_PORT}    ${OPENBMC_USERNAME}    ${OPENBMC_PASSWORD}    AS    Redfish
Suite Setup    Redfish.Login    auth=basic
Suite Teardown    Redfish.Logout
Test Tags    Sensor    Redfish

*** Test Cases ***
Verify Sensors Collection Is NonEmpty
    [Documentation]    Verify Sensors Collection Is NonEmpty through Redfish.
    [Tags]    Sensor-23    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors    valid_status_codes=[200]
    Should Be True    len(${response.dict}[Members]) > 0
    Dictionary Should Contain Key    ${response.dict}    Members@odata.count
    Dictionary Should Contain Key    ${response.dict}    @odata.id

Verify BmcEcc Sensor Status
    [Documentation]    Verify BmcEcc Sensor Status through Redfish.
    [Tags]    Sensor-24    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/BMC_ECC    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    Status.State
    Dictionary Should Contain Key    ${response.dict}    Status.Health
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    Id

Verify BmcRestart Sensor Status
    [Documentation]    Verify BmcRestart Sensor Status through Redfish.
    [Tags]    Sensor-25    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/BMC_RESTART    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    Status.State
    Dictionary Should Contain Key    ${response.dict}    Status.Health
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    Id

Verify ScmBmcTemp Sensor Status
    [Documentation]    Verify ScmBmcTemp Sensor Status through Redfish.
    [Tags]    Sensor-26    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/SCM_BMC_Temp    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    Status.State
    Dictionary Should Contain Key    ${response.dict}    Status.Health
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    Id

Verify 12V Sensor Status
    [Documentation]    Verify 12V Sensor Status through Redfish.
    [Tags]    Sensor-27    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/12V    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    Status.State
    Dictionary Should Contain Key    ${response.dict}    Status.Health
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    Id

Verify 12VAux Sensor Status
    [Documentation]    Verify 12VAux Sensor Status through Redfish.
    [Tags]    Sensor-28    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/12V_AUX    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    Status.State
    Dictionary Should Contain Key    ${response.dict}    Status.Health
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    Id

Verify 1V0Aux Sensor Status
    [Documentation]    Verify 1V0Aux Sensor Status through Redfish.
    [Tags]    Sensor-29    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/1V0_AUX    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    Status.State
    Dictionary Should Contain Key    ${response.dict}    Status.Health
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    Id

Verify 1V2Aux Sensor Status
    [Documentation]    Verify 1V2Aux Sensor Status through Redfish.
    [Tags]    Sensor-30    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/1V2_AUX    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    Status.State
    Dictionary Should Contain Key    ${response.dict}    Status.Health
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    Id

Verify 1V8Aux Sensor Status
    [Documentation]    Verify 1V8Aux Sensor Status through Redfish.
    [Tags]    Sensor-31    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/1V8_AUX    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    Status.State
    Dictionary Should Contain Key    ${response.dict}    Status.Health
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    Id

Verify 3V3 Sensor Status
    [Documentation]    Verify 3V3 Sensor Status through Redfish.
    [Tags]    Sensor-32    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/3V3    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    Status.State
    Dictionary Should Contain Key    ${response.dict}    Status.Health
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    Id
