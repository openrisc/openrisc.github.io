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

OR1200 is the original implementation of the OpenRISC 1000 architecture.

The source code can be found on github at 
[openrisc/or1200](https://github.com/openrisc/or1200).

### <a id="mor1kx" /> mor1kx

<div style="float: right; margin: 12px;">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/uYRWFN-ii68" frameborder="0" allowfullscreen></iframe>
</div>

The mor1kx is pretty much a drop in replacement for the original or1200 processor
but it has its advantages.

 - It follows, in our opinion, better coding standards compared to the or1200
 - It is licensed under the [OHDL](http://juliusbaxter.net/ohdl/) which is 
   suited for open hardware
 - It implementation is highly reconfigurable allowing to be resized to meet 
   target sixe and performance requirements.
 - It has 
   [docs](https://github.com/openrisc/mor1kx/blob/master/doc/mor1kx.asciidoc) 
   that explain even more

In 2014 the author, Julius Baxter, gave the following presentation about mor1kx
which goes into detail about the motivation for the processor rewrite and
architecture.

The source code can be found on github at 
[openrisc/mor1kx](https://github.com/openrisc/mor1kx)

To build a system with mor1kx have a look at the some of the hardware
[tutorials]({{BASE_PATH}}/tutorials.html) or have a look at some of the 
systems available in [orpsoc-cores](https://github.com/openrisc/orpsoc-cores)
which can be built with [FuseSoC]({{BASE_PATH}}/soc.html#fusesoc).

## System Simulators

### <a id="or1ksim" /> or1ksim

Or1ksim is a generic OpenRISC 1000 architecture simulator capable of emulating OpenRISC 
based computer systems at the instruction level. It includes models of a range of 
peripherals, allowing complete systems to be modelled.

#### Links
   * [openrisc/or1ksim](https://github.com/openrisc/or1ksim) - github repo

### <a id="qemu" /> qemu

QEMU is a cpu emulator that supports many cpu targets.  OpenRISC has been
supported since version 1.2.

#### Links
   * [qemu.org](http://wiki.qemu.org/Main_Page) - QEMU home

