*** Settings ***
Documentation    Generated Redfish tests for Account-Service.
Resource    /home/bmc/openbmc-test-automation/lib/resource.robot
Resource    /home/bmc/openbmc-test-automation/lib/bmc_redfish_resource.robot
Test Tags    Account-Service    Redfish

*** Test Cases ***
Verify Redfish User Login And Logout
    [Documentation]    Verify Redfish User Login And Logout through Redfish.
    [Tags]    Account-Service-09    RW
    ${response}=    Redfish.Post    /redfish/v1/SessionService/Sessions    body={"UserName": "${OPENBMC_USERNAME}", "Password": "${OPENBMC_PASSWORD}"}    valid_status_codes=[201]
    Dictionary Should Contain Key    ${response.dict}    Id
    Dictionary Should Contain Key    ${response.dict}    UserName
    Dictionary Should Contain Key    ${response.dict}    @odata.id
