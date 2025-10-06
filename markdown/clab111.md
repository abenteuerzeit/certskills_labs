# [clab111](https://www.certskills.com/clab111/)

![](../images/clab111_img1.svg)

## Initial Configuration

Examples 1, 2, 3, and 4 show the beginning configuration state of R1, R2, SW1, and SW2.

    hostname R1
    !
    interface GigabitEthernet0/1
     ip address 10.10.10.1 255.255.255.252
     no shutdown
    !
    interface GigabitEthernet0/2
     ip address 20.20.20.1 255.255.255.0
     no shutdown
    !
    router ospf 1
     network 0.0.0.0 255.255.255.255 area 0

#### Example 1: R1 Config

    hostname R2
    !
    interface GigabitEthernet0/1
     ip address 10.10.10.2 255.255.255.252
     no shutdown
    !
    interface GigabitEthernet0/2
     ip address 30.30.30.1 255.255.255.0
     no shutdown
    !
    router ospf 1
     network 0.0.0.0 255.255.255.255 area 0

#### Example 2: R2 Config

    hostname SW1
    !
    interface vlan 1
     ip address 20.20.20.10 255.255.255.0
     no shutdown
    !
    ip default-gateway 20.20.20.1

#### Example 3: SW1 Config

    hostname SW2
    !
    interface vlan 1
     ip address 30.30.30.10 255.255.255.0
     no shutdown
    !
    ip default-gateway 30.30.30.1

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

[Download this lab’s Packet Tracer File](https://files.certskills.com/virl/clab111.pkt)

#### Option 3: Cisco Modeling Labs

You can also implement the lab using [Cisco Modeling Labs – Personal (CML-P)](https://developer.cisco.com/modeling-labs/). CML-P (or simply CML) replaced Cisco [Virtual Internet Routing Lab (VIRL)](https://virl.cisco.com/) software in 2020, in effect serving as VIRL Version 2.

If you prefer to use CML, use a similar workflow as you would use if using Cisco Packet Tracer, as follows:

1. Download the CML file (filetype .yaml) linked below.
2. Import the lab’s CML file into CML and then start the lab.
3. Compare the lab topology and interface IDs to this lab, as they may differ (more detail below).
4. Add your planned configuration to the lab.
5. Test the configuration using some of the suggestions below.

[Download this lab’s CML file!](https://files.certskills.com/virl/clab111.yaml)

#### Network Device Info:

All interfaces in the topology match the lab figure.

# Lab Answers Below: Spoiler Alert

---

## Answers

#### ![](../images/clab111_img1.svg)

#### Figure 1: Network Topology and Addresses

    username person secret access
    !
    enable secret ccnaskills
    !
    line con 0
     password certskills
     login
    !
    line vty 0 4
     transport input telnet
     login local

#### Example 1: R1 Config

    username person secret access
    ! 
    enable secret ccnaskills
    !
    line con 0
     password certskills
     login
    !
    line vty 0 4
     transport input telnet
     login local

#### Example 2: R2 Config

    username person secret access
    !
    enable secret ccnaskills
    !
    line con 0
     password certskills
     login
    !
    line vty 0 4
     transport input telnet
     login local

#### Example 3: SW1 Config

    username person secret access
    !
    enable secret ccnaskills
    !
    line con 0
     password certskills
     login
    !
    line vty 0 4
     transport input telnet
     login local

#### Example 4: SW2 Config