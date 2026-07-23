*** Settings ***
Library    Process
Library    String

*** Variables ***
${OPENBMC_HOST}    %{OPENBMC_HOST=127.0.0.1}
${OPENBMC_COMMUNITY}    %{OPENBMC_COMMUNITY=public}

*** Test Cases ***
Get FRU Information Via SNMP
    [Documentation]    Get FRU information via SNMP
    [Tags]    FRU_SNMP_Get_FRU_Information    FRU_INFO    SNMP    GET
    ${result}=    Run Process    snmpget    -v    2c    -c    ${OPENBMC_COMMUNITY}    ${OPENBMC_HOST}    1.3.6.1.4.1.2.3.4.5.6.7.8.9.40    stdout=PIPE    stderr=PIPE
    Log    ${result.stdout}
    Log    ${result.stderr}
    Should Be Equal    ${result.returncode}    0

Get FRU Details Via SNMP Walk
    [Documentation]    Get FRU details via SNMP walk
    [Tags]    FRU_SNMP_Get_FRU_Details_Via_SNMP_Walk    FRU_INFO    SNMP    GET
    ${result}=    Run Process    snmpwalk    -v    2c    -c    ${OPENBMC_COMMUNITY}    ${OPENBMC_HOST}    1.3.6.1.4.1.2.3.4.5.6.7.8.9    stdout=PIPE    stderr=PIPE
    Log    ${result.stdout}
    Log    ${result.stderr}
    Should Be Equal    ${result.returncode}    0