# [clab116](https://www.certskills.com/clab116/)

![](../images/clab116_img1.svg)

## Initial Configuration

Examples 1, 2, 3, and 4 show the beginning configuration state of Core, Branch1, Branch2, and Branch3.

    hostname Core
    !
    interface GigabitEthernet0/0
     no shutdown
    !
    interface GigabitEthernet0/1
     no shutdown
    !
    interface GigabitEthernet0/2
     no shutdown
    !
    router ospf 1
     network 0.0.0.0 255.255.255.255 area 0

#### Example 1: Core Config

    hostname Branch1
    !
    interface GigabitEthernet0/1
     no shutdown
    !
    interface GigabitEthernet0/2
     no shutdown
    !
    router ospf 1
     network 0.0.0.0 255.255.255.255 area 0

#### Example 2: Branch1 Config

    hostname Branch2
    !
    interface GigabitEthernet0/1
     no shutdown
    !
    interface GigabitEthernet0/2
     no shutdown
    !
    router ospf 1
     network 0.0.0.0 255.255.255.255 area 0

#### Example 3: Branch2 Config

    hostname Branch3
    !
    interface GigabitEthernet0/1
     no shutdown
    !
    interface GigabitEthernet0/2
     no shutdown
    !
    router ospf 1
     network 0.0.0.0 255.255.255.255 area 0

#### Example 4: Branch3 Config

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

[Download this lab’s Packet Tracer File](https://files.certskills.com/virl/clab116.pkt)

#### Option 3: Cisco Modeling Labs

You can also implement the lab using [Cisco Modeling Labs – Personal (CML-P)](https://developer.cisco.com/modeling-labs/). CML-P (or simply CML) replaced Cisco [Virtual Internet Routing Lab (VIRL)](https://virl.cisco.com/) software in 2020, in effect serving as VIRL Version 2.

If you prefer to use CML, use a similar workflow as you would use if using Cisco Packet Tracer, as follows:

1. Download the CML file (filetype .yaml) linked below.
2. Import the lab’s CML file into CML and then start the lab.
3. Compare the lab topology and interface IDs to this lab, as they may differ (more detail below).
4. Add your planned configuration to the lab.
5. Test the configuration using some of the suggestions below.

[Download this lab’s CML file!](https://files.certskills.com/virl/clab116.yaml)

#### Network Device Info:

This table lists the interfaces used in the lab exercise documentation that differ from those used in the sample CML file.

| **Device** | **Lab Port** | **CML Port** |
| --- | --- | --- |
| Core | G0/0 | G0/3 |

# Lab Answers Below: Spoiler Alert

---

## Answers

#### ![](../images/clab116_img1.svg)

#### Figure 1: Simple Hub and Spoke Topology

    interface GigabitEthernet0/0
     ip address 172.16.1.214 255.255.255.248
    !
    interface GigabitEthernet0/1
     ip address 172.16.1.206 255.255.255.248
    !
    interface GigabitEthernet0/2
     ip address 172.16.1.198 255.255.255.248 

#### Example 1: Core Config

    interface GigabitEthernet0/1
     ip address 172.16.1.205 255.255.255.248
    !
    interface GigabitEthernet0/2
     ip address 172.16.1.62 255.255.255.192

#### Example 2: Branch1 Config

    interface GigabitEthernet0/1
     ip address 172.16.1.197 255.255.255.248
    !
    interface GigabitEthernet0/2
     ip address 172.16.1.126 255.255.255.192

#### Example 3: Branch2 Config

    interface GigabitEthernet0/1
     ip address 172.16.1.213 255.255.255.248
    !
    interface GigabitEthernet0/2
     ip address 172.16.1.190 255.255.255.192

#### Example 4: Branch3 Config