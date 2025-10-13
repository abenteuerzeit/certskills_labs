# [clab114](https://www.certskills.com/clab114/)

![](../images/clab114_img2.svg)

Requirements
Imagine a LAN in which all the access ports originally connected to PCs, with all access ports assigned to VLAN 20. For this lab, you should migrate the LAN to expect each switch access port to connect instead to a new IP phone. Then each IP phone will have a short patch cable that connects to the same PC that was previously connected to the same switch port. That change will happen for all the access ports shown in the figure.

Your job is to look at the existing configuration on the access ports, and then add the required configuration to support the migration to having both a phone and a PC at the end of each access link. The specific rules for this lab are:

All phones will be in the same VLAN: new Voice VLAN 30.
Do not change the current data VLAN used by each PC.
Make use of the interface range command to reduce typing.
Assumptions:
All device interfaces shown in the lab are up and working.
The path from the existing PCs to the existing router (as default gateway) is working, but the router is not shown in the figure.
Trunking is configured and operational between the switches.
All switches use VTP transparent mode.
VLANs 20, and 30 already exist and are enabled on all four switches.


## Initial Configuration

Examples 1, 2, 3, and 4 show the beginning configuration state of Dist1, Dist2, Access1, and Access2.

    hostname Dist1
    !
    vtp mode transparent
    !
    vlan 20,30
    !
    interface GigabitEthernet1/1/1
     switchport mode trunk
    !
    interface GigabitEthernet1/1/2
     switchport mode trunk
    !
    interface GigabitEthernet1/1/3
     switchport mode trunk

#### Example 1: Dist1 Config

    hostname Dist2
    !
    vtp mode transparent
    !
    vlan 20,30
    !
    interface GigabitEthernet1/1/1
     switchport mode trunk
    !
    interface GigabitEthernet1/1/2
     switchport mode trunk
    !
    interface GigabitEthernet1/1/3
     switchport mode trunk

#### Example 2: Dist2 Config

    hostname Access1
    !
    vtp mode transparent
    !
    vlan 20,30
    !
    interface GigabitEthernet1/1/1
     switchport mode trunk
    !
    interface GigabitEthernet1/1/2
     switchport mode trunk
    !
    interface GigabitEthernet1/0/1
     switchport access vlan 20
    !
    interface GigabitEthernet1/0/2
     switchport access vlan 20
    !
    interface GigabitEthernet1/0/3
     switchport access vlan 20
    !
    interface GigabitEthernet1/0/4
     switchport access vlan 20

#### Example 3: Access1 Config

    hostname Access2
    !
    vtp mode transparent
    !
    vlan 20,30
    !
    !
    interface GigabitEthernet1/1/1
     switchport mode trunk
    !
    interface GigabitEthernet1/1/2
     switchport mode trunk
    !
    interface GigabitEthernet1/0/1
     switchport access vlan 20
    !
    interface GigabitEthernet1/0/2
     switchport access vlan 20
    !
    interface GigabitEthernet1/0/3
     switchport access vlan 20
    !
    interface GigabitEthernet1/0/4
     switchport access vlan 20

#### Example 4: Access2 Config


```
Access1>en
Access1#show vlan b

VLAN Name                             Status    Ports
---- -------------------------------- --------- -------------------------------
1    default                          active    Gig1/0/5, Gig1/0/6, Gig1/0/7, Gig1/0/8
                                                Gig1/0/9, Gig1/0/10, Gig1/0/11, Gig1/0/12
                                                Gig1/0/13, Gig1/0/14, Gig1/0/15, Gig1/0/16
                                                Gig1/0/17, Gig1/0/18, Gig1/0/19, Gig1/0/20
                                                Gig1/0/21, Gig1/0/22, Gig1/0/23, Gig1/0/24
                                                Gig1/1/3, Gig1/1/4
20   VLAN0020                         active    Gig1/0/1, Gig1/0/2, Gig1/0/3, Gig1/0/4
30   VLAN0030                         active
1002 fddi-default                     active
1003 token-ring-default               active
1004 fddinet-default                  active
1005 trnet-default                    active
Access1#show int g1/0/1 sw
Name: Gig1/0/1
Switchport: Enabled
Administrative Mode: dynamic auto
Operational Mode: static access
Administrative Trunking Encapsulation: dot1q
Operational Trunking Encapsulation: native
Negotiation of Trunking: On
Access Mode VLAN: 20 (VLAN0020)
Trunking Native Mode VLAN: 1 (default)
Voice VLAN: none
Administrative private-vlan host-association: none
Administrative private-vlan mapping: none
Administrative private-vlan trunk native VLAN: none
Administrative private-vlan trunk encapsulation: dot1q
Administrative private-vlan trunk normal VLANs: none
Administrative private-vlan trunk private VLANs: none
Operational private-vlan: none
Trunking VLANs Enabled: All
Pruning VLANs Enabled: 2-1001
Capture Mode Disabled
Capture VLANs Allowed: ALL
Protected: false
Appliance trust: none


Access1#conf t
Enter configuration commands, one per line.  End with CNTL/Z.
Access1(config)#int r g1/0/1-4
Access1(config-if-range)#switchport voice vlan 30
Access1(config-if-range)#do sh int st
Port      Name               Status       Vlan       Duplex  Speed Type
Gig1/0/1                     connected    20         auto    auto  10/100BaseTX
Gig1/0/2                     connected    20         auto    auto  10/100BaseTX
Gig1/0/3                     connected    20         auto    auto  10/100BaseTX
Gig1/0/4                     connected    20         auto    auto  10/100BaseTX
Gig1/0/5                     notconnect   1          auto    auto  10/100BaseTX
Gig1/0/6                     notconnect   1          auto    auto  10/100BaseTX
Gig1/0/7                     notconnect   1          auto    auto  10/100BaseTX
Gig1/0/8                     notconnect   1          auto    auto  10/100BaseTX
Gig1/0/9                     notconnect   1          auto    auto  10/100BaseTX
Gig1/0/10                    notconnect   1          auto    auto  10/100BaseTX
Gig1/0/11                    notconnect   1          auto    auto  10/100BaseTX
Gig1/0/12                    notconnect   1          auto    auto  10/100BaseTX
Gig1/0/13                    notconnect   1          auto    auto  10/100BaseTX
Gig1/0/14                    notconnect   1          auto    auto  10/100BaseTX
Gig1/0/15                    notconnect   1          auto    auto  10/100BaseTX
Gig1/0/16                    notconnect   1          auto    auto  10/100BaseTX
Gig1/0/17                    notconnect   1          auto    auto  10/100BaseTX
Gig1/0/18                    notconnect   1          auto    auto  10/100BaseTX
Gig1/0/19                    notconnect   1          auto    auto  10/100BaseTX
Gig1/0/20                    notconnect   1          auto    auto  10/100BaseTX
Gig1/0/21                    notconnect   1          auto    auto  10/100BaseTX

Access1(config-if-range)#do sh vlan b

VLAN Name                             Status    Ports
---- -------------------------------- --------- -------------------------------
1    default                          active    Gig1/0/5, Gig1/0/6, Gig1/0/7, Gig1/0/8
                                                Gig1/0/9, Gig1/0/10, Gig1/0/11, Gig1/0/12
                                                Gig1/0/13, Gig1/0/14, Gig1/0/15, Gig1/0/16
                                                Gig1/0/17, Gig1/0/18, Gig1/0/19, Gig1/0/20
                                                Gig1/0/21, Gig1/0/22, Gig1/0/23, Gig1/0/24
                                                Gig1/1/3, Gig1/1/4
20   VLAN0020                         active    Gig1/0/1, Gig1/0/2, Gig1/0/3, Gig1/0/4
30   VLAN0030                         active    Gig1/0/1, Gig1/0/2, Gig1/0/3, Gig1/0/4
1002 fddi-default                     active
1003 token-ring-default               active
1004 fddinet-default                  active
1005 trnet-default                    active
Access1(config-if-range)#
Access1(config-if-range)#
Access1(config-if-range)#
```

