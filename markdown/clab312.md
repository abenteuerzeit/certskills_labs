# [clab312](https://www.certskills.com/clab312/)

![](../images/clab312_img1.svg)

## Lab Requirements

By default, OSPF routers elect a Designated Router (DR) and Backup Designated Router (BDR) on Ethernet links, whether LAN or WAN. The routers do so because of the OSPF network type of “broadcast,” the default OSPF network type in Cisco IOS for Ethernet interfaces. The broadcast network type means that:

1. OSPF dynamically discovers potential OSPF neighbors on the link.
2. Any OSPF routers on the link elect a DR and BDR. The routers then flood OSPF LSAs using the DR as a central point of control.
3. The DR creates a Type 2 LSA for the link itself.

Using the OSPF broadcast network type works well with LANs. However, the OSPF broadcast network type adds unnecessary overhead when using Ethernet as a WAN technology, specifically for WAN links with only two routers on the link. By changing the network type on both ends of the link to use network type “point-to-point,” the two routers still dynamically discover each other but do not expend the overhead to elect a DR, follow extra steps to flood LSAs, and do not create a Type 2 LSA for the link.

For this lab, configure the routers to use OSPF network type point-to-point per the following requirements:

1. Before configuring, based on defaults plus the initial configuration, make these predictions:
    1. Predict how many OSPF neighbors will be displayed with a state of either “FULL/DR” or “FULL/BDR” on each router.
    2. Predict the number of Type 2 LSAs that would exist in the OSPF database.
2. Configure the OSPF interface network type as follows:
    1. Ethernet WAN links: Make both routers use network type point-to-point.
    2. Ethernet LAN links: Use the default OSPF network type of broadcast.

| Router | # Neighbors as FULL/DR or FULL/BDR **before New Config** | # Neighbors as FULL/DR or FULL/BDR **after New Config** |
| --- | --- | --- |
| R1 |  |  |
| R2 |  |  |
| R3 |  |  |
| R4 |  |  |

#### Table 1: Predicting the Number of DR/BDR Neighbors

![](../images/clab312_img1.svg)

#### Figure 1: Topology for this Lab

## Initial Configuration

The configurations on the four routers show a minimal OSPF configuration. It uses mostly default OSPF settings, except that the configurations set the RID for each router.

    hostname R1
    !
    interface GigabitEthernet0/0
     ip address 172.16.1.1 255.255.255.0
     ip ospf 1 area 0
     no shutdown
    !
    interface GigabitEthernet0/0/0
     ip address 172.16.12.1 255.255.255.0
     ip ospf 1 area 0
     no shutdown
    !
    interface GigabitEthernet0/1/0
     ip address 172.16.13.1 255.255.255.0
     ip ospf 1 area 0
     no shutdown
    !
    interface GigabitEthernet0/2/0
     ip address 172.16.14.1 255.255.255.0
     ip ospf 1 area 0
     no shutdown
    !
    router ospf 1
     router-id 1.1.1.1

#### Example 1: R1 Config

    hostname R2
    !
    interface GigabitEthernet0/0
     ip address 172.16.2.2 255.255.255.0
     ip ospf 1 area 0
     no shutdown
    !
    interface GigabitEthernet0/0/0
     ip address 172.16.12.2 255.255.255.0
     ip ospf 1 area 0
     no shutdown
    !
    router ospf 1
     router-id 2.2.2.2

#### Example 2: R2 Config

    hostname R3
    !
    interface GigabitEthernet0/1
     ip address 172.16.2.3 255.255.255.0
     ip ospf 1 area 0
     no shutdown
    !
    interface GigabitEthernet0/0/0
     ip address 172.16.13.3 255.255.255.0
     ip ospf 1 area 0
     no shutdown
    !
    router ospf 1
     router-id 3.3.3.3

#### Example 3: R3 Config

    hostname R4
    !
    interface GigabitEthernet0/0
     ip address 172.16.4.4 255.255.255.0
     ip ospf 1 area 0
     no shutdown
    !
    interface GigabitEthernet0/0/0
     ip address 172.16.14.4 255.255.255.0
     ip ospf 1 area 0
     no shutdown
    !
    router ospf 1
     router-id 4.4.4.4

#### Example 4: R4 Config

The lab does not call for any switches or PCs. Note that if you add them yourself, you can use all default configuration in a Cisco switch for this lab, which would place all devices connected to a switch in the same VLAN.







### Config Lab Intro Video

<iframe id="iframe-player-9" data-id="9" class="youtube-player" width="1140" height="642" src="https://www.youtube.com/embed/02mKYhjw6cE?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en-US&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe>

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

[Download this lab’s Packet Tracer File](https://files.certskills.com/virl/clab312.pkt)

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

[Download this lab’s CML file!](https://files.certskills.com/virl/clab312-free.yaml)

#### Interface ID Differences:

The lab diagrams on this page use interface IDs (IIDs) that match the Packet Tracer version of the lab. When using CML, adjust the lab IIDs based on this table. Also, note that the IOL and IOL-L2 images used by the supplied CML file support only the “Ethernet” interface type, and not “FastEthernet” or “GigabitEthernet”.

The conventions for this lab are:

- Gigabit IIDs with two numbers (G0/0) convert to an Ethernet type with the same numbers, respectively. (For example, G0/0 becomes E0/0, G0/1 becomes E0/1.)
- Gigabit IIDs with a pattern of G0/x/0 convert Ethernet type, with two numbers, in the pattern “E1/x”, where x is the original middle digit. (For example, G0/1/0 becomes E1/1.)

| **Lab Port** | **CML Port** |
| --- | --- |
| G0/0 | E0/0 |
| G0/1 | E0/1 |
| G0/**0**/0 | E1/**0** |
| G0/**1**/0 | E1/**1** |
| G0/**2**/0 | E1/**2** |

# Lab Answers Below: Spoiler Alert

---

## Lab Answers

![](../images/clab312_img1.svg)

#### Figure 1: Topology for this Lab

#### Example 1: R1 Config

    interface GigabitEthernet0/0/0
     ip ospf network point-to-point
    !
    interface GigabitEthernet0/1/0
     ip ospf network point-to-point
    !
    interface GigabitEthernet0/2/0
     ip ospf network point-to-point

#### Example 2: R2 Config

    interface GigabitEthernet0/0/0
     ip ospf network point-to-point

#### Example 3: R3 Config

    interface GigabitEthernet0/0/0
     ip ospf network point-to-point

#### Example 4: R4 Config

    interface GigabitEthernet0/0/0
     ip ospf network point-to-point