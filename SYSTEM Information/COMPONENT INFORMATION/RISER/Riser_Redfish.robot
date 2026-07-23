*** Settings ***
Library    Collections
Library    RequestsLibrary

*** Variables ***
${OPENBMC_HOST}    %{OPENBMC_HOST=127.0.0.1}
${OPENBMC_USERNAME}    %{OPENBMC_USERNAME=root}
${OPENBMC_PASSWORD}    %{OPENBMC_PASSWORD=0penBmc}
${REDFISH_BASE_URL}    https://${OPENBMC_HOST}

*** Test Cases ***
Get Riser Info Via Redfish
    [Documentation]    Get riser information via Redfish API
    [Tags]    Riser_Redfish_Get_Riser_Info    SYSTEM_INFO    RISER    Redfish    GET
    ${auth}=    Create List    ${OPENBMC_USERNAME}    ${OPENBMC_PASSWORD}
    Create Session    redfish    ${REDFISH_BASE_URL}    auth=${auth}    verify=False
    ${response}=    GET On Session    redfish    /redfish/v1/Chassis/1/Adapters
    Should Be Equal As Integers    ${response.status_code}    200
    Log    ${response.text}

Get Single Riser Details
    [Documentation]    Get details of a specific riser
    [Tags]    Riser_Redfish_Get_Single_Riser_Details    SYSTEM_INFO    RISER    Redfish    GET
    ${auth}=    Create List    ${OPENBMC_USERNAME}    ${OPENBMC_PASSWORD}
    Create Session    redfish    ${REDFISH_BASE_URL}    auth=${auth}    verify=False
    ${response}=    GET On Session    redfish    /redfish/v1/Chassis/1/Adapters/Riser0
    Should Be Equal As Integers    ${response.status_code}    200
    Log    ${response.text}