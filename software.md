---
layout: page
title: Software
tagline:
group: navigation
weight: 4
---
{% include JB/setup %}

For building your own software, OpenRISC is supported by a 32-bit GNU
toolchain offering C and C++ support. The toolchain is available in
several forms, depending on your use case:

* [or1k-elf](#newlib-toolchain) for bare metal use, based on the
  newlib library.

* [or1k-linux-uclibc](#uclibc-ng-toolchain) for [Linux](#linux) application use, based on the
  uClibc-ng library.

* [or1k-linux-gnu](#glibc-toolchain) for [Linux](#linux) application use, based on the
  GNU libc library.

* [or1k-linux-musl](#musl-toolchain) also for [Linux](#linux) application
  use, based on the musl library. (recommended over uClibc)

* [or1k-rtems](#rtems-toolchain) for building software that runs on
  the [RTEMS](#rtems) operating system.

To run multiple applications in parallel and to use their rich
features there is an up-to-date support for a few operating systems:

* [Linux](#linux) is a widely used general purpose operating system.

* [RTEMS](#rtems) is a real-time operating system for embedded
  systems.

To build multiple applications you may want a easy to use build system
like:

* [buildroot](#buildroot) makefiles and patches to build a complete bootable
  Linux system.

* [OpenADK](#openadk) also a system to build a complete bootable Linux system
  with applications.  Has good support for OpenRISC.

## Toolchains

A cross-compiler toolchain is used to compile your software code for
the OpenRISC processor. The toolchain is executed on the host
computer and generates a program or library that can be executed on
the processor then. There is a baremetal toolchain that is based on
the [Newlib](https://sourceware.org/newlib/) C library. Other
toolchains to compile programs to be run on an operating system can be
found below.

### Basic Tool and Compiler Support

Some basic tools form an actual toolchain:

* [Binutils](https://www.gnu.org/s/binutils/): Binutils contains tools
  needed for linking programs and libraries, compiling assembler code
  etc. The binutils distribution contains support for OpenRISC
  (`or1k`). Beside this a development
  [repository](https://github.com/openrisc/binutils-gdb) is used to
  test new features before submitting it to the binutils project.
  The latest stable releases can be found on the GNU binutils website.

* [GCC](https://gcc.gnu.org): GCC is the compiler that translates
  C/C++ to programs or libraries. The GCC project has support for
  OpenRISC `or1k`.  Historical development, binaries and experimental
  features are available in our development [repository](https://github.com/openrisc/or1k-gcc).
  The latest stable releases can be found on the GNU GCC website.

* [GDB](https://www.gnu.org/s/gdb/): The debugger is used to find and
  fix bugs in programs running on the target platform. The gdb distribution
  contains support for OpenRISC (`or1k`). An OpenRISC development
  [repository](https://github.com/openrisc/binutils-gdb) is used to test
  new features and share with the community before submitting to the upstream
  gdb project.
  The latest stable releases can be found on the GNU GDB website.

### Newlib Toolchain

[Newlib](https://sourceware.org/newlib/) is a C library for embedded
systems. Our baremetal toolchain `or1k-elf` is built on it.  The
library provides the basic functions like `printf` and memory
allocation. The `libgloss` is the part of newlib that does the actual
hardware handling: It configures the processor, the UART and sets the
stack according to the available physical memory. For this it depends
on some external symbols, which are defined by board libraries and may
be overwritten.

Beside the basic C library functionality, the `libgloss` port for
OpenRISC defines some helper functions for exception and interrupt
handling, timers and other peripherals. The latest releases and
documentation can be found on the
[or1k-elf newlib website](http://openrisc.github.io/newlib).

You can download prebuilt toolchains [here](https://github.com/stffrdhrn/or1k-toolchain-build/releases)
or build it yourself following
[these instructions](https://openrisc.io/newlib/building.html).

### musl toolchain

The [musl toolchain](https://www.musl-libc.org) is the preferred toolchain
for building programs that should run on Linux. The exceptions to this is
software that depend on extensions only found in glibc. For example,
building Debian requires glibc.

You can download prebuilt toolchains [here](https://github.com/stffrdhrn/or1k-toolchain-build/releases)
or build it yourself following
[these instructions](https://github.com/richfelker/musl-cross-make).

Also, the team that creates [buildroot](https://buildroot.org) provide
[bootlin cross-compiler toolchains](https://toolchains.bootlin.com).  These
offer both stable and bleeding edge musl versions.

### uClibc-ng Toolchain

The [uClibc-ng toolchain](https://uclibc-ng.org) is a reboot of the uClibc
project which also is for building programs that should run on Linux.  It has
good support for OpenRISC and is more compatible with glibc, meaning you can
easily compile more applications for it compared to musl.

You can download prebuilt toolchains [here](https://github.com/stffrdhrn/or1k-toolchain-build/releases).
Or you can download and build it yourself following
[these instructions](https://uclibc-ng.org/docs/).

Also, the team that creates [buildroot](https://buildroot.org) provide
[bootlin cross-compiler toolchains](https://toolchains.bootlin.com).  These
offer both stable and bleeding edge uClibc-ng versions.

### <a id="glibc-toolchain" /> GNU C Library (glibc) Toolchain

The [glibc toolchain](https://www.gnu.org/software/libc/) is available for OpenRISC
since version 2.35.  This toolchain provides a fully featured C system API including
internationalization, 64-bit time and filesystem support.

You can download prebuilt toolchains [here](https://github.com/stffrdhrn/or1k-toolchain-build/releases).
You can download and build it yourself following
[these instructions](https://github.com/jueve/build-glibc).


Also, the team that creates [buildroot](https://buildroot.org) provide
[bootlin cross-compiler toolchains](https://toolchains.bootlin.com).  These
offer both stable and bleeding edge GNU libc versions.

## Operating Systems

### Linux

The [Linux](http://kernel.org) operating system should need no introduction. The
support for OpenRISC is stable.

See our tutorials on [compiling and running Linux](https://github.com/openrisc/tutorials/blob/master/docs/Linux.md)
on OpenRISC.

### RTEMS

The [RTEMS](http://www.rtems.org) port was dead for a few years, but
has been re-established in 2014 during a Google Summer of Code
project. The student documented his work in his
[blog](http://heshamelmatary.blogspot.de/2014/08/gsoc-2014-porting-rtems-to-openrisc.html)
and the work is part of the RTEMS project now.


## Applications

### Buildroot

The [Buildroot](https://buildroot.org) project provides a build system cross compiling
and packaging multiple applications for your embedded project.  This means instead
of you having to go and download tarballs and run `./configure && make && make install`
and chase down build failures you have an nice tool to do it all for you.

Buildroot supports building and packaging applications for Linux using
uClibc-ng, musl and the GNU C Library (glibc).

### OpenADK

The [OpenADK](https://openadk.org) project comes from the maintainers of `uClibc-ng` and
is also a embedded Linux construction kit.  The team is active in the OpenRISC
community so you can expect good support.

It supports both musl and uClibc-ng.
