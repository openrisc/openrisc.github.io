---
layout: proposal
title: Errata for the l.nop instruction in the Machine Reference (P362)
category: r1.4
date: 2025-05-14 16:00
author: Chen Miao
---

Section `18. Machine Reference` displays the format of all instructions, 
but there is an error in the presentation of the l.nop instruction: 
*the OPC for l.nop should be ​​0x15​​ instead of ​​0x05​​*.

## Changes

```
  +-----------------------------------------------------------------------------+
  |  OPC  |           Instruction             | Mnemonic |   Function   | Class |
  |-----------------------------------------------------------------------------|
  | 0x05  |  00010101--------KKKKKKKKKKKKKKKK |  l.nop   | No Operation |   I   |
  +-----------------------------------------------------------------------------+
```

## To

```
  +-----------------------------------------------------------------------------+
  |  OPC  |           Instruction             | Mnemonic |   Function   | Class |
  |-----------------------------------------------------------------------------|
  | 0x15  |  00010101--------KKKKKKKKKKKKKKKK |  l.nop   | No Operation |   I   |
  +-----------------------------------------------------------------------------+
```
