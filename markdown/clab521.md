# [clab521](https://www.certskills.com/clab521/)

![](../images/clab521_img1.svg)

## Initial Configuration

Example 1 and 2 show the beginning configuration state of R1 and R2.

    hostname R1
    !
    interface GigabitEthernet0/1
     no shutdown
     ip address 192.168.4.1 255.255.255.240
    !
    interface GigabitEthernet0/2
     no shutdown
     ip address 192.168.4.129 255.255.255.240

#### Example 1: R1 Config

    hostname R2
    !
    interface GigabitEthernet0/1
     no shutdown
     ip address 192.168.4.2 255.255.255.240
    !
    interface GigabitEthernet0/2
     no shutdown
     ip address 192.168.2.193 255.255.255.240

#### Example 2: R2 Config

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

[Download this lab’s Packet Tracer File](https://files.certskills.com/virl/clab521.pkt)

#### Option 3: Cisco Modeling Labs

You can also implement the lab using [Cisco Modeling Labs – Personal (CML-P)](https://developer.cisco.com/modeling-labs/). CML-P (or simply CML) replaced Cisco [Virtual Internet Routing Lab (VIRL)](https://virl.cisco.com/) software in 2020, in effect serving as VIRL Version 2.

If you prefer to use CML, use a similar workflow as you would use if using Cisco Packet Tracer, as follows:

1. Download the CML file (filetype .yaml) linked below.
2. Import the lab’s CML file into CML and then start the lab.
3. Compare the lab topology and interface IDs to this lab, as they may differ (more detail below).
4. Add your planned configuration to the lab.
5. Test the configuration using some of the suggestions below.

[Download this lab’s CML file!](https://files.certskills.com/virl/clab521.yaml)

#### Network Device Info:

The CML topology matches the lab topology.



### Config Lab Intro Video

<iframe id="iframe-player-14" data-id="14" class="youtube-player" width="1140" height="642" src="https://www.youtube.com/embed/TE_lk-ZciLU?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en-US&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe>

The above lab intro – the text, figures, and initial configuration – tells you all you need to know. But if you want a little more, with a little different slant on what to do in this lab, watch this lab intro video!

# Lab Answers Below: Spoiler Alert

---

## Answers

#### ![](../images/clab521_img1.svg)

#### Figure 1: Two Routers with IP Subnets

## Scenario 1

First, here are the answers for Scenario 1:

    router ospf 20
     router-id 1.1.1.1
     network 192.168.4.0 0.0.0.255 area 0

#### Example 3: R1 Config

    router ospf 20
     router-id 2.2.2.2
     network 192.168.4.0 0.0.0.255 area 0
     network 192.168.2.0 0.0.0.255 area 0

#### Example 4: R2 Config

## Scenario 2

And here are the answers for Scenario 2:

    router ospf 20
     router-id 1.1.1.1
     network 192.168.4.0 0.0.0.15 area 0
     network 192.168.4.128 0.0.0.15 area 0

#### Example 5: R1 Config, Scenario 2

    router ospf 20
     router-id 2.2.2.2
     network 192.168.4.0 0.0.0.15 area 0
     network 192.168.2.192 0.0.0.15 area 0

#### Example 6: R2 Config, Scenario 2