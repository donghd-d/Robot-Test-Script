*** Settings ***
Library    Process
Library    String

*** Variables ***
${OPENBMC_HOST}    %{OPENBMC_HOST=127.0.0.1}
${OPENBMC_USERNAME}    %{OPENBMC_USERNAME=root}
${OPENBMC_PASSWORD}    %{OPENBMC_PASSWORD=0penBmc}

*** Test Cases ***
Get FRU Information Via IPMI
    [Documentation]    Get FRU information via IPMI command
    [Tags]    FRU_IPMI_Get_FRU_Information    FRU_INFO    IPMI    GET
    ${result}=    Run Process    ipmitool    -I lanplus    -H    ${OPENBMC_HOST}    -U    ${OPENBMC_USERNAME}    -P    ${OPENBMC_PASSWORD}    fru    stdout=PIPE    stderr=PIPE
    Log    ${result.stdout}
    Log    ${result.stderr}
    Should Be Equal    ${result.returncode}    0

Get FRU List Via IPMI
    [Documentation]    Get FRU list via IPMI
    [Tags]    FRU_IPMI_Get_FRU_List    FRU_INFO    IPMI    GET
    ${result}=    Run Process    ipmitool    -I lanplus    -H    ${OPENBMC_HOST}    -U    ${OPENBMC_USERNAME}    -P    ${OPENBMC_PASSWORD}    fru    list    stdout=PIPE    stderr=PIPE
    Log    ${result.stdout}
    Log    ${result.stderr}
    Should Be Equal    ${result.returncode}    0