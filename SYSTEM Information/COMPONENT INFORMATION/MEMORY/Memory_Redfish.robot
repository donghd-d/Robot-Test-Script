*** Settings ***
Library    Collections
Library    RequestsLibrary

*** Variables ***
${OPENBMC_HOST}    %{OPENBMC_HOST=127.0.0.1}
${OPENBMC_USERNAME}    %{OPENBMC_USERNAME=root}
${OPENBMC_PASSWORD}    %{OPENBMC_PASSWORD=0penBmc}
${REDFISH_BASE_URL}    https://${OPENBMC_HOST}

*** Test Cases ***
Get Memory Info Via Redfish
    [Documentation]    Get memory information via Redfish API
    [Tags]    Memory_Redfish_Get_Memory_Info    SYSTEM_INFO    MEMORY    Redfish    GET
    ${auth}=    Create List    ${OPENBMC_USERNAME}    ${OPENBMC_PASSWORD}
    Create Session    redfish    ${REDFISH_BASE_URL}    auth=${auth}    verify=False
    ${response}=    GET On Session    redfish    /redfish/v1/Systems/1/Memory
    Should Be Equal As Integers    ${response.status_code}    200
    Log    ${response.text}

Get Single Memory Module Details
    [Documentation]    Get details of a specific memory module
    [Tags]    Memory_Redfish_Get_Single_Memory_Module_Details    SYSTEM_INFO    MEMORY    Redfish    GET
    ${auth}=    Create List    ${OPENBMC_USERNAME}    ${OPENBMC_PASSWORD}
    Create Session    redfish    ${REDFISH_BASE_URL}    auth=${auth}    verify=False
    ${response}=    GET On Session    redfish    /redfish/v1/Systems/1/Memory/DIMM0
    Should Be Equal As Integers    ${response.status_code}    200
    Log    ${response.text}