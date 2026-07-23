*** Settings ***
Library    Process
Library    String

*** Variables ***
${OPENBMC_HOST}    %{OPENBMC_HOST=127.0.0.1}
${OPENBMC_USERNAME}    %{OPENBMC_USERNAME=root}
${OPENBMC_PASSWORD}    %{OPENBMC_PASSWORD=0penBmc}

*** Test Cases ***
Get CPU Info Via SMASH
    [Documentation]    Get CPU information via SMASH protocol
    [Tags]    CPU_Smash_Get_CPU_Info    SYSTEM_INFO    CPU    SMASH    GET
    ${result}=    Run Process    smash    -h    ${OPENBMC_HOST}    -u    ${OPENBMC_USERNAME}    -p    ${OPENBMC_PASSWORD}    show    /cpu    stdout=PIPE    stderr=PIPE
    Log    ${result.stdout}
    Log    ${result.stderr}
    Should Be Equal    ${result.returncode}    0

Get CPU Properties Via SMASH
    [Documentation]    Get CPU properties via SMASH
    [Tags]    CPU_Smash_Get_CPU_Properties_Via_SMASH    SYSTEM_INFO    CPU    SMASH    GET
    ${result}=    Run Process    smash    -h    ${OPENBMC_HOST}    -u    ${OPENBMC_USERNAME}    -p    ${OPENBMC_PASSWORD}    show    /cpu0    stdout=PIPE    stderr=PIPE
    Log    ${result.stdout}
    Log    ${result.stderr}
    Should Be Equal    ${result.returncode}    0