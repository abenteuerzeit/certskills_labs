# [clab130](https://www.certskills.com/clab130/)

![](../images/clab130_img1.svg)

## Initial Configuration

Examples 1, 2, 3, and 4 show the beginning configuration state of R1, R2, R3, and R4.

    hostname R1
    !
    ipv6 unicast-routing
    !
    interface GigabitEthernet0/1
     no shutdown
    !
    interface GigabitEthernet0/2
     no shutdown

#### Example 1: R1 Config

    hostname R2
    !
    ipv6 unicast-routing
    !
    interface GigabitEthernet0/1
     no shutdown
    !
    interface GigabitEthernet0/2
     no shutdown

#### Example 2: R2 Config

    hostname R3
    !
    ipv6 unicast-routing
    !
    interface GigabitEthernet0/1
     no shutdown
    !
    interface GigabitEthernet0/2
     no shutdown

#### Example 3: R3 Config

    hostname R4
    !
    ipv6 unicast-routing
    !
    interface GigabitEthernet0/1
     no shutdown
    !
    interface GigabitEthernet0/2
     no shutdown

#### Example 4: R4 Config




### Config Lab Intro Video

<iframe id="iframe-player-9" data-id="9" title="Config Lab Intro: IPv6 EUI-64 Addressing 1" width="1140" height="641" src="https://www.youtube.com/embed/qzUbOkVD_40?feature=oembed" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

The above lab intro – the text, figures, and initial configuration – tells you all you need to know. But if you want a little more, with a little different slant on what to do in this lab, watch this lab intro video!

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

[Download this lab’s Packet Tracer File](https://files.certskills.com/virl/clab130.pkt)

#### Option 3: Cisco Modeling Labs

You can also implement the lab using [Cisco Modeling Labs – Personal (CML-P)](https://developer.cisco.com/modeling-labs/). CML-P (or simply CML) replaced Cisco [Virtual Internet Routing Lab (VIRL)](https://virl.cisco.com/) software in 2020, in effect serving as VIRL Version 2.

If you prefer to use CML, use a similar workflow as you would use if using Cisco Packet Tracer, as follows:

1. Download the CML file (filetype .yaml) linked below.
2. Import the lab’s CML file into CML and then start the lab.
3. Compare the lab topology and interface IDs to this lab, as they may differ (more detail below).
4. Add your planned configuration to the lab.
5. Test the configuration using some of the suggestions below.

[Download this lab’s CML file!](https://files.certskills.com/virl/clab130.yaml)

#### Network Device Info:

The CML topology matches the lab topology.

# Lab Answers Below: Spoiler Alert

---

## Answers

![](../images/clab130_img1.svg)

#### Figure 1: EUI-64 IPv6 Addressing Topology

    interface GigabitEthernet0/1
     mac-address 0200.1234.5678
     ipv6 address 2000::/64 eui-64
    !
    interface GigabitEthernet0/2
     mac-address ac13.7294.6256
     ipv6 address 2001:BAE:274F:BAED::/64 eui-64

#### Example 5: R1 Config

    interface GigabitEthernet0/1
     mac-address c081.abed.c724
     ipv6 address 2000::/64 eui-64
    !
    interface GigabitEthernet0/2
     mac-address 7824.fbce.a103
     ipv6 address 2001:BA82:B0AE:CAE::/64 eui-64

#### Example 6: R2 Config

    interface GigabitEthernet0/1
     mac-address 0014.abc2.8abe
     ipv6 address 2000::/64 eui-64
    !
    interface GigabitEthernet0/2
     mac-address ac13.feda.beca
     ipv6 address 2001:BA81:8326:2753::/64 eui-64

#### Example 7: R3 Config

    interface GigabitEthernet0/1
     mac-address aced.abec.fdac
     ipv6 address 2000::/64 eui-64
    !
    interface GigabitEthernet0/2
     mac-address 9876.1234.7654
     ipv6 address 2001:BEDE:AB81:9173::/64 eui-64

#### Example 8: R4 Config