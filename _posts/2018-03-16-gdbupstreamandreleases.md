---
layout: post
title: "GDB Upstreaming and Binaries: 7.2.0"
description: ""
category:
tags: []
author: Stafford Horne
---
{% include JB/setup %}

We are proud to announce that the OpenRISC port for [gdb](https://www.gnu.org/software/gdb/)
has been merged upstream.  This was done back in December 2017 so its a bit late
notice, but here it is.

With that we have released an updated version of the toolchain with `x86_64`
binaries for easy consumption.  The new version, tagged `or1k-7.2.0-20180317`
is available on [our github release
page](https://github.com/openrisc/or1k-gcc/releases/tag/or1k-7.2.0-20180317).

There are 3 different binaries to choose from:

* newlib - this is the baremetal toolchain good for running c code directly
  on the OpenRISC cpu without an operating system
* musl - this is our main supported Linux capable libc toolchain good for
  compiling applications to run on Linux
* nolib - this is a special build used for building os kernels,
  this is specifically used by the kbuild Linux build robots.

The toolchain binaries with use following tool versions:

* GCC 7.2.0 from [openrisc/or1k-gcc](https://github.com/openrisc/or1k-gcc/tree/or1k-7.2.0)
* Binutils 2.30 from [openrisc/binutils-gdb](https://github.com/openrisc/binutils-gdb/tree/or1k-2.30)
* Newlib 2.4.0
* Musl 1.1.19
* GDB 8.1

## Change Log

Notable updates for OpenRISC include.

* GDB included in binaries
* GCC updated to version 7.x
* GCC support for tailcall optimization
* GCC and assembler new relocations to provide code optimizations
* GCC cleanup delay slot handling
* GCC and assembler support for new instruction [l.adrp](http://openrisc.io/proposals/ladrp)
* GAS support for instructions `l.muld`, `l.muldu`, `l.macu`, `l.msbu`

*Thanks rth for the major toolchain cleanups and optimizations*

## Note on GCC

This may be one of the last full featured releases for a while as we work on
rewriting core parts of the OpenRISC GCC port due to copyright issues.

For details watch for updates on the [OpenRISC mailing list](https://lists.librecores.org/listinfo/OpenRISC).
