*** Settings ***
Library    Process
Library    String

*** Variables ***
${OPENBMC_HOST}    %{OPENBMC_HOST=127.0.0.1}
${OPENBMC_USERNAME}    %{OPENBMC_USERNAME=root}
${OPENBMC_PASSWORD}    %{OPENBMC_PASSWORD=0penBmc}

*** Test Cases ***
Get Riser Info Via SMASH
    [Documentation]    Get riser information via SMASH protocol
    [Tags]    Riser_Smash_Get_Riser_Info    SYSTEM_INFO    RISER    SMASH    GET
    ${result}=    Run Process    smash    -h    ${OPENBMC_HOST}    -u    ${OPENBMC_USERNAME}    -p    ${OPENBMC_PASSWORD}    show    /riser    stdout=PIPE    stderr=PIPE
    Log    ${result.stdout}
    Log    ${result.stderr}
    Should Be Equal    ${result.returncode}    0

Get Riser Properties Via SMASH
    [Documentation]    Get riser properties via SMASH
    [Tags]    Riser_Smash_Get_Riser_Properties_Via_SMASH    SYSTEM_INFO    RISER    SMASH    GET
    ${result}=    Run Process    smash    -h    ${OPENBMC_HOST}    -u    ${OPENBMC_USERNAME}    -p    ${OPENBMC_PASSWORD}    show    /riser0    stdout=PIPE    stderr=PIPE
    Log    ${result.stdout}
    Log    ${result.stderr}
    Should Be Equal    ${result.returncode}    0