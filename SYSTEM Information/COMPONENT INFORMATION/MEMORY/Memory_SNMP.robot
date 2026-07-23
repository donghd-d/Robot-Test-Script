*** Settings ***
Library    Process
Library    String

*** Variables ***
${OPENBMC_HOST}    %{OPENBMC_HOST=127.0.0.1}
${OPENBMC_COMMUNITY}    %{OPENBMC_COMMUNITY=public}

*** Test Cases ***
Get Memory Info Via SNMP
    [Documentation]    Get memory information via SNMP
    [Tags]    Memory_SNMP_Get_Memory_Info    SYSTEM_INFO    MEMORY    SNMP    GET
    ${result}=    Run Process    snmpget    -v    2c    -c    ${OPENBMC_COMMUNITY}    ${OPENBMC_HOST}    1.3.6.1.4.1.2.3.4.5.6.7.8.9.20    stdout=PIPE    stderr=PIPE
    Log    ${result.stdout}
    Log    ${result.stderr}
    Should Be Equal    ${result.returncode}    0

Get Memory Details Via SNMP Walk
    [Documentation]    Get memory details via SNMP walk
    [Tags]    Memory_SNMP_Get_Memory_Details_Via_SNMP_Walk    SYSTEM_INFO    MEMORY    SNMP    GET
    ${result}=    Run Process    snmpwalk    -v    2c    -c    ${OPENBMC_COMMUNITY}    ${OPENBMC_HOST}    1.3.6.1.4.1.2.3.4.5.6.7.8.9    stdout=PIPE    stderr=PIPE
    Log    ${result.stdout}
    Log    ${result.stderr}
    Should Be Equal    ${result.returncode}    0