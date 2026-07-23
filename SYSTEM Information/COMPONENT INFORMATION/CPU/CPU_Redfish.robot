*** Settings ***
Library    Collections
Library    RequestsLibrary

*** Variables ***
${OPENBMC_HOST}    %{OPENBMC_HOST=127.0.0.1}
${OPENBMC_USERNAME}    %{OPENBMC_USERNAME=root}
${OPENBMC_PASSWORD}    %{OPENBMC_PASSWORD=0penBmc}
${REDFISH_BASE_URL}    https://${OPENBMC_HOST}

*** Test Cases ***
Get CPU Info Via Redfish
    [Documentation]    Get CPU information via Redfish API
    [Tags]    CPU_Redfish_Get_CPU_Info    SYSTEM_INFO    CPU    Redfish    GET
    ${auth}=    Create List    ${OPENBMC_USERNAME}    ${OPENBMC_PASSWORD}
    Create Session    redfish    ${REDFISH_BASE_URL}    auth=${auth}    verify=False
    ${response}=    GET On Session    redfish    /redfish/v1/Systems/1/Processors
    Should Be Equal As Integers    ${response.status_code}    200
    Log    ${response.text}

Get Single CPU Details
    [Documentation]    Get details of a specific CPU
    [Tags]    CPU_Redfish_Get_Single_CPU_Details    SYSTEM_INFO    CPU    Redfish    GET
    ${auth}=    Create List    ${OPENBMC_USERNAME}    ${OPENBMC_PASSWORD}
    Create Session    redfish    ${REDFISH_BASE_URL}    auth=${auth}    verify=False
    ${response}=    GET On Session    redfish    /redfish/v1/Systems/1/Processors/0
    Should Be Equal As Integers    ${response.status_code}    200
    Log    ${response.text}