---
layout: proposal
title: ORFPX32/ORFPX64 Comparison Corrections (P19)
category: draft
date: 2025-03-19
author: "Stafford Horne <shorne@gmail.com>"
---
{% include JB/setup %}

When Jed Liu was working on the mor1kx FPU verirfication [PR#164](https://github.com/openrisc/mor1kx/pull/164)
he noticed some shortcomings in the
ORFPX32/ORFPX64 specification regarding unordered comparisons these are:

The text (mostly from Jed) being:

 * For = and ≠ (`lf.sfeq.*`, `lf.sfne.*`; pp.151–2, 161–2), the spec says to raise an
   exception when a signalling NaN is given, but doesn't explicitly specify the
   behaviour on quiet NaNs. We should specify how for quiet NaN's that they are
   never equal to anything, any comparison comparing NaNs should clear the
   `SR[F]` flag.
 * For unordered or = (`lf.sfueq.*`; pp.163–4), the spec says to set the compare flag
   on any NaN, but the implementation yields an exception on signalling NaNs. As per
   IEEE 754 we should specify this in the specification.
 * For unordered or ≠ (`lf.sfune.d` and `lf.sfune.s`) are missing from the spec,
   although the machine code reference in §18 lists both instructions. These
   should be added to the spec similar to `lf.sfne.*`.
   *Should these be removed, are they useful?*

     * These are missing in QEMU also.
     * These are missing in GCC
     * These defined in gas `binutils-gdb/cpu/or1korfpx.cpu`

 * For the unordered comparisons (`lf.sfult.*`, `lf.sfule.*`, `lf.sfugt.*`,
   `lf.sfuge.*`; pp.165–72), the spec says to set the compare flag on any NaN, but
   IEEE 754 says to signal an exception for signalling NaNs. This should be
   specified in the spec and implementations should be updated to do so.  QEMU
   already does this.

