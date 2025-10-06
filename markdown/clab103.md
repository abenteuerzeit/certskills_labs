# [clab103](https://www.certskills.com/clab103/)

![](../images/clab103_img1.svg)

## Initial Configuration

This lab begins with a switch that has been configured to allow both Telnet and SSH into the switch, both using a simple IP address. The management IP address and the CLI access passwords for user mode and enable mode have been set. Example 1 shows that configuration.

    hostname SW1
    enable secret 0 certskills
    !
    ip default-gateway 10.1.1.1
    !
    interface vlan1
     ip address 10.1.1.20 255.255.255.0
     no shutdown
    !
    line vty 0 4
     password certskills
     login
    !
    line vty 5 15
     password certskills
     login

#### Example 1: SW1 Initial Config

\* Note that the **no shutdown** command is likely unnecessary on real gear, but may be on some virtualization platforms, so we include it here in the initial configuration.

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

[Download this lab’s Packet Tracer File](https://files.certskills.com/virl/clab103.pkt)

#### Option 3: Cisco Modeling Labs

You can also implement the lab using [Cisco Modeling Labs – Personal (CML-P)](https://developer.cisco.com/modeling-labs/). CML-P (or simply CML) replaced Cisco [Virtual Internet Routing Lab (VIRL)](https://virl.cisco.com/) software in 2020, in effect serving as VIRL Version 2.

If you prefer to use CML, use a similar workflow as you would use if using Cisco Packet Tracer, as follows:

1. Download the CML file (filetype .yaml) linked below.
2. Import the lab’s CML file into CML and then start the lab.
3. Compare the lab topology and interface IDs to this lab, as they may differ (more detail below).
4. Add your planned configuration to the lab.
5. Test the configuration using some of the suggestions below.

[Download this lab’s CML file!](https://files.certskills.com/virl/clab103.yaml)

#### Network Device Info:

This table lists the interfaces listed in the lab exercise documentation versus those used in the sample CML file.

| **Device** | **Lab Port** | **CML Port** |
| --- | --- | --- |
| SW1 | G0/1 | G0/1 |
| SW1 | F0/1 | G0/2 |
| SW1 | F0/2 | G0/3 |

#### Host device info:

This table lists host information pre-configured in CML, information that might not be required by the lab but may be useful to you.

| **Device** | **IP Address** | **Mac Address** | **User/password** |
| --- | --- | --- | --- |
| PC | 10.1.1.11 | 02:00:11:11:11:11 | cisco/cisco |
| S | 10.1.1.22 | 02:00:22:22:22:22 | cisco/cisco |

####

# Lab Answers Below: Spoiler Alert

---

## Answers

    ip domain-name example.com
    crypto key generate rsa modulus 1024
    !
    username Barney secret Rubble
    !
    line vty 0 15
     login local 
     transport input ssh

#### Switch Configuration