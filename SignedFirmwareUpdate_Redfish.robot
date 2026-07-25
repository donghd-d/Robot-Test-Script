*** Settings ***
Documentation    Generated Redfish tests for Date-Time.
Resource    /home/bmc/openbmc-test-automation/lib/resource.robot
Resource    /home/bmc/openbmc-test-automation/lib/bmc_redfish_resource.robot
Test Tags    Date-Time    Redfish

*** Test Cases ***
Upload Signed Firmware Image To FirmwareInventory
    [Documentation]    Upload Signed Firmware Image To FirmwareInventory through Redfish.
    [Tags]    Date-Time-01    RW
    ${payload}=    Create Dictionary    UpdateFile=signed_firmware_image.bin
    ${response}=    Redfish.Post    /redfish/v1/UpdateService/FirmwareInventory    body=&{payload}    valid_status_codes=[201]
    Dictionary Should Contain Key    ${response.dict}    @odata.id
    Dictionary Should Contain Key    ${response.dict}    @odata.type

Upload Signed Firmware Image Smoke Retry
    [Documentation]    Upload Signed Firmware Image Smoke Retry through Redfish.
    [Tags]    Date-Time-02    RW
    ${payload}=    Create Dictionary    UpdateFile=signed_firmware_image.bin
    ${response}=    Redfish.Post    /redfish/v1/UpdateService/FirmwareInventory    body=&{payload}    valid_status_codes=[201]
    Dictionary Should Contain Key    ${response.dict}    @odata.id
    Dictionary Should Contain Key    ${response.dict}    @odata.type
