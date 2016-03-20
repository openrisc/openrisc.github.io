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

* [or1k-elf](#baremetal-software) for bare metal use, based on the
  newlib library.

* or1k-linux-uclibc for [Linux](#linux) application use, based on the
  uClibc library.

* [or1k-linux-musl](#musl-toolchain) for [Linux](#linux) application
  use, based on the musl library. (recommended over uClibc)

* [or1k-rtems*](#rtems-toolchain) for building software that runs on
  the [RTEMS](#rtems) operating system.

To run multiple applications in parallel and to use their rich
features there is an up-to-date support for a few operating systems:

* [Linux](#linux) is a widely used general purpose operating system.

* [RTEMS](#rtems) is a real-time operating system for embedded
  systems.

## Baremetal Software

A cross-compiler toolchain is used to compile your software code for
the OpenRISC processor. The toolchain is executed on the the host
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

* [GCC](https://gcc.gnu.org): GCC is the compiler that translates
  C/C++ to programs or libraries. The GCC project does not support
  OpenRISC by default, but instead it is required to build GCC from
  our own cloned [repository](https://github.com/openrisc/or1k-gcc).

* [GDB](https://www.gnu.org/s/gdb/): The debugger is used to find and
  fix bugs in programs running on the target platform. The GDB project
  does not support OpenRISC by default, but instead our cloned
  [repository](https://github.com/openrisc/binutils-gdb) must be used.

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

## Operating Systems

### Linux

TODO

#### musl Toolchain

The [musl toolchain]() is the preferred toolchain for build programs
that should run on Linux. The exceptions to this is software that
depend on extensions only found in glibc. For example, building Debian
requires glibc.

You can download prebuilt toolchains
[here](https://github.com/openrisc/musl-cross/releases) or build it
yourself following
[these instructions](https://github.com/openrisc/musl-cross/wiki).

### RTEMS

The [RTEMS](http://www.rtems.org) port was dead for a few years, but
has been re-established in 2014 during a Google Summer of Code
project. The student documented his work in his
[blog](http://heshamelmatary.blogspot.de/2014/08/gsoc-2014-porting-rtems-to-openrisc.html)
and the work is part of the RTEMS project now.


