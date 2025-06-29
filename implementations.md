---
layout: page
title: Implementations
tagline: RTL & Simulators
group: navigation
weight: 3
---
{% include JB/setup %}

Several implementations of the OpenRISC architecture exist. In the
following we will summarize the most well known.

## Hardware Implementations

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
 - It is licensed under the [CERN Open Hardware Licence Version 2](https://ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-version-2)
   which is suited for open hardware
 - It's implementation is highly reconfigurable allowing to be resized to meet
   target size and performance requirements.
 - It has
   [docs](https://github.com/openrisc/mor1kx/blob/master/doc/mor1kx.asciidoc)
   that explain the overall design.

In 2014 the author, Julius Baxter, gave the following presentation about mor1kx
which goes into detail about the motivation for the processor rewrite and
architecture.

The source code can be found on github at
[openrisc/mor1kx](https://github.com/openrisc/mor1kx)

To build a system with mor1kx have a look at some of the hardware platform
[tutorials]({{BASE_PATH}}/tutorials/).

### <a id="marocchino" /> marocchino

The marocchino OpenRISC implementation also has the advanced features of
the mor1kx.  The marocchino then expands on this with more advanced features:

 - A 64-bit FPU implementing OpenRISC's ORFPX64A32 extension.
 - It implements an Out-of-order pipeline which helps to avoid pipeline stall's
   providing higher execution performance.

The source code can be found on github at
[openrisc/or1k_marocchino](https://github.com/openrisc/or1k_marocchino)

Stafford Horne has written a few blog articles on how to use marocchino and it's
design.  Check them out:

 - [Marocchino in Action](http://stffrdhrn.github.io/hardware/embedded/openrisc/2019/06/11/or1k_marocchino.html) -
   how to boot up the marocchino processor.
 - [Marocchino Pipeline](http://stffrdhrn.github.io/hardware/embedded/openrisc/2019/07/18/or1k_marocchino_instruction_pipeline.html) -
   an overview of the marocchino architecture.
 - [Marocchino a Tomasulo Implementation](http://stffrdhrn.github.io/hardware/embedded/openrisc/2019/10/21/or1k_marocchino_tomasulo.html) -
   a deep dive into the marocchino Tomasulo algorithm implementation.

## System Simulators

### <a id="or1ksim" /> or1ksim

Or1ksim is a generic OpenRISC 1000 architecture simulator capable of emulating OpenRISC
based computer systems at the instruction level. It includes models of a range of
peripherals, allowing complete systems to be modeled.

#### Links
   * [openrisc/or1ksim](https://github.com/openrisc/or1ksim) - github repo
   * [openrisc/or1ksim/releases](https://github.com/openrisc/or1ksim/releases) - binary releases

### <a id="qemu" /> qemu

QEMU is a cpu emulator that supports many cpu targets.  OpenRISC has been
supported since version 1.2.

#### Links
   * [qemu.org](http://wiki.qemu.org/Main_Page) - QEMU home

