*** Settings ***
Library    Process
Library    String

*** Variables ***
${OPENBMC_HOST}    %{OPENBMC_HOST=127.0.0.1}
${OPENBMC_USERNAME}    %{OPENBMC_USERNAME=root}
${OPENBMC_PASSWORD}    %{OPENBMC_PASSWORD=0penBmc}

*** Test Cases ***
Get FRU Information Via SMASH
    [Documentation]    Get FRU information via SMASH protocol
    [Tags]    FRU_Smash_Get_FRU_Information    FRU_INFO    SMASH    GET
    ${result}=    Run Process    smash    -h    ${OPENBMC_HOST}    -u    ${OPENBMC_USERNAME}    -p    ${OPENBMC_PASSWORD}    show    /fru    stdout=PIPE    stderr=PIPE
    Log    ${result.stdout}
    Log    ${result.stderr}
    Should Be Equal    ${result.returncode}    0

Get FRU Properties Via SMASH
    [Documentation]    Get FRU properties via SMASH
    [Tags]    FRU_Smash_Get_FRU_Properties_Via_SMASH    FRU_INFO    SMASH    GET
    ${result}=    Run Process    smash    -h    ${OPENBMC_HOST}    -u    ${OPENBMC_USERNAME}    -p    ${OPENBMC_PASSWORD}    show    /system/fru    stdout=PIPE    stderr=PIPE
    Log    ${result.stdout}
    Log    ${result.stderr}
    Should Be Equal    ${result.returncode}    0