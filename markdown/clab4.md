# [clab4](https://www.certskills.com/clab4/)

![](../images/clab4_img1.svg)

## Initial Configuration

The switch does have some initial configuration as listed below. The lab lists the configuration just to be complete. However, the lab focuses on navigation in the CLI, so you can ignore the configuration for the purposes of the lab.

    hostname SW1
    !
    enable secret cisco
    !
    line con 0
     password cisco
     login
    !
    line vty 0 15
     password cisco
     login

#### Example 1: SW1 Config