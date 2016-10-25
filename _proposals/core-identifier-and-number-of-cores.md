---
title: Core Identifier and Number of Cores (P1)
category: draft
date: 2015-03-03 10:34
author: Wallento
---

To enable multicore systems, a Special Purpose Register 'Core ID' is needed. Although it is principally not necessary, but allows for a self-contained solution, I furthermore propose a 'Number of Cores' register, which contains the number of cores in a SMP cluster.

Proposal: Use system status register address space 128+ for multicore specifics. I think there may further things come up, so that it may make sense to reserve some space.

This is already in mor1kx..

Therefore, in table on page 24 add:

```
 Grp #: 0
 Reg #: 128
 Reg Name: COREID
 USER MODE: -
 SUPV MODE: R
 Description: Core Identifier Register

 Grp #: 0
 Reg #: 129
 Reg Name: NUMCORES
 USER MODE: -
 SUPV MODE: R
 Description: Number of Cores Register
```

Add 4.12, explaining those.

