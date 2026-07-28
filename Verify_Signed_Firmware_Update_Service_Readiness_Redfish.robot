*** Settings ***
Documentation    Generated Redfish tests for Firmware.
Resource    /home/bmc/openbmc-test-automation/lib/resource.robot
Library    /home/bmc/openbmc-test-automation/lib/bmc_redfish.py    https://${OPENBMC_HOST}:${HTTPS_PORT}    ${OPENBMC_USERNAME}    ${OPENBMC_PASSWORD}    AS    Redfish
Suite Setup    Redfish.Login    auth=basic
Suite Teardown    Redfish.Logout
Test Tags    Firmware    Redfish

*** Test Cases ***
VerifySignedFirmwareUpdateServiceReadiness
    [Documentation]    VerifySignedFirmwareUpdateServiceReadiness through Redfish.
    [Tags]    Date-Time-03    RO
    ${response}=    Redfish.Get    /redfish/v1/UpdateService    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    ServiceEnabled
    Dictionary Should Contain Key    ${response.dict}    HttpPushUri
    Dictionary Should Contain Key    ${response.dict}    MultipartHttpPushUri
    Dictionary Should Contain Key    ${response.dict}    MaxImageSizeBytes
    Dictionary Should Contain Key    ${response.dict}    Id
