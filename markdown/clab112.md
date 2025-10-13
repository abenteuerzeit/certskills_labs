# [clab112](https://www.certskills.com/clab112/)

![](../images/clab112_img1.svg)

## Requirements

For this lab, we will place two of the GigabitEthernet ports on switch SW1 into VLAN 10 and two other GigabitEthernet ports into VLAN 20, creating two separate broadcast domains on the switch. VLAN 10 will be labeled “office,” and VLAN 20 will be labeled “research.”

> VLANs help reduce CPU overhead on a switch by limiting the ports that receive a broadcast frame. They also enhance security by limiting traffic flow.

The specific rules for this lab are as follows:

1. On Switch SW1, create VLAN 10 and name the VLAN “Office.” Create VLAN 20 and name the VLAN “Research.”
2. Configure GigabitEthernet ports 1/0/1 and 1/0/2 into VLAN 10.
3. Configure GigabitEthernet ports 1/0/3 and 1/0/4 into VLAN 20.

## Initial Configuration

All ports are currently set to their default settings, other than the switch has a **hostname SW1** command configured.

```
SW1>en
SW1#conf t
Enter configuration commands, one per line.  End with CNTL/Z.
SW1(config)#vlan 10
SW1(config-vlan)#name Office
SW1(config-vlan)#vlan 20
SW1(config-vlan)#name Research
SW1(config-vlan)#do sh int st
Port      Name               Status       Vlan       Duplex  Speed Type
Gig1/0/1                     connected    1          auto    auto  10/100BaseTX
Gig1/0/2                     connected    1          auto    auto  10/100BaseTX
Gig1/0/3                     connected    1          auto    auto  10/100BaseTX
Gig1/0/4                     connected    1          auto    auto  10/100BaseTX
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
Gig1/0/22                    notconnect   1          auto    auto  10/100BaseTX
Gig1/0/23                    notconnect   1          auto    auto  10/100BaseTX
Gig1/0/24                    notconnect   1          auto    auto  10/100BaseTX
Gig1/1/1                     notconnect   1          auto    auto  10/100BaseTX
Gig1/1/2                     notconnect   1          auto    auto  10/100BaseTX
Gig1/1/3                     notconnect   1          auto    auto  10/100BaseTX
Gig1/1/4                     notconnect   1          auto    auto  10/100BaseTX

SW1(config-vlan)#
SW1(config-vlan)#int r g1/0/1-2
SW1(config-if-range)#switchport mode access
SW1(config-if-range)#switchport access vlan 10
SW1(config-if-range)#int r g1/0/3-4
SW1(config-if-range)#switchport mode access
SW1(config-if-range)#switchport access vlan 20
SW1(config-if-range)#do show int st
Port      Name               Status       Vlan       Duplex  Speed Type
Gig1/0/1                     connected    10         auto    auto  10/100BaseTX
Gig1/0/2                     connected    10         auto    auto  10/100BaseTX
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

SW1(config-if-range)#do show vlan b

VLAN Name                             Status    Ports
---- -------------------------------- --------- -------------------------------
1    default                          active    Gig1/0/5, Gig1/0/6, Gig1/0/7, Gig1/0/8
                                                Gig1/0/9, Gig1/0/10, Gig1/0/11, Gig1/0/12
                                                Gig1/0/13, Gig1/0/14, Gig1/0/15, Gig1/0/16
                                                Gig1/0/17, Gig1/0/18, Gig1/0/19, Gig1/0/20
                                                Gig1/0/21, Gig1/0/22, Gig1/0/23, Gig1/0/24
                                                Gig1/1/1, Gig1/1/2, Gig1/1/3, Gig1/1/4
10   Office                           active    Gig1/0/1, Gig1/0/2
20   Research                         active    Gig1/0/3, Gig1/0/4
1002 fddi-default                     active
1003 token-ring-default               active
1004 fddinet-default                  active
1005 trnet-default                    active
SW1(config-if-range)#
```


> Creating VLANs on a switch is as simple as typing vlan vlan-id, where vlan-id is a number of your choice. Once the vlan vlan-id command is entered, the switch will immediately create the VLAN and move you to VLAN configuration mode. The name subcommand in VLAN configuration mode can then be used to give the VLAN any name that you would like. This example shows the two VLANs being created with two vlan global commands, each followed by a command to name the VLANs.
>Each port needs to be assigned to the correct VLAN per the requirements and figure. The switchport access vlan vlan-id command makes that assignment.
>Finally, this configuration does not include the switchport mode access command, but you would likely also add that command to each port. The lab did not comment on whether the configuration should ensure each port acts as an access port. As shown here, each port could negotiate VLAN trunking. With the switchport mode access command on a port, it would operate only as an access port and use the VLAN as defined in the switchport access vlan command.
