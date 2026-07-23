*** Settings ***
Library    Collections
Library    RequestsLibrary

*** Variables ***
${OPENBMC_HOST}    %{OPENBMC_HOST=127.0.0.1}
${OPENBMC_USERNAME}    %{OPENBMC_USERNAME=root}
${OPENBMC_PASSWORD}    %{OPENBMC_PASSWORD=0penBmc}
${REDFISH_BASE_URL}    https://${OPENBMC_HOST}

*** Test Cases ***
Get FRU Information Via Redfish
    [Documentation]    Get FRU information via Redfish API
    [Tags]    FRU_Redfish_Get_FRU_Information    FRU_INFO    Redfish    GET
    ${auth}=    Create List    ${OPENBMC_USERNAME}    ${OPENBMC_PASSWORD}
    Create Session    redfish    ${REDFISH_BASE_URL}    auth=${auth}    verify=False
    ${response}=    GET On Session    redfish    /redfish/v1/Chassis/1
    Should Be Equal As Integers    ${response.status_code}    200
    Log    ${response.text}

Get FRU Inventory
    [Documentation]    Get FRU inventory via Redfish
    [Tags]    FRU_Redfish_Get_FRU_Inventory    FRU_INFO    Redfish    GET
    ${auth}=    Create List    ${OPENBMC_USERNAME}    ${OPENBMC_PASSWORD}
    Create Session    redfish    ${REDFISH_BASE_URL}    auth=${auth}    verify=False
    ${response}=    GET On Session    redfish    /redfish/v1/Chassis/1/Environment
    Should Be Equal As Integers    ${response.status_code}    200
    Log    ${response.text}