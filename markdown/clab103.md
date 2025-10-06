# [Enabling SSH and Disabling Telnet](https://www.certskills.com/clab103/)

![](../images/clab103_img1.svg)

## Answers

    ip domain-name example.com
    crypto key generate rsa modulus 1024
    !
    username Barney secret Rubble
    !
    line vty 0 15
     login local 
     transport input ssh

---

```
SW1>en
Password: 
SW1#conf t
Enter configuration commands, one per line.  End with CNTL/Z.
SW1(config)#ip domain-name example.com
SW1(config)#crypto key generate rsa
The name for the keys will be: SW1.example.com
Choose the size of the key modulus in the range of 360 to 4096 for your
  General Purpose Keys. Choosing a key modulus greater than 512 may take
  a few minutes.

How many bits in the modulus [512]: 4096
% Generating 4096 bit RSA keys, keys will be non-exportable...[OK]
*Mar 1 6:3:10.859: %SSH-5-ENABLED: SSH 1.99 has been enabled
SW1(config)#username Barney secret Rubble
SW1(config)#line vty 0 15
SW1(config-line)#transport input ssh 
SW1(config-line)#login local
SW1(config-line)#end
SW1#
%SYS-5-CONFIG_I: Configured from console by console
```

```
R1>ssh -l Barney 10.1.1.20

Password: 



SW1>en
Password: 
SW1#
```

```
SW1#show run
Building configuration...

Current configuration : 1391 bytes
!
version 15.0
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname SW1
!
enable secret 5 $1$mERr$4ZlqemhH2XXGMdKEgfrWo.
!
!
!
no ip domain-lookup
ip domain-name example.com
!
username Barney secret 5 $1$mERr$3oi7TMDkzDCRjb.9V.Q6G/
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
!
line vty 0 4
 password certskills
 login local
 transport input ssh
line vty 5 15
 password certskills
 login local
 transport input ssh
!
!
!
!
end
```

```
SW1#show crypto key mypubkey rsa 
% Key pair was generated at: 6:12:41 UTC marca 1 1993
Key name: SW1.example.com
 Storage Device: not specified
 Usage: General Purpose Key
 Key is not exportable.
 Key Data:
 000071af  0000624c  00007d96  00002086  000064c0  00002e9f  0000744b  0000449e
 00000e16  0000670a  00004e0a  00004da4  00005278  000014c2  00000881  000036a0
 000024a4  00007424  000070eb  000050ef  0000254b  000024a7  00006434  13df
% Key pair was generated at: 6:12:41 UTC marca 1 1993
Key name: SW1.example.com.server
Temporary key
 Usage: Encryption Key
 Key is not exportable.
 Key Data:
 0000045e  00001510  00005a5d  00000a79  00000788  00007fe5  00004123  0000539e
 000059fc  00000c23  000069db  00006856  00000970  00006633  00000ea1  00001c64
 00005469  0000651b  000032b1  00000d1e  00002dba  00000ff2  00006215  727b
 ```


 ```
 SW1#show users 
    Line       User       Host(s)              Idle       Location
*  0 con 0                idle                 00:00:00 
   2 vty 0     Barney     idle                 00:00:31 

  Interface    User               Mode         Idle     Peer Address
  ```
