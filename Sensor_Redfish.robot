*** Settings ***
Documentation    Generated Redfish tests for Sensor.
Resource    /home/bmc/openbmc-test-automation-reference/lib/resource.robot
Resource    /home/bmc/openbmc-test-automation-reference/lib/bmc_redfish_resource.robot
Test Tags    Sensor    Redfish

*** Test Cases ***
Verify Account Service Status Via Redfish
    [Documentation]    Verify Account Service Status Via Redfish through Redfish.
    [Tags]    Sensor-01    RO
    ${response}=    Redfish.Get    /redfish/v1/AccountService    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    Status
    Dictionary Should Contain Key    ${response.dict}    ServiceEnabled
    Dictionary Should Contain Key    ${response.dict}    AccountLockoutThreshold
    Dictionary Should Contain Key    ${response.dict}    MaxPasswordLength
    Dictionary Should Contain Key    ${response.dict}    MinPasswordLength
    Dictionary Should Contain Key    ${response.dict}    Accounts
