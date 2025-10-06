# [clab133](https://www.certskills.com/clab133/)

![](../images/clab133_img1.svg)

## Initial Configuration

Examples 1, 2, 3, and 4 show the beginning configuration state of R1, R2, R3, and R4. All five switches are layer 2 switches with all default configuration, which places all interfaces on the same switch into VLAN1.

    hostname R1
    !
    ipv6 unicast-routing
    !
    interface GigabitEthernet0/1
     ipv6 address 2000::1/64
     no shutdown
    !
    interface GigabitEthernet0/2
     ipv6 address 2001::1/64
     no shutdown

#### Example 1: R1 Config

    hostname R2
    !
    ipv6 unicast-routing
    !
    interface GigabitEthernet0/1
     ipv6 address 2000::2/64
     no shutdown
    !
    interface GigabitEthernet0/2
     ipv6 address 2002::1/64
     no shutdown

#### Example 2: R2 Config

    hostname R3
    !
    ipv6 unicast-routing
    !
    interface GigabitEthernet0/1
     ipv6 address 2000::3/64
     no shutdown
    !
    interface GigabitEthernet0/2
     ipv6 address 2003::1/64
     no shutdown

#### Example 3: R3 Config

    hostname R4
    !
    ipv6 unicast-routing
    !
    interface GigabitEthernet0/1
     ipv6 address 2000::4/64
     no shutdown
    !
    interface GigabitEthernet0/2
     ipv6 address 2004::1/64
     no shutdown

#### Example 4: R4 Config

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

[Download this lab’s Packet Tracer File](https://files.certskills.com/virl/clab133.pkt)

#### Option 3: Cisco Modeling Labs

You can also implement the lab using [Cisco Modeling Labs – Personal (CML-P)](https://developer.cisco.com/modeling-labs/). CML-P (or simply CML) replaced Cisco [Virtual Internet Routing Lab (VIRL)](https://virl.cisco.com/) software in 2020, in effect serving as VIRL Version 2.

If you prefer to use CML, use a similar workflow as you would use if using Cisco Packet Tracer, as follows:

1. Download the CML file (filetype .yaml) linked below.
2. Import the lab’s CML file into CML and then start the lab.
3. Compare the lab topology and interface IDs to this lab, as they may differ (more detail below).
4. Add your planned configuration to the lab.
5. Test the configuration using some of the suggestions below.

[Download this lab’s CML file!](https://files.certskills.com/virl/clab133.yaml)

#### Network Device Info:

Interfaces used in CML match the interfaces used in the Lab topology.

#### Host device info:

The CML topology matches the lab topology.

| **Device** | **IP Address** | **Mac Address** | **User/password** |
| --- | --- | --- | --- |
| PC1 | 2001::100/64 | 02:00:11:11:11:11 | cisco/cisco |
| PC2 | 2002::100/64 | 02:00:22:22:22:22 | cisco/cisco |
| PC3 | 2003::100/64 | 02:00:33:33:33:33 | cisco/cisco |
| PC4 | 2004::100/64 | 02:00:44:44:44:44 | cisco/cisco |

# Lab Answers Below: Spoiler Alert

---

## Answers

![](../images/clab133_img1.svg)

#### Figure 1: Four Routers and Five Switches

    ipv6 route 2002::/64 2000::2
    ipv6 route 2003::/64 2000::3
    ipv6 route 2004::/64 2000::4

#### Example 1: R1 Config

    ipv6 route 2001::/64 2000::1
    ipv6 route 2003::/64 2000::3
    ipv6 route 2004::/64 2000::4

#### Example 2: R2 Config

    ipv6 route 2001::/64 2000::1
    ipv6 route 2002::/64 2000::2
    ipv6 route 2004::/64 2000::4

#### Example 3: R3 Config

    ipv6 route 2001::/64 2000::1
    ipv6 route 2002::/64 2000::2
    ipv6 route 2003::/64 2000::3

#### Example 4: R4 Config