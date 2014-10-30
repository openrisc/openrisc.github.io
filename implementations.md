---
layout: page
title: Implementations
tagline: 
group: navigation
weight: 3
---
{% include JB/setup %}

Several implementations of the OpenRISC architecture exist. In the
following we will summarize the most well known.

## Harware Implementations

The hardware implementations are full processor implementations
written in an [Hardware Description
Language](http://en.wikipedia.org/wiki/Hardware_description_language). Such
a description is either the input to a hardware synthesis, such as for
an ASIC or an FPGA, or for an RTL simulation.

Nevertheless, the processor cores are for themselves not running on
their own, but are complex IP blocks that at least need a clock and
reset signal and some memories connected to them. You can use one of
the popular [system-on-chip]({{BASE_PATH}}/soc.html) to try out the
processor cores.

### <a id="OR1200" /> OR1200

### <a id="mor1kx" /> mor1kx

## System Simulators

### <a id="or1ksim" /> or1ksim

### <a id="qemu" /> qemu
