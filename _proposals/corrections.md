---
layout: proposal
title: ORBIS64/ORFPX64 Corrections (P13)
category: draft
date: 2015-03-06 16:45
author: Rth
---
Multiple corrections to the 64-bit istructions specfication.

### l.ftoi.s

The 64-bit version of this instruction should produce a 64-bit signed integer result, rather
than truncating to a 32-bit unsigned number.

### l.itof.s

The 64-bit version of this instruction should use a 64-bit signed integer as input, rather
than reading only the low 32 bits.  This does mean that 64-bit code wanting to convert a
real 32-bit integer to single-precision must sign-extend beforehand, but that is also the
case for more fundamental instructions like l.sfeq, and so should not be a burden.

### l.ext*

These should be class I mandatory for ORBIS64, not relegated to class III optional.

In particular, there are no comparison instructions that ignore the high 32-bits, and one
cannot simply use l.andi to discard the high 32 bits, so l.extw* will be used often prior
to comparisons.

