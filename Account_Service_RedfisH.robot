*** Settings ***
Documentation    Generated Redfish tests for Account-Service.
Resource    /home/bmc/openbmc-test-automation/lib/resource.robot
Resource    /home/bmc/openbmc-test-automation/lib/bmc_redfish_resource.robot
Test Tags    Account-Service    Redfish

*** Test Cases ***
Create Redfish User Account And Verify Login
    [Documentation]    Create Redfish User Account And Verify Login through Redfish.
    [Tags]    Account-Service-10    RW
    ${response}=    Redfish.Post    /redfish/v1/AccountService/Accounts    body={"UserName": "redfish_verify_user", "Password": "${OPENBMC_PASSWORD}", "RoleId": "priv-user", "Enabled": true, "PasswordChangeRequired": false}    valid_status_codes=[201]
    Dictionary Should Contain Key    ${response.dict}    @odata.id
    Dictionary Should Contain Key    ${response.dict}    UserName
    Dictionary Should Contain Key    ${response.dict}    Enabled

