# [clab207](https://www.certskills.com/clab207/)

## Lab Requirements

This lab uses two LAN switches, connected by a link, with a router on the side.

**Figure 1 – Lab Topology**

For this lab, you need to configure passwords, plus a few other administrative settings. Note that this lab does not ask you to configure IP addressing, leaving that to other labs. However, this lab does ask you to configure the rest of the settings to prepare to allow for inbound Telnet and SSH into the switches.

The requirements are as follows.

1. On both switches, protect the console using the password “fred”.
2. On switch SW1, allow telnet but not SSH into the switch, with simple password protection without using a username. Use password “sw1”.
3. On switch SW2, allow both telnet and SSH into the switch, with both a username and password. You can choose the actual username and password.
4. On both SW1 and SW2, do not yet configure IP details; defer that work until the router folks tell you what IP addresses to use.
5. Give each switch a hostname to match the figure.
6. For each interface used in the lab, document the device’s name on the other end of the link connected to the interface. For instance, for SW1, port G1/0/1, document that “PC1” is on the other end of the link.
7. On switch SW1, protect privileged mode using the older style (and easier to break) password. Make this password “sw1bad”.
8. On switch SW2, protect privileged mode using the newer style (and more secure) password that uses MD5 encoding. Make this password “sw2good”.

## Initial Configuration

This lab begins with a pretty clean slate. Here are the notes for the initial state:

- The router has been configured already and is working.
- The router is connected to other links, not shown; those links are completely unimportant to the lab.
- The two LAN switches have no configuration; just before this lab, their config was erased, and the switches were reloaded.
- This lab avoids VLAN and VLAN trunk topics to keep the focus on passwords and Telnet/SSH. So, the link between the two switches is not a VLAN trunk, and only the default VLAN (VLAN 1) is in use.

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

[Download this lab’s Packet Tracer File](https://files.certskills.com/virl/clab207.pkt)

#### Option 3: Cisco Modeling Labs

You can also implement the lab using [Cisco Modeling Labs – Personal (CML-P)](https://developer.cisco.com/modeling-labs/). CML-P (or simply CML) replaced Cisco [Virtual Internet Routing Lab (VIRL)](https://virl.cisco.com/) software in 2020, in effect serving as VIRL Version 2.

If you prefer to use CML, use a similar workflow as you would use if using Cisco Packet Tracer, as follows:

1. Download the CML file (filetype .yaml) linked below.
2. Import the lab’s CML file into CML and then start the lab.
3. Compare the lab topology and interface IDs to this lab, as they may differ (more detail below).
4. Add your planned configuration to the lab.
5. Test the configuration using some of the suggestions below.

[Download this lab’s CML file!](https://files.certskills.com/virl/clab207.yaml)

#### Network Device Info:

This table lists the interfaces listed in the lab exercise documentation versus those used in the sample CML file.

| **Device** | **Lab Port** | **CML Port** |
| --- | --- | --- |
| SW1 | G1/0/1 | G2/1 |
| SW1 | G1/0/2 | G2/2 |
| SW1 | G1/0/3 | G2/3 |
| SW1 | G1/0/11 | G1/1 |
| SW2 | G1/0/4 | G3/1 |
| SW2 | G1/0/5 | G3/2 |
| SW2 | G1/0/6 | G3/3 |
| SW2 | G1/0/7 | G0/1 |
| SW2 | G1/0/12 | G1/2 |

# Lab Answers Below: Spoiler Alert