# [clab114](https://www.certskills.com/clab114/)

![](../images/clab114_img2.svg)

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

[Download this lab’s Packet Tracer File](https://files.certskills.com/virl/clab114.pkt)

#### Option 3: Cisco Modeling Labs

You can also implement the lab using [Cisco Modeling Labs – Personal (CML-P)](https://developer.cisco.com/modeling-labs/). CML-P (or simply CML) replaced Cisco [Virtual Internet Routing Lab (VIRL)](https://virl.cisco.com/) software in 2020, in effect serving as VIRL Version 2.

If you prefer to use CML, use a similar workflow as you would use if using Cisco Packet Tracer, as follows:

1. Download the CML file (filetype .yaml) linked below.
2. Import the lab’s CML file into CML and then start the lab.
3. Compare the lab topology and interface IDs to this lab, as they may differ (more detail below).
4. Add your planned configuration to the lab.
5. Test the configuration using some of the suggestions below.

[Download this lab’s CML file!](https://files.certskills.com/virl/clab114.yaml)

#### Network Device Info:

This table lists the interfaces used in the lab exercise documentation that differ from those used in the sample CML file.

| **Device** | **Lab Port** | **CML Port** |
| --- | --- | --- |
| Dist1 | G1/1/1 | G0/1 |
| Dist1 | G1/1/2 | G0/2 |
| Dist1 | G1/1/3 | G0/3 |
| Dist2 | G1/1/1 | G0/1 |
| Dist2 | G1/1/2 | G0/2 |
| Dist2 | G1/1/3 | G0/3 |
| Access1 | G1/1/1 | G0/1 |
| Access1 | G1/1/2 | G0/2 |
| Access2 | G1/1/1 | G0/1 |
| Access2 | G1/1/2 | G0/2 |

# Lab Answers Below: Spoiler Alert

---

## Answers

#### ![](../images/clab114_img1.svg)

#### Figure 1: Original Topology without IP Phones

![](../images/clab114_img2.svg)

#### Figure 2: New Topology with IP Phones

    interface range GigabitEthernet1/0/1-4
     switchport voice vlan 30

#### Example 1: Access1 Config

    interface range GigabitEthernet1/0/1-4
     switchport voice vlan 30

#### Example 2: Access2 Config