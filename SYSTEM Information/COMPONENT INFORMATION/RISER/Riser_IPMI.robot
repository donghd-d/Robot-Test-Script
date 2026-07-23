*** Settings ***
Library    Process
Library    String

*** Variables ***
${OPENBMC_HOST}    %{OPENBMC_HOST=127.0.0.1}
${OPENBMC_USERNAME}    %{OPENBMC_USERNAME=root}
${OPENBMC_PASSWORD}    %{OPENBMC_PASSWORD=0penBmc}

*** Test Cases ***
Get Riser Info Via IPMI
    [Documentation]    Get riser information via IPMI command
    [Tags]    Riser_IPMI_Get_Riser_Info    SYSTEM_INFO    RISER    IPMI    GET
    ${result}=    Run Process    ipmitool    -I lanplus    -H    ${OPENBMC_HOST}    -U    ${OPENBMC_USERNAME}    -P    ${OPENBMC_PASSWORD}    raw    0x04    0x11    stdout=PIPE    stderr=PIPE
    Log    ${result.stdout}
    Log    ${result.stderr}
    Should Be Equal    ${result.returncode}    0

Get Riser Sensor Reading
    [Documentation]    Get riser sensor reading via IPMI
    [Tags]    Riser_IPMI_Get_Riser_Sensor_Reading    SYSTEM_INFO    RISER    IPMI    GET
    ${result}=    Run Process    ipmitool    -I lanplus    -H    ${OPENBMC_HOST}    -U    ${OPENBMC_USERNAME}    -P    ${OPENBMC_PASSWORD}    sensor    Riser    stdout=PIPE    stderr=PIPE
    Log    ${result.stdout}
    Log    ${result.stderr}
    Should Be Equal    ${result.returncode}    0