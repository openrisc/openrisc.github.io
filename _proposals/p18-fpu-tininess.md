---
layout: proposal
title: Tininess Before Rounding (P18)
category: r1.4
date: 2021-10-09 03:49
author: Stafford Horne
---

The IEEE standard allows specifying how detecting of tininess occurs.  Tininess
detection is how underflow exceptions are triggered.  There are two allowed methods
for detecting tininess one is *before rounding* and the other being *after rounding*.

All FPU operations in an implementation must be consistent in how this is
implemented to be compliant.

As BAndViG has already updated the implementations on Mor1kx and Marocchino to match
the *before rounding* behavior; we propose that OpenRISC specifies:

  1. Tininess to be detected *before rounding*

This will require changes to:

 - The SPEC
   - Section 4.12 Floating Point Control Status Register, extend to explain how
     for underflow OpenRISC follows the tininess detection *before rounding* policy
     for all operations..
 - GCC (currently set to tininess after rounding), Glibc (updated to tininess before rounding)
 - Qemu to specify tininess to be detected before rounding.
 - Other simulators (sim, or1ksim).
 - *Note* Mor1kx and Marocchino verilog cores are already updated.

