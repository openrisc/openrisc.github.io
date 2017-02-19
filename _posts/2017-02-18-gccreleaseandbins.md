---
layout: post
title: "GCC Release and Binaries: 5.4.0"
description: ""
category:
tags: []
author: Stafford Horne
---
{% include JB/setup %}

We have released an updated version of the gcc 5.4.0 toolchain with `x86_64`
binaries for easy consumption.  The new version, tagged `or1k-5.4.0-20170218`
is available on [our github release
page](https://github.com/openrisc/or1k-gcc/releases/tag/or1k-5.4.0-20170218).

There are 3 different binaries to choose from:

* newlib - this is the baremetal toolchain good for running c code directly
  on the openrisc cpu without an operating system
* musl - this is our main supported linux capable libc toolchain good for
  compiling applications to run on linux
* nolib - this is a special build used for building kernels (like linux),
  this is specifically used by the kbuild linux build robots.

We have released full toolchain binaries with the following versions:

* GCC 5.4.0 [upstream changelog](https://www.gnu.org/software/gcc/gcc-5/changes.html)
* Binutils 2.26
* Newlib 2.4.0
* Musl 1.1.16

## Change Log

This is mostly just a rebase and version bump release. Notable updates for
OpenRISC include.

* Update to GCC 5.4.0 to allow building toolchain on newer gcc compilers.
* Newlib patches to fix issue with `environ` and `c++` pointed out during
  gdb testing.

## Note on GDB

This release does not currently contain any GDB binaries.  This is because
Stafford Horne is currently in progress of getting openrisc GDB fully
pushed to upsteam and the is under review.

For details watch for updates on the [openrisc mailing
list](https://lists.librecores.org/listinfo/OpenRISC) as well as
on [Stafford's
upstream](https://github.com/stffrdhrn/binutils-gdb/tree/or1k-upstream) preparation branch (beware constant rebases.
