---
layout: proposal
title: User Mode FPCSR (P17)
category: r1.4
date: 2020-05-22 20:37
author: Stafford Horne
---

While working on the glibc port for OpenRISC we found that pretty much
every architecture allows reading and writing to the floating point control
register (in OpenRISC FPCSR) in userland.  This is used by userland to control
the rounding mode and exception reading and controlling of the FPU.

However, on OpenRISC this is only writable in supervisor mode.  We can read it
by enabling a flag in the `SR`;  but not write to it.

I propose that we:

  1. Allow both read and write to `FPCSR` always

This will require changes to:

 - The architecture specification
   - Update table 4-2 to mention R/W for FPCSR
   - Update section 4.12 to mention "as a read/write register in user mode"
 - Linux Kernel preserve FPCSR during context switches
 - Qemu to allow writes to FPCSR (I have done part of this already, as its
   needed for glibc testing)
 - Other simulators.
 - Mor1kx and Marocchino verilog cores

