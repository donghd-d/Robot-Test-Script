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

Verify CPU Processors Collection Status
    [Documentation]    Verify CPU Processors Collection Status through Redfish.
    [Tags]    CPU-01    RO
    ${response}=    Redfish.Get    /redfish/v1/Systems/1/Processors    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    @odata.context
    Dictionary Should Contain Key    ${response.dict}    @odata.id
    Dictionary Should Contain Key    ${response.dict}    @odata.type
    Dictionary Should Contain Key    ${response.dict}    Members
    Dictionary Should Contain Key    ${response.dict}    Members@odata.count
    Dictionary Should Contain Key    ${response.dict}    Name

Verify CPU Processor Collection Status Via Redfish
    [Documentation]    Verify CPU Processor Collection Status Via Redfish through Redfish.
    [Tags]    CPU-02    RO
    ${response}=    Redfish.Get    /redfish/v1/Systems/1/Processors    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    @odata.context
    Dictionary Should Contain Key    ${response.dict}    @odata.id
    Dictionary Should Contain Key    ${response.dict}    @odata.type
    Dictionary Should Contain Key    ${response.dict}    Members
    Dictionary Should Contain Key    ${response.dict}    Members@odata.count
    Dictionary Should Contain Key    ${response.dict}    Name

Verify CPU Processor Status Via Redfish GET
    [Documentation]    Verify CPU Processor Status Via Redfish GET through Redfish.
    [Tags]    CPU-03    RO
    ${response}=    Redfish.Get    /redfish/v1/Systems/1/Processors/0    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    @odata.context
    Dictionary Should Contain Key    ${response.dict}    @odata.id
    Dictionary Should Contain Key    ${response.dict}    @odata.type
    Dictionary Should Contain Key    ${response.dict}    BaseSpeedMHz
    Dictionary Should Contain Key    ${response.dict}    Id
    Dictionary Should Contain Key    ${response.dict}    InstructionSet
    Dictionary Should Contain Key    ${response.dict}    Manufacturer
    Dictionary Should Contain Key    ${response.dict}    MaxSpeedMHz
    Dictionary Should Contain Key    ${response.dict}    Model
    Dictionary Should Contain Key    ${response.dict}    Name
    Dictionary Should Contain Key    ${response.dict}    ProcessorArchitecture
    Dictionary Should Contain Key    ${response.dict}    ProcessorType
    Dictionary Should Contain Key    ${response.dict}    SerialNumber
    Dictionary Should Contain Key    ${response.dict}    Socket
    Dictionary Should Contain Key    ${response.dict}    TDPWatts
    Dictionary Should Contain Key    ${response.dict}    TotalCores
    Dictionary Should Contain Key    ${response.dict}    TotalThreads
