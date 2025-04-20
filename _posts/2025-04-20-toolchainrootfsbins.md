---
layout: post
title: "New Toolchain and rootfs Binaries"
description: ""
category: 
tags: []
author: Stafford Horne
---
{% include JB/setup %}

We have created a new toolchain and rootfs build processes to deliver
compiler and software binaries from upstream stable releases.

You can access them via links on our [software](http://openrisc.io/software) page.
Or easily access them here:

 [Toolchain releases](https://github.com/stffrdhrn/or1k-toolchain-build/releases) - For binaries of newlib, glibc and musl toolchains.
 [Linux rootfs releases](https://github.com/stffrdhrn/or1k-rootfs-build/releases) - For rootfs images of busybox and buildroot

Have a look at the readme documentation in [or1k-utils](https://github.com/stffrdhrn/or1k-utils/tree/master) for pointers on
how the rootfs images are be used.  We are working on some comprehensive tutorials to also help bring this all together.

The current toolchains available are built with:

 * GCC 14.2.0
 * Binutils 2.43.1
 * GDB 16.2
 * Linux (headers) : 6.12.21
 * [Newlib](https://sourceware.org/newlib/) (elf toolchain) : 4.5.0.20241231
 * [Musl](https://www.musl-libc.org) (linux-musl toolchain) : 1.2.5
 * [Glibc](https://www.gnu.org/software/libc/) (linux-gnu toolchain) : 2.41

The current rootfs images available are build with:

 * [busybox](https://busybox.net) 1.37.0
 * [buildroot](https://buildroot.org) 2025.02

In the past we hosted toolchain binaries in different spots such as `openrisc/newlib`
or `oppenrisc/gcc-or1k`.  These were using development patches that have since all been
merged upstream.  Now, that all of our software is upstream we can release as stable
upstream binaries are released.

You can also check out the [bootlin cross-compiler toolchains](https://toolchains.bootlin.com)
for recent toolchains built with the buildroot build system.  They provide
glibc, musl as well as ucLibc-ng toolchain builds.
