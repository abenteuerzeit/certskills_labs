# [CLI Passwords 2](https://www.certskills.com/clab102/)

![](../images/clab102_img1.svg)

## Answers

    username allison password hope
    username danielle password love
    username tyler password faith
    !
    line con 0
      login local
    !
    line vty 0 4
      login local
    !
    line vty 5 15
      login local

---

```
SW1>en
SW1#conf t
Enter configuration commands, one per line.  End with CNTL/Z.
SW1(config)#username allison password hope
SW1(config)#username danielle password love
SW1(config)#username tyler password faith
SW1(config)#line console 0
SW1(config-line)#login local
SW1(config-line)#line vty 0 15
SW1(config-line)#login local
SW1(config-line)#end
SW1#
%SYS-5-CONFIG_I: Configured from console by console
```

Console Line 

```

Username: allison
Password: 

SW1>en
SW1#
```

```
R1>telnet 10.1.1.20 
Trying 10.1.1.20 ...Open


User Access Verification

Username: allison
Password: 
SW1>en
% No password set.
SW1>
```

```
SW1#show run
Building configuration...

Current configuration : 1323 bytes
!
version 15.0
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname SW1
!
!
!
no ip domain-lookup
!
username allison privilege 1 password 0 hope
username danielle privilege 1 password 0 love
username tyler privilege 1 password 0 faith
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
 ip address 10.1.1.20 255.255.255.0
!
ip default-gateway 10.1.1.1
!
!
!
!
line con 0
 login local
!
line vty 0 4
 login local
line vty 5 15
 login local
!
!
!
!
end
```