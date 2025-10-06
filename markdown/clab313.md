# [clab313](https://www.certskills.com/clab313/)

![](../images/clab313_img1.svg)

## Lab Requirements

When the OSPF process starts on a router, the router chooses its OSPF RID based on rules checked in this order:

1. If configured, use the explicitly configured setting found in OSPF configuration mode.
2. If not, use the numerically highest interface IP address found on any loopback interface whose status is up/up.
3. If not, use the numerically highest interface IP address found on any other interface whose status is up/up.

Note that the current RID setting on a router depends on the configuration when the OSPF process chooses its RID – which may not be the exact configuration that exists right now. For instance, if you change the OSPF RID through any methods on real Cisco routers, OSPF does not immediately change the RID. Changing the RID would be disruptive, causing neighbor relationships to fail. Instead, real routers wait for the next reload, power off/on, or an explicit request to clear the OSPF process.

For production networks, you would likely set the OSPF RID on the routers using a consistent method. This lab instead asks you to use all methods just so you can think about how to configure each. Configure the lab as follows:

1. Router R1: Set the RID to 1.1.1.1 using a command in OSPF config mode.
2. Router R2: Set the RID by creating a loopback interface with IP address/mask 2.2.2.2/24.
3. Router R3: Set the RID by configuring a new interface, G0/0, with IP address/mask 193.3.3.3/24. Take any necessary steps to make the interface work (up/up).
4. Router R4: Do not configure any additional commands, but predict the RID it should use based on the initial configuration plus any default settings that matter.

![](../images/clab313_img1.svg)

#### Figure 1: Topology for this Lab

## Initial Configuration

The configurations on the four routers show a minimal OSPF configuration. It uses mostly default OSPF settings, except that the configurations set the RID for each router.

    hostname R1
    !
    interface GigabitEthernet0/0
     ip address 172.16.1.1 255.255.255.0
     ip ospf 1 area 0
    !
    interface GigabitEthernet0/0/0
     ip address 172.16.12.1 255.255.255.0
     ip ospf 1 area 0
    !
    interface GigabitEthernet0/1/0
     ip address 172.16.13.1 255.255.255.0
     ip ospf 1 area 0
    !
    interface GigabitEthernet0/2/0
     ip address 172.16.14.1 255.255.255.0
     ip ospf 1 area 0
    !
    router ospf 1

#### Example 1: R1 Config

    hostname R2
    !
    interface GigabitEthernet0/0
     ip address 172.16.2.2 255.255.255.0
     ip ospf 1 area 0
    !
    interface GigabitEthernet0/0/0
     ip address 172.16.12.2 255.255.255.0
     ip ospf 1 area 0
    !
    router ospf 1

#### Example 2: R2 Config

    hostname R3
    !
    interface GigabitEthernet0/1
     ip address 172.16.2.3 255.255.255.0
     ip ospf 1 area 0
    !
    interface GigabitEthernet0/0/0
     ip address 172.16.13.3 255.255.255.0
     ip ospf 1 area 0
    !
    router ospf 1

#### Example 3: R3 Config

    hostname R4
    !
    interface GigabitEthernet0/0
     ip address 172.16.4.4 255.255.255.0
     ip ospf 1 area 0
    !
    interface GigabitEthernet0/0/0
     ip address 172.16.14.4 255.255.255.0
     ip ospf 1 area 0
    !
    router ospf 1

#### Example 4: R4 Config

The lab does not call for any switches or PCs. Note that if you add them yourself, you can use all default configurations in a Cisco switch for this lab, which would place all devices connected to a switch in the same VLAN.

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

[Download this lab’s Packet Tracer File](https://files.certskills.com/virl/clab313.pkt)

#### Option 3: Cisco Modeling Labs

## This Lab Supports Both CML-Free and CML-Personal!!!

The downloadable file listed here works in both CML-P or CML-F because it uses the IOL (router) and IOL-L2 (switch) reference platform images supported by both products as of CML V2.8. Note that these images also require less CPU and RAM than the other CML-P options.

Use the same general workflow as with Cisco Packet Tracer, as follows:

1. Download the CML file (filetype .yaml) linked below.
2. Import the lab’s CML file into CML.
3. Start the lab in CML.
4. Compare the CML lab topology and interface IDs to this lab Blog page, as they may differ (more detail below).
5. Add your planned configuration to the lab, adjusting for interface ID differences.
6. Test the configuration using some of the suggestions below.

[Download this lab’s CML file!](https://files.certskills.com/virl/clab313-free.yaml)

#### Interface ID Differences:

The lab diagrams on this page use interface IDs (IIDs) that match the Packet Tracer version of the lab. When using CML, adjust the lab IIDs based on this table. Also, note that the IOL and IOL-L2 images used by the supplied CML file support only the “Ethernet” interface type, and not “FastEthernet” or “GigabitEthernet”.

The conventions for this lab are:

- Gigabit IIDs with two numbers (G0/0) convert to an Ethernet type with the same numbers, respectively. (For example, G0/0 becomes E0/0, G0/1 becomes E0/1.)
- Gigabit IIDs with a pattern of G0/x/0 convert Ethernet type, with two numbers, in the pattern “E1/x”, where x is the original middle digit. (For example, G0/1/0 becomes E1/1.)

| **Lab Port** | **CML Port** |
| --- | --- |
| G0/0 | E0/0 |
| G0/1 | E0/1 |
| G0/0/0 | E1/0 |
| G0/1/0 | E1/1 |
| G0/2/0 | E1/2 |



### Config Lab Intro Video

<iframe id="iframe-player-14" data-id="14" class="youtube-player" width="1140" height="642" src="https://www.youtube.com/embed/iDO70Z9fz_k?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en-US&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe>

The above lab intro – the text, figures, and initial configuration – tells you all you need to know. But if you want a little more, with a little different slant on what to do in this lab, watch this lab intro video!

# Lab Answers Below: Spoiler Alert

---

## Lab Answers

![](../images/clab313_img1.svg)

#### Figure 1: Topology for this Lab

    router ospf 1
     router-id 1.1.1.1

#### Example 1: R1 Config

    interface loopback 1
     ip address 2.2.2.2 255.255.255.0
     no shutdown

#### Example 2: R2 Config

    interface GigabitEthernet0/0
     ip address 193.3.3.3 255.255.255.0
     no shutdown

#### Example 3: R3 Config

    ! No Configuration - But Uses this Interface's Address as RID:
    interface GigabitEthernet0/0/0
     ip address 172.16.14.4 255.255.255.0

#### Example 4: R4 Config