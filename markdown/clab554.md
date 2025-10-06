# [clab554](https://www.certskills.com/clab554/)

![](../images/clab554_img1.svg)

## Initial Configuration

Examples 1, 2, 3, and 4 show the beginning configuration state of Dist1, Dist2, Access1, and Access2.

    hostname Dist1
    !
    interface GigabitEthernet1/1/1
     no shutdown
    !
    interface GigabitEthernet1/1/2
     no shutdown
    !
    interface GigabitEthernet1/1/3
     no shutdown
     switchport trunk encapsulation dot1q
     switchport mode trunk
    !
    router ospf 1
     network 0.0.0.0 255.255.255.255 area 0

#### Example 1: Dist1 Config

    hostname Dist2
    !
    interface GigabitEthernet1/1/1
     no shutdown
    !
    interface GigabitEthernet1/1/2
     no shutdown
    !
    interface GigabitEthernet1/1/3
     no shutdown
     switchport trunk encapsulation dot1q
     switchport mode trunk
    !
    router ospf 1
     network 0.0.0.0 255.255.255.255 area 0 

#### Example 2: Dist2 Config

    hostname Access1
    !
    vlan 10,20
    !
    interface GigabitEthernet1/1/1
     no shutdown
     switchport trunk encapsulation dot1q
     switchport mode trunk
    !
    interface GigabitEthernet1/0/2
     no shutdown
     switchport access vlan 10
    !
    interface GigabitEthernet1/0/3
     no shutdown
     switchport access vlan 20

#### Example 3: Access1 Config

    hostname Access2
    !
    vlan 30,40
    !
    interface GigabitEthernet1/1/1
     no shutdown
     switchport trunk encapsulation dot1q
     switchport mode trunk
    !
    interface GigabitEthernet1/0/2
     no shutdown
     switchport access vlan 30
    !
    interface GigabitEthernet1/0/3
     no shutdown
     switchport access vlan 40

#### Example 4: Access2 Config

## Answer Options - Click Tabs to Reveal

- Option 1: Paper/Editor
- Option 2: Cisco Packet Tracer
- Option 3: Cisco Modeling Labs

#### Option 1: Paper/Editor

You can learn a lot and strengthen real learning of the topics by creating the configuration – even without a router or switch CLI. In fact, these labs were originally built to be used solely as a paper exercise!

To answer, just think about the lab. Refer to your primary learning material for CCNA, your notes, and create the configuration on paper or in a text editor. Then check your answer versus the answer post, which is linked at the bottom of the lab, just above the comments section.

#### Option 2: Cisco Packet Tracer

You can also implement the lab using the Cisco Packet Tracer network simulator. With this option, you use Cisco’s free Packet Tracer simulator. You open a file that begins with the initial configuration already loaded. Then you implement your configuration and test to determine if it met the requirements of the lab.

[(Use this link for more information about Cisco Packet Tracer.](https://www.certskills.com/packettracer))

Use this workflow to do the labs in Cisco Packet Tracer:

1. Download the .pkt file linked below.
2. Open the .pkt file, creating a working lab with the same topology and interfaces as the lab exercise.
3. Add your planned configuration to the lab.
4. Test the configuration using some of the suggestions below.

[Download this lab’s Packet Tracer File](https://files.certskills.com/virl/clab554.pkt)

#### Option 3: Cisco Modeling Labs

You can also implement the lab using [Cisco Modeling Labs – Personal (CML-P)](https://developer.cisco.com/modeling-labs/). CML-P (or simply CML) replaced Cisco [Virtual Internet Routing Lab (VIRL)](https://virl.cisco.com/) software in 2020, in effect serving as VIRL Version 2.

If you prefer to use CML, use a similar workflow as you would use if using Cisco Packet Tracer, as follows:

1. Download the CML file (filetype .yaml) linked below.
2. Import the lab’s CML file into CML and then start the lab.
3. Compare the lab topology and interface IDs to this lab, as they may differ (more detail below).
4. Add your planned configuration to the lab.
5. Test the configuration using some of the suggestions below.

[Download this lab’s CML file!](https://files.certskills.com/virl/clab554.yaml)

#### Network Device Info:

This table lists the interfaces listed in the lab exercise documentation versus those used in the sample CML file.

| **Device** | **Lab Port** | **CML Port** |
| --- | --- | --- |
| Dist1 | G1/1/1 | G0/1 |
| Dist1 | G1/1/2 | G0/2 |
| Dist1 | G1/1/3 | G0/3 |
| Dist2 | G1/1/1 | G0/1 |
| Dist2 | G1/1/2 | G0/2 |
| Dist2 | G1/1/3 | G0/3 |
| Access1 | G1/1/1 | G0/1 |
| Access1 | G1/0/2 | G0/2 |
| Access1 | G1/0/3 | G0/3 |
| Access2 | G1/1/1 | G0/1 |
| Access2 | G1/0/2 | G0/2 |
| Access2 | G1/0/3 | G0/3 |

#### Host device info:

This table lists host information pre-configured in CML, information that might not be required by the lab but may be useful to you.

| **Device** | **IP Address** | **User/password** |
| --- | --- | --- |
| PC1 | 10.100.100.2/27 | cisco/cisco |
| PC2 | 10.100.100.34/27 | cisco/cisco |
| PC3 | 10.100.100.66/27 | cisco/cisco |
| PC4 | 10.100.100.98/27 | cisco/cisco |

# Lab Answers Below: Spoiler Alert

---

## Answers

![](../images/clab554_img1.svg)

#### Figure 1: Switch Square w/L3 EtherChannel Topology

    ip routing
    !
    vlan 10,20
    !
    interface Port-Channel10
     no switchport
     ip address 100.1.2.1 255.255.255.240
    !
    interface GigabitEthernet1/1/1
     no switchport
     channel-group 10 mode on
    !
    interface GigabitEthernet1/1/2
     no switchport
     channel-group 10 mode on
    !
    interface Vlan10
     ip address 10.100.100.1 255.255.255.224
     no shutdown
    !
    interface Vlan20
     ip address 10.100.100.33 255.255.255.224
     no shutdown

#### Example 5: Dist1 Config

    ip routing
    !
    vlan 30,40
    !
    interface Port-Channel10
     no switchport
     ip address 100.1.2.14 255.255.255.240
    !
    interface GigabitEthernet1/1/1
     no switchport
     channel-group 10 mode on
    !
    interface GigabitEthernet1/1/2
     no switchport
     channel-group 10 mode on
    !
    interface Vlan30
     ip address 10.100.100.65 255.255.255.224
     no shutdown
    !
    interface Vlan40
     ip address 10.100.100.97 255.255.255.224
     no shutdown

#### Example 6: Dist2 Config