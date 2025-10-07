# [Login Security 1](https://www.certskills.com/clab111/)

![img](../images/clab111_img1.svg)

Configure console, Telnet, and enable mode security on all four devices in the figure as follows:

* Protect console access for all device consoles with a password of ‘certskills’.
* Protect privileged mode for all devices using password “ccnaskills” while storing the password as an MD5 hash.
* Protect Telnet access by requiring a username/password combination to login. To that end, create a username ‘person’ with a password of ‘access’ using the most secure option to configure the user.
* Assume all device interfaces shown in the lab are up, working, and correctly configured with IP addresses.
* Assume routing is configured and working correctly.

```
SW1>en
SW1#conf t
Enter configuration commands, one per line.  End with CNTL/Z.
SW1(config)#line console 0
SW1(config-line)#password certskills
SW1(config-line)#login
SW1(config-line)#exit
SW1(config)#enable secret ccnaskills
SW1(config)#line vty 0 15
SW1(config-line)#login local
SW1(config-line)#transport input telnet
SW1(config-line)#exit
SW1(config)#username person secret access
SW1(config)#
```

```
SW2>en
SW2#conf t
Enter configuration commands, one per line.  End with CNTL/Z.
SW2(config)#line console 0
SW2(config-line)#login
% Login disabled on line 0, until 'password' is set
SW2(config-line)#password certskills
SW2(config-line)#exit
SW2(config)#enable secret ccnaskills
SW2(config)#line vty 0 15
SW2(config-line)#login local
SW2(config-line)#transport input telnet
SW2(config-line)#exit
SW2(config)#username person secret access
SW2(config)#
```

```
R1>en
R1#conf t
Enter configuration commands, one per line.  End with CNTL/Z.
R1(config)#username person password access
R1(config)#enable secret ccnaskills
R1(config)#line console 0
R1(config-line)#password certskills
R1(config-line)#login
R1(config-line)#line vty 0 15
R1(config-line)#transport input telnet
R1(config-line)#login local
R1(config-line)#end
R1#
%SYS-5-CONFIG_I: Configured from console by console

```

```

R2>en
R2#conf t
Enter configuration commands, one per line.  End with CNTL/Z.
R2(config)#username person secret access
R2(config)#enable secret ccnasskills
R2(config)#line console 0
R2(config-line)#password certskills
R2(config-line)#login
R2(config-line)#line vty 0 15
R2(config-line)#login local
R2(config-line)#transport input telnet
R2(config-line)#end
R2#
%SYS-5-CONFIG_I: Configured from console by console

R2#
```

---



```
SW1#show run
Building configuration...

Current configuration : 1378 bytes
!
version 15.0
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname SW1
!
enable secret 5 $1$mERr$iPFDM2nGUV8.q4s4AYfQl0
!
!
!
no ip domain-lookup
!
username person secret 5 $1$mERr$h2s6pdWZvAwM8KWuqJJIH/
!
vtp mode transparent
!
!
!
spanning-tree mode pvst
spanning-tree extend system-id
!
interface FastEthernet0/1
!
interface FastEthernet0/2
!
interface FastEthernet0/3
!
interface FastEthernet0/4
!
interface FastEthernet0/5
!
interface FastEthernet0/6
!
interface FastEthernet0/7
!
interface FastEthernet0/8
!
interface FastEthernet0/9
!
interface FastEthernet0/10
!
interface FastEthernet0/11
!
interface FastEthernet0/12
!
interface FastEthernet0/13
!
interface FastEthernet0/14
!
interface FastEthernet0/15
!
interface FastEthernet0/16
!
interface FastEthernet0/17
!
interface FastEthernet0/18
!
interface FastEthernet0/19
!
interface FastEthernet0/20
!
interface FastEthernet0/21
!
interface FastEthernet0/22
!
interface FastEthernet0/23
!
interface FastEthernet0/24
!
interface GigabitEthernet0/1
!
interface GigabitEthernet0/2
!
interface Vlan1
 ip address 20.20.20.10 255.255.255.0
!
ip default-gateway 20.20.20.1
!
!
!
!
line con 0
 password certskills
 login
 exec-timeout 0 0
!
line vty 0 4
 login local
 transport input telnet
line vty 5 15
 login local
 transport input telnet
!
!
!
!
end
```



```
SW2#show run
Building configuration...

Current configuration : 1378 bytes
!
version 15.0
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname SW2
!
enable secret 5 $1$mERr$iPFDM2nGUV8.q4s4AYfQl0
!
!
!
no ip domain-lookup
!
username person secret 5 $1$mERr$h2s6pdWZvAwM8KWuqJJIH/
!
vtp mode transparent
!
!
!
spanning-tree mode pvst
spanning-tree extend system-id
!
interface FastEthernet0/1
!
interface FastEthernet0/2
!
interface FastEthernet0/3
!
interface FastEthernet0/4
!
interface FastEthernet0/5
!
interface FastEthernet0/6
!
interface FastEthernet0/7
!
interface FastEthernet0/8
!
interface FastEthernet0/9
!
interface FastEthernet0/10
!
interface FastEthernet0/11
!
interface FastEthernet0/12
!
interface FastEthernet0/13
!
interface FastEthernet0/14
!
interface FastEthernet0/15
!
interface FastEthernet0/16
!
interface FastEthernet0/17
!
interface FastEthernet0/18
!
interface FastEthernet0/19
!
interface FastEthernet0/20
!
interface FastEthernet0/21
!
interface FastEthernet0/22
!
interface FastEthernet0/23
!
interface FastEthernet0/24
!
interface GigabitEthernet0/1
!
interface GigabitEthernet0/2
!
interface Vlan1
 ip address 30.30.30.10 255.255.255.0
!
ip default-gateway 30.30.30.1
!
!
!
!
line con 0
 password certskills
 login
 exec-timeout 0 0
!
line vty 0 4
 login local
 transport input telnet
line vty 5 15
 login local
 transport input telnet
!
!
!
!
end
```
