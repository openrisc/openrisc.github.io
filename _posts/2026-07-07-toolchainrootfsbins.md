---
layout: post
title: "2026 July Toolchain and rootfs Binaries"
description: ""
category: 
tags: []
author: Stafford Horne
---
{% include JB/setup %}

Again, we have created a new toolchain and rootfs build processes to deliver
compiler and software binaries from upstream stable releases.

You can access them via links on our [software](http://openrisc.io/software) page.
Or easily access them here:

 * [Toolchain releases](https://github.com/stffrdhrn/or1k-toolchain-build/releases) - For binaries of newlib, glibc and musl toolchains.
 * [Linux rootfs releases](https://github.com/stffrdhrn/or1k-rootfs-build/releases) - For rootfs images of busybox and buildroot

Have a look at the readme documentation in [or1k-utils](https://github.com/stffrdhrn/or1k-utils/tree/master) for pointers on
how the rootfs images are be used.  We are working on some comprehensive tutorials to also help bring this all together.

The current toolchains available are built with:

 * GCC 16.1.0
 * Binutils 2.46.0
 * GDB 17.1
 * Linux (headers) : 6.18.22
 * [Newlib](https://sourceware.org/newlib/) (elf toolchain) : 4.6.0.20260123
 * [Musl](https://www.musl-libc.org) (linux-musl toolchain) : 1.2.6
 * [Glibc](https://www.gnu.org/software/libc/) (linux-gnu toolchain) : 2.43

The current rootfs images available are build with:

 * [busybox](https://busybox.net) 1.37.0
 * [buildroot](https://buildroot.org) 2026.05

You can checkout the release pages above for details on the release notes.  We have fixed up a
fwe significant bugs in the GCC releases so upgrades in highly recommended for any serious work.

Also, we have been hard at work at updating our [Tutorials](https://openrisc.io/tutorials/) to be
more useful.  The tutorials leverage the toolchains and rootfs images to bring up QEMU simulators
and FPGA boards including multicore SMP systems.
