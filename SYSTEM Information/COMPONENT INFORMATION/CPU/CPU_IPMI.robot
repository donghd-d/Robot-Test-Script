*** Settings ***
Library    Process
Library    String

*** Variables ***
${OPENBMC_HOST}    %{OPENBMC_HOST=127.0.0.1}
${OPENBMC_USERNAME}    %{OPENBMC_USERNAME=root}
${OPENBMC_PASSWORD}    %{OPENBMC_PASSWORD=0penBmc}

*** Test Cases ***
Get CPU Info Via IPMI
    [Documentation]    Get CPU information via IPMI command
    [Tags]    CPU_IPMI_Get_CPU_Info    SYSTEM_INFO    CPU    IPMI    GET
    ${result}=    Run Process    ipmitool    -I lanplus    -H    ${OPENBMC_HOST}    -U    ${OPENBMC_USERNAME}    -P    ${OPENBMC_PASSWORD}    raw    0x04    0x11    stdout=PIPE    stderr=PIPE
    Log    ${result.stdout}
    Log    ${result.stderr}
    Should Be Equal    ${result.returncode}    0

Get CPU Sensor Reading
    [Documentation]    Get CPU sensor reading via IPMI
    [Tags]    CPU_IPMI_Get_CPU_Sensor_Reading    SYSTEM_INFO    CPU    IPMI    GET
    ${result}=    Run Process    ipmitool    -I lanplus    -H    ${OPENBMC_HOST}    -U    ${OPENBMC_USERNAME}    -P    ${OPENBMC_PASSWORD}    sensor    CPU    stdout=PIPE    stderr=PIPE
    Log    ${result.stdout}
    Log    ${result.stderr}
    Should Be Equal    ${result.returncode}    0