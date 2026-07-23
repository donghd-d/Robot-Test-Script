*** Settings ***
Library    Process
Library    String

*** Variables ***
${OPENBMC_HOST}    %{OPENBMC_HOST=127.0.0.1}
${OPENBMC_USERNAME}    %{OPENBMC_USERNAME=root}
${OPENBMC_PASSWORD}    %{OPENBMC_PASSWORD=0penBmc}

*** Test Cases ***
Get Memory Info Via SMASH
    [Documentation]    Get memory information via SMASH protocol
    [Tags]    Memory_Smash_Get_Memory_Info    SYSTEM_INFO    MEMORY    SMASH    GET
    ${result}=    Run Process    smash    -h    ${OPENBMC_HOST}    -u    ${OPENBMC_USERNAME}    -p    ${OPENBMC_PASSWORD}    show    /memory    stdout=PIPE    stderr=PIPE
    Log    ${result.stdout}
    Log    ${result.stderr}
    Should Be Equal    ${result.returncode}    0

Get Memory Properties Via SMASH
    [Documentation]    Get memory properties via SMASH
    [Tags]    Memory_Smash_Get_Memory_Properties_Via_SMASH    SYSTEM_INFO    MEMORY    SMASH    GET
    ${result}=    Run Process    smash    -h    ${OPENBMC_HOST}    -u    ${OPENBMC_USERNAME}    -p    ${OPENBMC_PASSWORD}    show    /dimm0    stdout=PIPE    stderr=PIPE
    Log    ${result.stdout}
    Log    ${result.stderr}
    Should Be Equal    ${result.returncode}    0