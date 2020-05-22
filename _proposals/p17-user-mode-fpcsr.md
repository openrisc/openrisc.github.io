---
layout: proposal
title: User Mode FPCSR (P17)
category: draft
date: 2020-05-22 20:37
author: Stafford Horne
---

While working on the glibc port for OpenRISC we found that pretty much
every architecture allows reading and writing to the floating point control
register (in openRISC FPCSR) in userland.  This is used by userland to control
the rounding mode and exception reading and controlling of the FPU.

However, on OpenRISC this is only writable in supervisor mode.  We can read it
by enabling a flag in the `SR`;  but not write to it.

I propose that we:

  1. Allow both read and write to `FPCSR` if `SR[SUMRA]` is set.

This will require changes to:

 - The SPEC
   - Update table 4-2 to mention R*/W* for FPCSR
   - Update table 4-4 SUMRA entry to mention "1 Certain SPRs can be read-only or read/write in user mode"
   - Update section 4.12 to mention "as a read/write register in user mode if enabled in SR[SURMA]"
 - Linux Kernel preserve FPCSR during context switches
 - Qemu to allow writes to FPCSR (I have done part of this already, as its
   needed for glibc testing)
 - Other simulators.
 - Mor1kx and Marocchino verilog cores

