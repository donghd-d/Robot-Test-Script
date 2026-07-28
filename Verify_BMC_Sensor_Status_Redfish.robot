*** Settings ***
Documentation    Generated Redfish tests for Sensor.
Resource    /home/bmc/openbmc-test-automation/lib/resource.robot
Library    /home/bmc/openbmc-test-automation/lib/bmc_redfish.py    https://${OPENBMC_HOST}:${HTTPS_PORT}    ${OPENBMC_USERNAME}    ${OPENBMC_PASSWORD}    AS    Redfish
Suite Setup    Redfish.Login    auth=basic
Suite Teardown    Redfish.Logout
Test Tags    Sensor    Redfish

*** Test Cases ***
Get Sensor Collection And Verify NonEmpty
    [Documentation]    Get Sensor Collection And Verify NonEmpty through Redfish.
    [Tags]    Sensor-08    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    Members
    Dictionary Should Contain Key    ${response.dict}    Members@odata.count
    Dictionary Should Contain Key    ${response.dict}    @odata.id
    Should Be True    len(${response.dict}[Members]) > 0

Get Bmc Ecc Sensor And Verify Status
    [Documentation]    Get Bmc Ecc Sensor And Verify Status through Redfish.
    [Tags]    Sensor-09    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/BMC_ECC    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    Id
    Dictionary Should Contain Key    ${response.dict}    Name
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    ReadingType

Get Scm Bmc Temp Sensor And Verify Status
    [Documentation]    Get Scm Bmc Temp Sensor And Verify Status through Redfish.
    [Tags]    Sensor-10    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/SCM_BMC_Temp    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    Id
    Dictionary Should Contain Key    ${response.dict}    Name
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    ReadingUnits

Get 12V Sensor And Verify Status
    [Documentation]    Get 12V Sensor And Verify Status through Redfish.
    [Tags]    Sensor-11    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/12V    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    Id
    Dictionary Should Contain Key    ${response.dict}    Name
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    ReadingUnits
