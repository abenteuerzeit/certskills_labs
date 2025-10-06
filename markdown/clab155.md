# [clab155](https://www.certskills.com/clab155/)

![](../images/clab155_img1.svg)

## Initial Configuration

Examples 1, 2, 3, and 4 show the beginning configuration state of R1, R2, SW1, and SW2.

    hostname R1
    !
    interface GigabitEthernet0/1
     ip address 192.168.1.1 255.255.255.252
     no shutdown
    !
    interface GigabitEthernet0/2
     no shutdown
    !
    interface GigabitEthernet0/2.1
     encapsulation dot1q 10
     ip address 10.0.1.1 255.255.255.192
    !
    interface GigabitEthernet0/2.2
     encapsulation dot1q 20
     ip address 10.0.1.65 255.255.255.192
    !
    interface GigabitEthernet0/2.3
     encapsulation dot1q 30
     ip address 10.0.1.129 255.255.255.128
    !
    router ospf 1
     network 0.0.0.0 255.255.255.255 area 0

#### Example 1: R1 Config

    hostname R2
    !
    interface GigabitEthernet0/1
     ip address 192.168.1.2 255.255.255.252
     no shutdown
    !
    interface GigabitEthernet0/2
     no shutdown
    !
    interface GigabitEthernet0/2.1
     encapsulation dot1q 10
     ip address 20.0.1.1 255.255.255.0
    !
    interface GigabitEthernet0/2.2
     encapsulation dot1q 20
     ip address 20.0.2.1 255.255.255.0
    !
    interface GigabitEthernet0/2.3
     encapsulation dot1q 30
     ip address 20.0.3.1 255.255.255.0
    !
    router ospf 1
     network 0.0.0.0 255.255.255.255 area 0

#### Example 2: R2 Config

    hostname SW1
    !
    vlan 10,20,30
    !
    interface GigabitEthernet1/0/1
     switchport trunk encapsulation dot1q
     switchport mode trunk
     no shutdown
    !
    interface GigabitEthernet1/0/2
     switchport access vlan 10
    !
    interface GigabitEthernet1/0/3
     switchport access vlan 20
    !
    interface GigabitEthernet1/0/4
     switchport access vlan 30

#### Example 3: SW1 Config

    hostname SW2
    !
    vlan 10,20,30
    !
    interface GigabitEthernet1/0/1
     switchport trunk encapsulation dot1q
     switchport mode trunk
     no shutdown
    !
    interface GigabitEthernet1/0/2
     switchport access vlan 10
    !
    interface GigabitEthernet1/0/3
     switchport access vlan 20
    !
    interface GigabitEthernet1/0/4
     switchport access vlan 30

#### Example 4: SW2 Config

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

[Download this lab’s Packet Tracer File](https://files.certskills.com/virl/clab155.pkt)

#### Option 3: Cisco Modeling Labs

You can also implement the lab using [Cisco Modeling Labs – Personal (CML-P)](https://developer.cisco.com/modeling-labs/). CML-P (or simply CML) replaced Cisco [Virtual Internet Routing Lab (VIRL)](https://virl.cisco.com/) software in 2020, in effect serving as VIRL Version 2.

If you prefer to use CML, use a similar workflow as you would use if using Cisco Packet Tracer, as follows:

1. Download the CML file (filetype .yaml) linked below.
2. Import the lab’s CML file into CML and then start the lab.
3. Compare the lab topology and interface IDs to this lab, as they may differ (more detail below).
4. Add your planned configuration to the lab.
5. Test the configuration using some of the suggestions below.

[Download this lab’s CML file!](https://files.certskills.com/virl/clab155.yaml)

#### Network Device Info:

This table lists the interfaces used in the lab exercise documentation that differ from those used in the sample CML file.

| **Device** | **Lab Port** | **CML Port** |
| --- | --- | --- |
| SW1 | G1/0/1 | G0/1 |
| SW1 | G1/0/2 | G0/2 |
| SW1 | G1/0/3 | G0/3 |
| SW1 | G1/0/4 | G1/0 |
| SW2 | G1/0/1 | G0/1 |
| SW2 | G1/0/2 | G0/2 |
| SW2 | G1/0/3 | G0/3 |
| SW2 | G1/0/4 | G1/0 |

# Lab Answers Below: Spoiler Alert

---

## Answers

![](../images/clab155_img1.svg)

#### Figure 1: Two Router ROAS Topology

    interface GigabitEthernet0/2.1
     ip access-group ThisACL out
    !
    interface GigabitEthernet0/2.2
     ip access-group ThisACL out
    !
    interface GigabitEthernet0/2.3
     ip access-group ThisACL out
    !
    ip access-list standard ThisACL
     deny 10.0.1.0 0.0.0.127
     deny 10.0.1.254
     permit any

#### Example 5: R2 Config