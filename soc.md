---
layout: page
title: System-on-Chip
tagline:
group: navigation
weight: 5
---
{% include JB/setup %}

## <a id="fusesoc" /> FuseSoC

### Summary

 * License: [GPL v3](https://opensource.org/licenses/GPL-3.0)
 * Language: Python (imports both Verilog and VHDL cores)
 * Status: Under active development

### Description

FuseSoC is a package manager and a set of build tools for HDL
(Hardware Description Language) code.

Its main purpose is to increase reuse of IP (Intellectual Property)
cores and be an aid for creating, building and simulating SoC
solutions.

The package manager part can be seen as an apt, portage, yum, dnf,
pacman for FPGA (Field-Programmable Gate Array)/ASIC
(Application-Specific Integrated Circuit) IP cores.  A simple ini file
describes mainly which files the IP core contains, which other IP
cores it depends on and where FuseSoC shall fetch the code.

A collection of cores together with a top-level is called a system,
and systems can be simulated or passed through the FPGA vendor tools
to build a loadable FPGA image.

Currently FuseSoc supports simulations with ModelSim, Icarus Verilog,
Verilator, Isim and Xsim. It also supports building FPGA images with
Xilinx ISE and Altera Quartus.

### <a id="orpsoc" /> Links

 * [Website](http://fusesoc.net)
 * [Code Repository](https://github.com/olofk/fusesoc)
 * [Cores Repository (ORPSoC)](https://github.com/openrisc/orpsoc-cores)
 * [Cores Repository (FuseSoC)](https://github.com/fusesoc/fusesoc-cores)

## <a id="litex" /> LiteX

### Summary

 * License: [BSD 2-Clause License](https://opensource.org/licenses/BSD-2-Clause)
 * Language: [Migen](https://m-labs.hk/gateware.html), Python
 * Status: active development

### Description

Also built on Migec, The LiteX framework provides a convenient and efficient
infrastructure to create FPGA Cores/SoCs, to explore various digital design
architectures and create full FPGA based systems.

### Links

 * [Enjoy Digital](http://www.enjoy-digital.fr)
 * [Code Repository](https://github.com/enjoy-digital)
 * [Litex Hub](https://github.com/litex-hub)

## <a id="minsoc" /> minSoC

### Summary

 * License: [LGPL v3](https://opensource.org/licenses/LGPL-3.0)
 * Language: Verilog
 * Status: Apparently not well maintained anymore ([Wiki link](https://www.minsoc.com/) dead, no public SCM anymore)

### Description

minSoC is a minimal OpenRISC-based system-on-chip, that is easy to configure and implement, but still uses the OR1200 processor implementation.

### Links

 * [Original, old Code Repository](https://opencores.org/projects/minsoc)
 * [New Homepage](https://www.allaboutcircuits.com/ip-cores/system-on-chip/minsoc/)

## <a id="optimsoc" /> OpTiMSoC

### Summary

 * License: [MIT](https://opensource.org/licenses/MIT)
 * Language: Verilog
 * Status: Limited development

### Description

OpTiMSoC is a flexible multicore system-on-chip that is based on a network-on-chip and connects a configurable number of OpenRISC (mor1kx) processors to arbitrarily large platforms.

### Links

 * [Homepage](https://optimsoc.org/)
 * [Code Repository](https://github.com/optimsoc/optimsoc)

## <a id="misoc" /> MiSoC

### Summary

 * License: [BSD 2-Clause License](https://opensource.org/licenses/BSD-2-Clause)
 * Language: [Migen](https://m-labs.hk/gateware.html)
 * Status: Limited development

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
