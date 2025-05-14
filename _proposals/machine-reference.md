---
layout: proposal
title: Errata for the l.nop instruction in the Machine Reference (P362)
category: r1.4
date: 2025-05-14 16:00
author: Chen Miao
---

Section `18. Machine Reference` displays the format of all instructions, 
but there is an error in the presentation of the instruction:

1. *the OPC for l.nop should be ​​0x15​​ instead of ​​0x05​​*.
2. *the OPC for l.sys should be ​​0x2000 instead of ​​0x08*.
3. *the OPC for l.trap should be ​​0x2100 instead of ​​0x08*.
3. *the OPC for l.msync should be 0x22000000 instead of ​​0x08*.
3. *the OPC for l.psync should be 0x22800000 instead of ​​0x08*.
3. *the OPC for l.csync should be 0x23000000 instead of ​​0x08*.
3. *the OPC for l.sfeqi should be 0x5e0 instead of 0x2F*.
3. *the OPC for l.sfnei should be 0x5e1 instead of 0x2F*.
3. *the OPC for l.sfgtui should be 0x5e2 instead of 0x2F*.
3. *the OPC for l.sfgeui should be 0x5e3 instead of 0x2F*.
3. *the OPC for l.sfltui should be 0x5e4 instead of 0x2F*.
3. *the OPC for l.sfleui should be 0x5e5 instead of 0x2F*.
3. *the OPC for l.sfgtsi should be 0x5ea instead of 0x2F*.
3. *the OPC for l.sfgesi should be 0x5eb instead of 0x2F*.
3. *the OPC for l.sfltsi should be 0x5ec instead of 0x2F*.
3. *the OPC for l.sflesi should be 0x5ed instead of 0x2F*.
3. *the OPC for l.sfeq should be 0x720 instead of 0x39*.
3. *the OPC for l.sfne should be 0x721 instead of 0x39*.
3. *the OPC for l.sfgtu should be 0x722 instead of 0x39*.
3. *the OPC for l.sfgeu should be 0x723 instead of 0x39*.
3. *the OPC for l.sfltu should be 0x724 instead of 0x39*.
3. *the OPC for l.sfleu should be 0x725 instead of 0x39*.
3. *the OPC for l.sfgts should be 0x72a instead of 0x39*.
3. *the OPC for l.sfges should be 0x72b instead of 0x39*.
3. *the OPC for l.sflts should be 0x72c instead of 0x39*.
3. *the OPC for l.sfles should be 0x72d instead of 0x39*.

## Changes

```
  +-------------------------------------------------------+
  |  OPC  |            Instruction            |  Mnemonic |
  +-------------------------------------------------------+
  | 0x05  |  00010101--------KKKKKKKKKKKKKKKK |  l.nop    |
  +-------------------------------------------------------+
  | 0x08  |  0010000000000000KKKKKKKKKKKKKKKK |  l.sys    |
  +-------------------------------------------------------+
  | 0x08  |  0010000100000000KKKKKKKKKKKKKKKK |  l.trap   |
  +-------------------------------------------------------+
  | 0x08  |  00100010000000000000000000000000 |  l.msync  |
  +-------------------------------------------------------+
  | 0x08  |  00100010100000000000000000000000 |  l.psync  |
  +-------------------------------------------------------+
  | 0x08  |  00100011000000000000000000000000 |  l.csync  |
  +-------------------------------------------------------+
  | 0x2F  |  10111100000AAAAAIIIIIIIIIIIIIIII |  l.sfeqi  |
  +-------------------------------------------------------+
  | 0x2F  |  10111100001AAAAAIIIIIIIIIIIIIIII |  l.sfnei  |
  +-------------------------------------------------------+
  | 0x2F  |  10111100010AAAAAIIIIIIIIIIIIIIII |  l.sfgtui |
  +-------------------------------------------------------+
  | 0x2F  |  10111100011AAAAAIIIIIIIIIIIIIIII |  l.sfgeui |
  +-------------------------------------------------------+
  | 0x2F  |  10111100100AAAAAIIIIIIIIIIIIIIII |  l.sfltui |
  +-------------------------------------------------------+
  | 0x2F  |  10111100101AAAAAIIIIIIIIIIIIIIII |  l.sfleui |
  +-------------------------------------------------------+
  | 0x2F  |  10111101010AAAAAIIIIIIIIIIIIIIII |  l.sfgtsi |
  +-------------------------------------------------------+
  | 0x2F  |  10111101011AAAAAIIIIIIIIIIIIIIII |  l.sfgesi |
  +-------------------------------------------------------+
  | 0x2F  |  10111101100AAAAAIIIIIIIIIIIIIIII |  l.sfltsi |
  +-------------------------------------------------------+
  | 0x2F  |  10111101101AAAAAIIIIIIIIIIIIIIII |  l.sflesi |
  +-------------------------------------------------------+
  | 0x39  |  11100100000AAAAABBBBB----------- |  l.sfeq   |
  +-------------------------------------------------------+
  | 0x39  |  11100100001AAAAABBBBB----------- |  l.sfne   |
  +-------------------------------------------------------+
  | 0x39  |  11100100010AAAAABBBBB----------- |  l.sfgtu  |
  +-------------------------------------------------------+
  | 0x39  |  11100100011AAAAABBBBB----------- |  l.sfgeu  |
  +-------------------------------------------------------+
  | 0x39  |  11100100100AAAAABBBBB----------- |  l.sfltu  |
  +-------------------------------------------------------+
  | 0x39  |  11100100101AAAAABBBBB----------- |  l.sfleu  |
  +-------------------------------------------------------+
  | 0x39  |  11100101010AAAAABBBBB----------- |  l.sfgts  |
  +-------------------------------------------------------+
  | 0x39  |  11100101011AAAAABBBBB----------- |  l.sfges  |
  +-------------------------------------------------------+
  | 0x39  |  11100101100AAAAABBBBB----------- |  l.sflts  |
  +-------------------------------------------------------+
  | 0x39  |  11100101101AAAAABBBBB----------- |  l.sfles  |
  +-------------------------------------------------------+
```

## To

```
  +-------------------------------------------------------------+
  |     OPC     |           Instruction             | Mnemonic  |
  +-------------------------------------------------------------+
  | 0x15        |  00010101--------KKKKKKKKKKKKKKKK |  l.nop    |
  +-------------------------------------------------------------+
  | 0x2000      |  0010000000000000KKKKKKKKKKKKKKKK |  l.sys    |
  +-------------------------------------------------------------+
  | 0x2100      |  0010000100000000KKKKKKKKKKKKKKKK |  l.trap   |
  +-------------------------------------------------------------+
  | 0x22000000  |  00100010000000000000000000000000 |  l.msync  |
  +-------------------------------------------------------------+
  | 0x22800000  |  00100010100000000000000000000000 |  l.psync  |
  +-------------------------------------------------------------+
  | 0x23000000  |  00100011000000000000000000000000 |  l.csync  |
  +-------------------------------------------------------------+
  | 0x5e0       |  10111100000AAAAAIIIIIIIIIIIIIIII |  l.sfeqi  |
  +-------------------------------------------------------------+
  | 0x5e1       |  10111100001AAAAAIIIIIIIIIIIIIIII |  l.sfnei  |
  +-------------------------------------------------------------+
  | 0x5e2       |  10111100010AAAAAIIIIIIIIIIIIIIII |  l.sfgtui |
  +-------------------------------------------------------------+
  | 0x5e3       |  10111100011AAAAAIIIIIIIIIIIIIIII |  l.sfgeui |
  +-------------------------------------------------------------+
  | 0x5e4       |  10111100100AAAAAIIIIIIIIIIIIIIII |  l.sfltui |
  +-------------------------------------------------------------+
  | 0x5e5       |  10111100101AAAAAIIIIIIIIIIIIIIII |  l.sfleui |
  +-------------------------------------------------------------+
  | 0x5ea       |  10111101010AAAAAIIIIIIIIIIIIIIII |  l.sfgtsi |
  +-------------------------------------------------------------+
  | 0x5eb       |  10111101011AAAAAIIIIIIIIIIIIIIII |  l.sfgesi |
  +-------------------------------------------------------------+
  | 0x5ec       |  10111101100AAAAAIIIIIIIIIIIIIIII |  l.sfltsi |
  +-------------------------------------------------------------+
  | 0x5ed       |  10111101101AAAAAIIIIIIIIIIIIIIII |  l.sflesi |
  +-------------------------------------------------------------+
  | 0x720       |  11100100000AAAAABBBBB----------- |  l.sfeq   |
  +-------------------------------------------------------------+
  | 0x721       |  11100100001AAAAABBBBB----------- |  l.sfne   |
  +-------------------------------------------------------------+
  | 0x722       |  11100100010AAAAABBBBB----------- |  l.sfgtu  |
  +-------------------------------------------------------------+
  | 0x723       |  11100100011AAAAABBBBB----------- |  l.sfgeu  |
  +-------------------------------------------------------------+
  | 0x724       |  11100100100AAAAABBBBB----------- |  l.sfltu  |
  +-------------------------------------------------------------+
  | 0x725       |  11100100101AAAAABBBBB----------- |  l.sfleu  |
  +-------------------------------------------------------------+
  | 0x72a       |  11100101010AAAAABBBBB----------- |  l.sfgts  |
  +-------------------------------------------------------------+
  | 0x72b       |  11100101011AAAAABBBBB----------- |  l.sfges  |
  +-------------------------------------------------------------+
  | 0x72c       |  11100101100AAAAABBBBB----------- |  l.sflts  |
  +-------------------------------------------------------------+
  | 0x72d       |  11100101101AAAAABBBBB----------- |  l.sfles  |
  +-------------------------------------------------------------+
```
