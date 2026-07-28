*** Settings ***
Documentation    Generated Redfish tests for Sensor.
Resource    /home/bmc/openbmc-test-automation/lib/resource.robot
Library    /home/bmc/openbmc-test-automation/lib/bmc_redfish.py    https://${OPENBMC_HOST}:${HTTPS_PORT}    ${OPENBMC_USERNAME}    ${OPENBMC_PASSWORD}    AS    Redfish
Suite Setup    Redfish.Login    auth=basic
Suite Teardown    Redfish.Logout
Test Tags    Sensor    Redfish

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
