*** Settings ***
Documentation    Generated Redfish tests for Date-Time.
Resource    /home/bmc/openbmc-test-automation/lib/resource.robot
Resource    /home/bmc/openbmc-test-automation/lib/bmc_redfish_resource.robot
Suite Setup    Redfish.Login
Suite Teardown    Redfish.Logout
Test Tags    Date-Time    Redfish

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
