---
layout: page
title: System-on-Chip
tagline:
group: navigation
weight: 5
---
{% include JB/setup %}

## <a id="fusesoc" /> FuseSoC

## <a id="orpsoc" /> ORPSoC

## <a id="minsoc" /> minSoC

## <a id="optimsoc" /> OpTiMSoC

## <a id="misoc" /> MiSoC

### Summary

 * License: [BSD 2-Clause License](https://opensource.org/licenses/BSD-2-Clause)
 * Language: [Migen](https://m-labs.hk/gateware.html)
 * Status: Under active development

### Description

Built on Migen, MiSoC provides a high performance, flexible and
lightweight solution to build system-on-chips for various
applications.

 * CPU options:
   * LatticeMico32, modified to include an optional MMU (experimental).
   * mor1kx, a better OpenRISC implementation.
 * High performance memory controller capable of issuing several SDRAM
   commands per FPGA cycle.
 * Supports SDR, DDR, LPDDR and DDR2.
 * Provided peripherals: UART, GPIO, timer, GPIO, NOR flash
   controller, SPI flash controller, Ethernet MAC, and more.
 * High performance: on Spartan-6, 83MHz system clock frequencies,
   10+Gbps DDR SDRAM bandwidth, 1080p 32bpp framebuffer, etc.
 * Low resource usage: basic implementation fits easily in Spartan-6 LX9.
 * Portable and easy to customize thanks to Python- and Migen-based
   architecture.
 * Design new peripherals using Migen and benefit from automatic CSR
   maps and logic, simplified DMAs, etc.
 * Possibility to encapsulate legacy Verilog/VHDL code.

### Links

 * [Website](https://m-labs.hk/gateware.html)
 * [Code Repository](https://github.com/m-labs/misoc)
 * [Mailing List](https://ssl.serverraum.org/lists/listinfo/devel)

