# windows_disable_ipv6 #

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with windows_disable_ipv6](#setup)
    * [What windows_disable_ipv6 affects](#what-[modulename]-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with windows_disable_ipv6](#beginning-with-[Modulename])
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

Disable IPv6 on Windows

##Module Description

This module is used to disable IPv6 on Windows platforms through a registry change.

##Setup

###What windows_disable_ipv6 affects

The module modifies the "Disabled Components" registry key to disable or enable IPv6 on the node. A system restart is required for the change to take effect.

###Setup Requirements
 
Depends on the following modules:

puppetlabs/registry
puppetlabs/stdlib
puppetlabs/reboot

##Usage

Class: windows_disable_ipv6

Example - Disable IPv6

<pre>
  class {'windows_disable_ipv6':
   ipv6_disable => true,
   }
</pre>

<pre>
Parameters:
  $ipv6_disable  # disable ipv6 {true|false}
</pre>

##Reference

##Limitations

##Development

##Release Notes/Contributors/Etc

Contributors:

Martez Reed <martez.reed@greenreedtech.com>
