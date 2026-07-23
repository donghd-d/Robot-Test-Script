*** Settings ***
Library    Process
Library    String

*** Variables ***
${OPENBMC_HOST}    %{OPENBMC_HOST=127.0.0.1}
${OPENBMC_COMMUNITY}    %{OPENBMC_COMMUNITY=public}

*** Test Cases ***
Get Riser Info Via SNMP
    [Documentation]    Get riser information via SNMP
    [Tags]    Riser_SNMP_Get_Riser_Info    SYSTEM_INFO    RISER    SNMP    GET
    ${result}=    Run Process    snmpget    -v    2c    -c    ${OPENBMC_COMMUNITY}    ${OPENBMC_HOST}    1.3.6.1.4.1.2.3.4.5.6.7.8.9.30    stdout=PIPE    stderr=PIPE
    Log    ${result.stdout}
    Log    ${result.stderr}
    Should Be Equal    ${result.returncode}    0

Get Riser Details Via SNMP Walk
    [Documentation]    Get riser details via SNMP walk
    [Tags]    Riser_SNMP_Get_Riser_Details_Via_SNMP_Walk    SYSTEM_INFO    RISER    SNMP    GET
    ${result}=    Run Process    snmpwalk    -v    2c    -c    ${OPENBMC_COMMUNITY}    ${OPENBMC_HOST}    1.3.6.1.4.1.2.3.4.5.6.7.8.9    stdout=PIPE    stderr=PIPE
    Log    ${result.stdout}
    Log    ${result.stderr}
    Should Be Equal    ${result.returncode}    0