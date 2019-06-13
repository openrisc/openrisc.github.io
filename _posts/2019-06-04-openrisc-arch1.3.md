---
layout: post
title: "Announcing Architecture Version 1.3"
description: ""
category:
tags: []
author: Stafford Horne
---
{% include JB/setup %}

It has been been a few years since the release of [OpenRISC version 1.2](/revisions/r1.2).
But, it's been a busy few years of getting GDB and GCC ports upstream.  Now with
the GCC port upstream we are able to make progress and this new architecture
revision does just that bringing in a handful of new instructions:

 - New instruction `lf.stod.d` for converting floats from single precision to
   double prevision
 - New instruction `lf.dtos.d` for converting floats from double precision to
   single precision
 - New instruction `l.adrp` for constructing addresses
 - New instructions `lf.sfun*` to support unordered compares
 - New instruction `l.lf` to load floats with NaN boxing on 64-bit hardware
 - Remove instructions `lf.rem.d` and `lf.rem.s` used for calculating floating point remainder

Perhaps one of the biggest new features is the addition of support for
performing double precision floating point operations using 32-bit hardware.
The is by way of the new [ORFPX64A32](/proposals/orfpx64a32)
instruction set extension.

With that said OpenRISC architecture specification
[version 1.3](https://raw.githubusercontent.com/openrisc/doc/master/openrisc-arch-1.3-rev1.pdf)
has been released.  Quite a few of the instructions and changes are already
implemented in OpenRISC soft cores and toolchains so you should be able to use
them right away.

See the full details on the [release](/revisions/r1.3) page.

## Soft Core Support

Some soft cores already support the new instructions if you want to try them out
you can find them here:

 - [mor1kx](https://github.com/openrisc/mor1kx) - has support for `lf.sfun*`
   operations.
 - [or1k_marocchino](https://github.com/openrisc/or1k_marocchino) - has support
   for `lf.sfun*` operations as well as the  `ORFPX64A32` extension.

## Software Upstreaming Effort

In order for the new features to be useful to most users they must be available
in OpenRISC software.  Stafford is working on submitting toolchain patches for
the following components.

   - [GCC](https://github.com/stffrdhrn/gcc/tree/or1k-fpu-2) - Patches, ready
     to go but depends on binutils being in first.
   - [binutils](https://github.com/stffrdhrn/binutils-gdb/tree/orfpx64a32-3) - Working
     on adding test cases for the `l.adrp` instruction.  Should send for upstream
     review in a few weeks.
   - [cgen](https://github.com/stffrdhrn/cgen)- Added unordered support to
     support binutils, [patches submitted](https://sourceware.org/ml/cgen/2019-q2/msg00013.html) waiting for review.

Please feel free to contact us via the [mailing list](/community) if you have any questions.
