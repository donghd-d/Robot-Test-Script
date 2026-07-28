*** Settings ***
Documentation    Generated Redfish tests for Sensor.
Resource    /home/bmc/openbmc-test-automation/lib/resource.robot
Library    /home/bmc/openbmc-test-automation/lib/bmc_redfish.py    https://${OPENBMC_HOST}:${HTTPS_PORT}    ${OPENBMC_USERNAME}    ${OPENBMC_PASSWORD}    AS    Redfish
Suite Setup    Redfish.Login    auth=basic
Suite Teardown    Redfish.Logout
Test Tags    Sensor    Redfish

*** Test Cases ***
VerifyPowerSuppliesAndVoltagesNonEmpty
    [Documentation]    VerifyPowerSuppliesAndVoltagesNonEmpty through Redfish.
    [Tags]    Sensor-DRAFT-01    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Power    valid_status_codes=[200]
    Should Be True    len(${response.dict}[PowerSupplies]) > 0
    Should Be True    len(${response.dict}[Voltages]) > 0
    Dictionary Should Contain Key    ${response.dict}    Id
