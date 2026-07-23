*** Settings ***
Library    Process
Library    String

*** Variables ***
${OPENBMC_HOST}    %{OPENBMC_HOST=127.0.0.1}
${OPENBMC_COMMUNITY}    %{OPENBMC_COMMUNITY=public}

*** Test Cases ***
Get CPU Info Via SNMP
    [Documentation]    Get CPU information via SNMP
    [Tags]    CPU_SNMP_Get_CPU_Info    SYSTEM_INFO    CPU    SNMP    GET
    ${result}=    Run Process    snmpget    -v    2c    -c    ${OPENBMC_COMMUNITY}    ${OPENBMC_HOST}    1.3.6.1.4.1.2.3.4.5.6.7.8.9.10    stdout=PIPE    stderr=PIPE
    Log    ${result.stdout}
    Log    ${result.stderr}
    Should Be Equal    ${result.returncode}    0

Get CPU Details Via SNMP Walk
    [Documentation]    Get CPU details via SNMP walk
    [Tags]    CPU_SNMP_Get_CPU_Details_Via_SNMP_Walk    SYSTEM_INFO    CPU    SNMP    GET
    ${result}=    Run Process    snmpwalk    -v    2c    -c    ${OPENBMC_COMMUNITY}    ${OPENBMC_HOST}    1.3.6.1.4.1.2.3.4.5.6.7.8.9    stdout=PIPE    stderr=PIPE
    Log    ${result.stdout}
    Log    ${result.stderr}
    Should Be Equal    ${result.returncode}    0