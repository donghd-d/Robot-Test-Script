*** Settings ***
Documentation    Generated Redfish tests for Sensor.
Resource    /home/bmc/openbmc-test-automation/lib/resource.robot
Resource    /home/bmc/openbmc-test-automation/lib/bmc_redfish_resource.robot
Test Tags    Sensor    Redfish

*** Test Cases ***
Verify BMC eth1 Network Status
    [Documentation]    Verify BMC eth1 Network Status through Redfish.
    [Tags]    Sensor-05    RO
    ${response}=    Redfish.Get    /redfish/v1/Managers/1/EthernetInterfaces/eth1    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    @odata.id
    Dictionary Should Contain Key    ${response.dict}    @odata.type
    Dictionary Should Contain Key    ${response.dict}    Description
    Dictionary Should Contain Key    ${response.dict}    DomainNames
    Dictionary Should Contain Key    ${response.dict}    EthernetInterfaceType
    Dictionary Should Contain Key    ${response.dict}    FQDN
    Dictionary Should Contain Key    ${response.dict}    HostName
    Dictionary Should Contain Key    ${response.dict}    IPv4Addresses
    Dictionary Should Contain Key    ${response.dict}    IPv4StaticAddresses
    Dictionary Should Contain Key    ${response.dict}    IPv6AddressPolicyTable
    Dictionary Should Contain Key    ${response.dict}    IPv6Addresses
    Dictionary Should Contain Key    ${response.dict}    IPv6DefaultGateway
    Dictionary Should Contain Key    ${response.dict}    IPv6Enabled
    Dictionary Should Contain Key    ${response.dict}    IPv6StaticAddresses
    Dictionary Should Contain Key    ${response.dict}    Id
    Dictionary Should Contain Key    ${response.dict}    InterfaceEnabled
    Dictionary Should Contain Key    ${response.dict}    LinkStatus
    Dictionary Should Contain Key    ${response.dict}    MACAddress
    Dictionary Should Contain Key    ${response.dict}    MTUSize
    Dictionary Should Contain Key    ${response.dict}    Name
    Dictionary Should Contain Key    ${response.dict}    NameServers
    Dictionary Should Contain Key    ${response.dict}    PermanentMACAddress
    Dictionary Should Contain Key    ${response.dict}    SpeedMbps
    Dictionary Should Contain Key    ${response.dict}    StaticDomainNames
    Dictionary Should Contain Key    ${response.dict}    StaticNameServers

Verify BMC eth0 Network Status
    [Documentation]    Verify BMC eth0 Network Status through Redfish.
    [Tags]    Sensor-05    RO
    ${response}=    Redfish.Get    /redfish/v1/Managers/1/EthernetInterfaces/eth0    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    @odata.id
    Dictionary Should Contain Key    ${response.dict}    @odata.type
    Dictionary Should Contain Key    ${response.dict}    Description
    Dictionary Should Contain Key    ${response.dict}    DomainNames
    Dictionary Should Contain Key    ${response.dict}    EthernetInterfaceType
    Dictionary Should Contain Key    ${response.dict}    FQDN
    Dictionary Should Contain Key    ${response.dict}    HostName
    Dictionary Should Contain Key    ${response.dict}    IPv4Addresses
    Dictionary Should Contain Key    ${response.dict}    IPv4StaticAddresses
    Dictionary Should Contain Key    ${response.dict}    IPv6AddressPolicyTable
    Dictionary Should Contain Key    ${response.dict}    IPv6Addresses
    Dictionary Should Contain Key    ${response.dict}    IPv6DefaultGateway
    Dictionary Should Contain Key    ${response.dict}    IPv6Enabled
    Dictionary Should Contain Key    ${response.dict}    IPv6StaticAddresses
    Dictionary Should Contain Key    ${response.dict}    Id
    Dictionary Should Contain Key    ${response.dict}    InterfaceEnabled
    Dictionary Should Contain Key    ${response.dict}    LinkStatus
    Dictionary Should Contain Key    ${response.dict}    MACAddress
    Dictionary Should Contain Key    ${response.dict}    MTUSize
    Dictionary Should Contain Key    ${response.dict}    Name
    Dictionary Should Contain Key    ${response.dict}    NameServers
    Dictionary Should Contain Key    ${response.dict}    PermanentMACAddress
    Dictionary Should Contain Key    ${response.dict}    SpeedMbps
    Dictionary Should Contain Key    ${response.dict}    StaticDomainNames
    Dictionary Should Contain Key    ${response.dict}    StaticNameServers

Verify BMC eth0 Network Status
    [Documentation]    Verify BMC eth0 Network Status through Redfish.
    [Tags]    Sensor-06    RO
    ${response}=    Redfish.Get    /redfish/v1/Managers/1/EthernetInterfaces/eth0    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    @odata.id
    Dictionary Should Contain Key    ${response.dict}    @odata.type
    Dictionary Should Contain Key    ${response.dict}    Description
    Dictionary Should Contain Key    ${response.dict}    DomainNames
    Dictionary Should Contain Key    ${response.dict}    EthernetInterfaceType
    Dictionary Should Contain Key    ${response.dict}    FQDN
    Dictionary Should Contain Key    ${response.dict}    HostName
    Dictionary Should Contain Key    ${response.dict}    IPv4Addresses
    Dictionary Should Contain Key    ${response.dict}    IPv4StaticAddresses
    Dictionary Should Contain Key    ${response.dict}    IPv6AddressPolicyTable
    Dictionary Should Contain Key    ${response.dict}    IPv6Addresses
    Dictionary Should Contain Key    ${response.dict}    IPv6DefaultGateway
    Dictionary Should Contain Key    ${response.dict}    IPv6Enabled
    Dictionary Should Contain Key    ${response.dict}    IPv6StaticAddresses
    Dictionary Should Contain Key    ${response.dict}    Id
    Dictionary Should Contain Key    ${response.dict}    InterfaceEnabled
    Dictionary Should Contain Key    ${response.dict}    LinkStatus
    Dictionary Should Contain Key    ${response.dict}    MACAddress
    Dictionary Should Contain Key    ${response.dict}    MTUSize
    Dictionary Should Contain Key    ${response.dict}    Name
    Dictionary Should Contain Key    ${response.dict}    NameServers
    Dictionary Should Contain Key    ${response.dict}    PermanentMACAddress
    Dictionary Should Contain Key    ${response.dict}    SpeedMbps
    Dictionary Should Contain Key    ${response.dict}    StaticDomainNames
    Dictionary Should Contain Key    ${response.dict}    StaticNameServers

Verify BMC eth1 Network Status
    [Documentation]    Verify BMC eth1 Network Status through Redfish.
    [Tags]    Sensor-07    RO
    ${response}=    Redfish.Get    /redfish/v1/Managers/1/EthernetInterfaces/eth1    valid_status_codes=[200]
    Dictionary Should Contain Key    ${response.dict}    @odata.id
    Dictionary Should Contain Key    ${response.dict}    @odata.type
    Dictionary Should Contain Key    ${response.dict}    Description
    Dictionary Should Contain Key    ${response.dict}    DomainNames
    Dictionary Should Contain Key    ${response.dict}    EthernetInterfaceType
    Dictionary Should Contain Key    ${response.dict}    FQDN
    Dictionary Should Contain Key    ${response.dict}    HostName
    Dictionary Should Contain Key    ${response.dict}    IPv4Addresses
    Dictionary Should Contain Key    ${response.dict}    IPv4StaticAddresses
    Dictionary Should Contain Key    ${response.dict}    IPv6AddressPolicyTable
    Dictionary Should Contain Key    ${response.dict}    IPv6Addresses
    Dictionary Should Contain Key    ${response.dict}    IPv6DefaultGateway
    Dictionary Should Contain Key    ${response.dict}    IPv6Enabled
    Dictionary Should Contain Key    ${response.dict}    IPv6StaticAddresses
    Dictionary Should Contain Key    ${response.dict}    Id
    Dictionary Should Contain Key    ${response.dict}    InterfaceEnabled
    Dictionary Should Contain Key    ${response.dict}    LinkStatus
    Dictionary Should Contain Key    ${response.dict}    MACAddress
    Dictionary Should Contain Key    ${response.dict}    MTUSize
    Dictionary Should Contain Key    ${response.dict}    Name
    Dictionary Should Contain Key    ${response.dict}    NameServers
    Dictionary Should Contain Key    ${response.dict}    PermanentMACAddress
    Dictionary Should Contain Key    ${response.dict}    SpeedMbps
    Dictionary Should Contain Key    ${response.dict}    StaticDomainNames
    Dictionary Should Contain Key    ${response.dict}    StaticNameServers
