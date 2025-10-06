# [clab118](https://www.certskills.com/clab118/)

![](../images/clab118_img1.svg)

## Initial Configuration

Examples 1, 2, 3 and 4 show the beginning configuration state of Core, Branch1, Branch2 and Branch3.

    hostname Core
    !
    interface GigabitEthernet0/1
     ip address 10.100.200.1 255.255.255.252
     no shutdown
    !
    interface GigabitEthernet0/2
     ip address 10.100.200.5 255.255.255.252
     no shutdown
    !
    interface GigabitEthernet0/0
     ip address 10.100.200.9 255.255.255.252
     no shutdown

#### Example 1: Core Config

    hostname Branch1
    !
    interface GigabitEthernet0/1
     ip address 10.100.200.2 255.255.255.252
     no shutdown
    !
    interface GigabitEthernet0/2
     ip address 192.168.50.1 255.255.255.0
     no shutdown

#### Example 2: Branch1 Config

    hostname Branch2
    !
    interface GigabitEthernet0/1
     ip address 10.100.200.6 255.255.255.252
     no shutdown
    !
    interface GigabitEthernet0/2
     ip address 192.168.51.1 255.255.255.0
     no shutdown

#### Example 3: Branch2 Config

    hostname Branch3
    !
    interface GigabitEthernet0/1
     ip address 10.100.200.10 255.255.255.252
     no shutdown
    !
    interface GigabitEthernet0/2
     ip address 192.168.52.1 255.255.255.0
     no shutdown

#### Example 4: Branch3 Config









### Config Lab Intro Video

<iframe id="iframe-player-10" data-id="10" class="youtube-player" width="1140" height="642" src="https://www.youtube.com/embed/KEJ91sVa3sE?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en-US&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe>

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

[Download this lab’s Packet Tracer File](https://files.certskills.com/virl/clab118.pkt)

#### Option 3: Cisco Modeling Labs

#### This Lab Supports Both CML-Free and CML-Personal!!!

The downloadable file listed here works in both CML-P or CML-F because it uses the IOL (router) and IOL-L2 (switch) reference platform images supported by both products as of CML V2.8. Note that these images also require less CPU and RAM than the other CML-P options.

Use the same general workflow as with Cisco Packet Tracer, as follows:

1. Download the CML file (filetype .yaml) linked below.
2. Import the lab’s CML file into CML.
3. Start the lab in CML.
4. Compare the CML lab topology and interface IDs to this lab Blog page, as they may differ (more detail below).
5. Add your planned configuration to the lab, adjusting for interface ID differences.
6. Test the configuration using some of the suggestions below.

[Download this lab’s CML file!](https://files.certskills.com/virl/clab118-free.yaml)

#### Interface ID Differences:

The lab diagrams on this page use interface IDs (IIDs) that match the Packet Tracer version of the lab. When using CML, adjust the lab IIDs based on this table. Also, note that the IOL and IOL-L2 images used by the supplied CML file support only the “Ethernet” interface type, and not “FastEthernet” or “GigabitEthernet”.

The conventions for this lab are:

- All Gigabit interface types become Ethernet.
- All interface numbers stay the same. For instance, G0/0 becomes E0/0, and G0/1 becomes E0/1.

| **Port Shown in Lab** | **CML Port** |
| --- | --- |
| G0/0 | E0/0 |
| G0/1 | E0/1 |
| G0/2 | E0/2 |

#### Using the “One-Router as Many Hosts” Feature

The lab diagram on this page shows:

- 3 routers
- 3 LANs with unspecified LAN switches
- 3 hosts

However, CML-Free allows only five active nodes. To overcome that limitation, the supplied CML does the following:

- Uses the CML “Unmanaged Switch” node type to create each LAN. Unmanaged switches do not count against the five-node limit. Each unmanaged switch places all ports in the same VLAN with all ports up.
- Uses an extra router as a “One-Router-as-Many-Hosts” router. The router, per its pre-configuration, acts like ALL the hosts in the design – while counting as only one node towards the CML five-node limit. With this node, you can test as if sitting at the lab’s host, for instance, to issue **ping** and **traceroute** commands.

To learn about the one-router-as-many-hosts method, look to the following videos:

- - [Overcome the 5-Node Limit w/ Router-as-Many-Hosts](https://youtu.be/8LAmPxqa1Go)
    - [See CML-Free Node Count Avoidance Tricks in Action!](https://youtu.be/oHqV9tvT2-g)

I also made a video showing examples of using this feature – a video that uses this lab as the backdrop!

- [See CML-Free Node Count Avoidance in Action!](https://youtu.be/oHqV9tvT2-g)

Note: The one-router-as-many-hosts router may use passwords. **The passwords and usernames are always “cisco”.**

#### Host device info:

This table lists host information pre-configured in CML, which might not be required by the lab but may be helpful to you.

| **Device** | **IP Address** | **User/password** |
| --- | --- | --- |
| PC1 | 192.168.50.100 | cisco/cisco |
| PC2 | 192.168.51.100 | cisco/cisco |
| PC3 | 192.168.52.100 | cisco/cisco |

# Lab Answers Below: Spoiler Alert

---

## Answers

![](../images/clab118_img1.svg)

#### Figure 1: Simple Hub and Spoke Topology

    ip route 192.168.50.0 255.255.255.0 10.100.200.2
    ip route 192.168.51.0 255.255.255.0 10.100.200.6
    ip route 192.168.52.0 255.255.255.0 10.100.200.10

#### Example 1: Core Config

    ip route 10.100.200.4 255.255.255.252 10.100.200.1
    ip route 10.100.200.8 255.255.255.252 10.100.200.1
    ip route 192.168.51.0 255.255.255.0 10.100.200.1
    ip route 192.168.52.0 255.255.255.0 10.100.200.1

#### Example 2: Branch1 Config

    ip route 10.100.200.0 255.255.255.252 10.100.200.5
    ip route 10.100.200.8 255.255.255.252 10.100.200.5
    ip route 192.168.50.0 255.255.255.0 10.100.200.5
    ip route 192.168.52.0 255.255.255.0 10.100.200.5

#### Example 3: Branch2 Config

    ip route 10.100.200.0 255.255.255.252 10.100.200.9
    ip route 10.100.200.4 255.255.255.252 10.100.200.9
    ip route 192.168.50.0 255.255.255.0 10.100.200.9
    ip route 192.168.51.0 255.255.255.0 10.100.200.9

#### Example 4: Branch3 Config