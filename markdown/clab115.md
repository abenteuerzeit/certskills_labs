# [Trunking Puzzle 1](https://www.certskills.com/clab115/)

1:8.2

![](../images/clab115_img1.svg)

## Requirements

Configure IEEE 802.1Q trunking between the devices shown in the figure. The specific rules for this lab are:

- Configure SW1’s trunks so that they will actively attempt to form trunks with attached switches.
- Configure the trunk between SW2 and SW3 using manual trunking and disable DTP.
- Configure SW4’s trunks to use manual trunking.
- Assume all interfaces shown in the lab are up and working.


### Config Lab Intro Video

<iframe id="iframe-player-10" data-id="10" class="youtube-player" width="1140" height="642" src="https://www.youtube.com/embed/ZwkVZMSA1nY?version=3&#038;rel=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;fs=1&#038;hl=en-US&#038;autohide=2&#038;wmode=transparent" allowfullscreen="true" style="border:0;" sandbox="allow-scripts allow-same-origin allow-popups allow-presentation allow-popups-to-escape-sandbox"></iframe>

```
SW1(config)#int r g1/0/1-2
SW1(config-if-range)#switchport mode dynamic desirable
```

```
SW2(config)#int g1/0/2
SW2(config-if)#switchport mode trunk


SW3(config)#int g1/0/2
SW3(config-if)#switchport mode trunk


SW2(config-if)#switchport nonegotiate


SW3(config-if)#switchport nonegotiate
```

```
SW4(config)#int r g1/0/1-2
SW4(config-if-range)#switchport mode trunk
```


```
SW4#show interfaces trunk 
Port        Mode         Encapsulation  Status        Native vlan
Gig1/0/1    on           802.1q         trunking      1
Gig1/0/2    on           802.1q         trunking      1

Port        Vlans allowed on trunk
Gig1/0/1    1-1005
Gig1/0/2    1-1005

Port        Vlans allowed and active in management domain
Gig1/0/1    1
Gig1/0/2    1

Port        Vlans in spanning tree forwarding state and not pruned
Gig1/0/1    none
Gig1/0/2    none
```

```
SW4#show int status 
Port      Name               Status       Vlan       Duplex  Speed Type
Gig1/0/1                     connected    trunk      auto    auto  10/100BaseTX
Gig1/0/2                     connected    trunk      auto    auto  10/100BaseTX
```

```
SW4#show int g1/0/1 switchport 
Name: Gig1/0/1
Switchport: Enabled
Administrative Mode: trunk
Operational Mode: trunk
Administrative Trunking Encapsulation: dot1q
Operational Trunking Encapsulation: dot1q
Negotiation of Trunking: On
Access Mode VLAN: 1 (default)
Trunking Native Mode VLAN: 1 (default)
Voice VLAN: none
Administrative private-vlan host-association: none
Administrative private-vlan mapping: none
Administrative private-vlan trunk native VLAN: none
Administrative private-vlan trunk encapsulation: dot1q
Administrative private-vlan trunk normal VLANs: none
Administrative private-vlan trunk private VLANs: none
Operational private-vlan: none
Trunking VLANs Enabled: All
Pruning VLANs Enabled: 2-1001
Capture Mode Disabled
Capture VLANs Allowed: ALL
Protected: false
Appliance trust: none
```
