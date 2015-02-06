---
layout: page
title: Software
tagline:
group: navigation
weight: 4
---
{% include JB/setup %}

## Software Toolchains

### <a id="binutils" /> GNU Binutils

### <a id="gcc" /> GNU GCC

### <a id="llvm" /> LLVM

## Baremetal Software

### <a id="newlib" /> newlib Toolchain

<a href="https://sourceware.org/newlib/">Newlib</a> is a C library for
embedded systems. Our baremetal toolchain `or1k-elf` is built on it.
The library provides the basic functions like `printf` and memory
allocation. The `libgloss` is the part of newlib that does the actual
hardware handling: It configures the processor, the UART and sets the
stack according to the available physical memory. For this it depends
on some external symbols, which are defined by board libraries and may
be overwritten.

Beside the basic C library functionality, the `libgloss` port for
OpenRISC defines some helper functions for exception and interrupt
handling, timers and other peripherals. The latest releases and
documentation can be found on the <a
href="http://openrisc.github.io/newlib">newlib website</a>.

## Operating System

### <a id="linux" /> Linux

### <a id="linux" /> RTEMS

