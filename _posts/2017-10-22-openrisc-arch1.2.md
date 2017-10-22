---
layout: post
title: "Announcing Architecture Revision 1.2"
description: ""
category:
tags: []
author: Stafford Horne
---
{% include JB/setup %}

We are pleased to announce that a new OpenRISC architecture specification
[revision 1.2](https://raw.githubusercontent.com/openrisc/doc/master/openrisc-arch-1.2-rev0.pdf)
has been released.  This release formalizes a few items which have already been
implemented into our toolchains and Linux as well as describes the multicore
OpenRISC architecture.

See the full details on the [release](/revisions/r1.2) page.
 
## Update on Upstreaming Effort

In order for the new features to be useful to most users they must be available
in OpenRISC software.  Stafford is working on submitting multicore patches
upstream for the below components.  The toolchains already support multicore
thanks to work done previously be Stefan Wallentowitz.

 - Linux [openrisc-4.14-smp-qspinlock-v3](https://github.com/stffrdhrn/linux/tree/openrisc-4.14-smp-qspinlock-v3) expected to land in 4.15
 - QEMU [openrisc-smp-v2](https://github.com/stffrdhrn/qemu/tree/openrisc-smp-v2) expected to land in 2.11
 - FuseSoC [multicore-v2](https://github.com/stffrdhrn/fusesoc-cores/tree/multicore-v2) expected to land soon
 - OpenOCD [or1k-multicore](https://github.com/stffrdhrn/openocd/tree/or1k-multicore) submitted on April 9th to gerrit but no progress
