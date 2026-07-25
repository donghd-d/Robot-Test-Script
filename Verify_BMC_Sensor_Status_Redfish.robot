*** Settings ***
Documentation    Generated Redfish tests for Sensor.
Resource    /home/bmc/openbmc-test-automation/lib/resource.robot
Resource    /home/bmc/openbmc-test-automation/lib/bmc_redfish_resource.robot
Test Tags    Sensor    Redfish

*** Test Cases ***
Verify BMC_ECC Sensor Status
    [Documentation]    Verify BMC_ECC Sensor Status through Redfish.
    [Tags]    Sensor-02    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/BMC_ECC    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    @odata.id
    Dictionary Should Contain Key    ${response.dict}    @odata.type
    Dictionary Should Contain Key    ${response.dict}    Id
    Dictionary Should Contain Key    ${response.dict}    Name
    Dictionary Should Contain Key    ${response.dict}    PhysicalContext
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    ReadingRangeMax
    Dictionary Should Contain Key    ${response.dict}    ReadingRangeMin
    Dictionary Should Contain Key    ${response.dict}    ReadingTime
    Dictionary Should Contain Key    ${response.dict}    ReadingType

Verify BMC_RESTART Sensor Status
    [Documentation]    Verify BMC_RESTART Sensor Status through Redfish.
    [Tags]    Sensor-03    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/BMC_RESTART    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    @odata.id
    Dictionary Should Contain Key    ${response.dict}    @odata.type
    Dictionary Should Contain Key    ${response.dict}    Id
    Dictionary Should Contain Key    ${response.dict}    Name
    Dictionary Should Contain Key    ${response.dict}    PhysicalContext
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    ReadingRangeMax
    Dictionary Should Contain Key    ${response.dict}    ReadingRangeMin
    Dictionary Should Contain Key    ${response.dict}    ReadingTime
    Dictionary Should Contain Key    ${response.dict}    ReadingType

Verify SCM_BMC_Temp Sensor Status
    [Documentation]    Verify SCM_BMC_Temp Sensor Status through Redfish.
    [Tags]    Sensor-04    RO
    ${response}=    Redfish.Get    /redfish/v1/Chassis/1/Sensors/SCM_BMC_Temp    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    @odata.id
    Dictionary Should Contain Key    ${response.dict}    @odata.type
    Dictionary Should Contain Key    ${response.dict}    Id
    Dictionary Should Contain Key    ${response.dict}    Name
    Dictionary Should Contain Key    ${response.dict}    PhysicalContext
    Dictionary Should Contain Key    ${response.dict}    Reading
    Dictionary Should Contain Key    ${response.dict}    ReadingRangeMax
    Dictionary Should Contain Key    ${response.dict}    ReadingRangeMin
    Dictionary Should Contain Key    ${response.dict}    ReadingTime
    Dictionary Should Contain Key    ${response.dict}    ReadingType
    Dictionary Should Contain Key    ${response.dict}    ReadingUnits
