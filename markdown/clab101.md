# [clab101](https://www.certskills.com/clab101/)

![](../images/clab101_img1.svg)

## Lab Answers

    enable secret kindness
    !
    line con 0
     password joy
     login
    !
    line vty 0 4
     password peace
     login
    !
    line vty 5 15
     password peace
     login

---

```
SW1>en
SW1#conf t
Enter configuration commands, one per line.  End with CNTL/Z.
SW1(config)#enable secret kindness
SW1(config)#line console 0
SW1(config-line)#password joy
SW1(config-line)#login
SW1(config-line)#line vty 0 15
SW1(config-line)#password peace
SW1(config-line)#login
SW1(config-line)#end
SW1#
%SYS-5-CONFIG_I: Configured from console by console
```

On R1 - Telnet

```
R1>telnet 10.1.1.20 
Trying 10.1.1.20 ...Open


User Access Verification

Password: 
SW1>en
Password: 
SW1#
```

On PC0 - Console Line 

```
User Access Verification

Password: 

SW1>en
Password: 
SW1#
```

```
SW1#show run | section line
line con 0
 password joy
 login
line vty 0 4
 password peace
 login
line vty 5 15
 password peace
 login
SW1#show run | include secret
enable secret 5 $1$mERr$853d9gYeIIYF1JA6KByqT0
```
