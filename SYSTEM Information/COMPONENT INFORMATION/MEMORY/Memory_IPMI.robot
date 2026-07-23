*** Settings ***
Library    Process
Library    String

*** Variables ***
${OPENBMC_HOST}    %{OPENBMC_HOST=127.0.0.1}
${OPENBMC_USERNAME}    %{OPENBMC_USERNAME=root}
${OPENBMC_PASSWORD}    %{OPENBMC_PASSWORD=0penBmc}

*** Test Cases ***
Get Memory Info Via IPMI
    [Documentation]    Get memory information via IPMI command
    [Tags]    Memory_IPMI_Get_Memory_Info    SYSTEM_INFO    MEMORY    IPMI    GET
    ${result}=    Run Process    ipmitool    -I lanplus    -H    ${OPENBMC_HOST}    -U    ${OPENBMC_USERNAME}    -P    ${OPENBMC_PASSWORD}    raw    0x04    0x11    stdout=PIPE    stderr=PIPE
    Log    ${result.stdout}
    Log    ${result.stderr}
    Should Be Equal    ${result.returncode}    0

Get Memory Sensor Reading
    [Documentation]    Get memory sensor reading via IPMI
    [Tags]    Memory_IPMI_Get_Memory_Sensor_Reading    SYSTEM_INFO    MEMORY    IPMI    GET
    ${result}=    Run Process    ipmitool    -I lanplus    -H    ${OPENBMC_HOST}    -U    ${OPENBMC_USERNAME}    -P    ${OPENBMC_PASSWORD}    sensor    Mem    stdout=PIPE    stderr=PIPE
    Log    ${result.stdout}
    Log    ${result.stderr}
    Should Be Equal    ${result.returncode}    0