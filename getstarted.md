---
layout: page
title: Tutorials
tagline: Get started
group: navigation
weight: 7
---
{% include JB/setup %}

## Official OpenRISC Tutorials

The OpenRISC tutorials aim to be a comprehensive guide to getting started with
an up-to-date development environment.

 - [Tutorials Home](/tutorials/index.html) - covers:
   - Quickstart with Docker Images
   - Toolchains - acquiring, building
   - Platforms - loading, running and debugging programs on:
     - Simulators
     - FuseSoC
     - Litex
   - Linux - running Linux and applications on:
     - Simulators
     - FuseSoC
     - Litex

## Around the Web

This section contains guides and information found around the web that help
OpenRISC users to get started more easily.  These have been put together by the
community.

Material for beginners to soft cores on FPGA:

-   Sven-Åke Andersson has written a comprehensive [blog on OpenRISC for newbies][],
    which offers a guide to the complete design flow.

Guides to the toolchain:

-   [Jeremy Bennett][]. [Embecosm Application Note 2][]. *The OpenCores
    OpenRISC 1000 Simulator and Tool Chain: Installation Guide*. Issue
    3, November 2008.

SystemC interfaces:

-   [Jeremy Bennett][]. [Embecosm Application Note 1][]. *Building a
    Loosely Timed SoC Model with OSCI TLM 2.0: A Case Study Using an
    Open Source ISS and Linux 2.6 Kernel.* Issue 2, May 2010.

Tutorials on how to implement OR1200 on Altera FPGA and Xilinx FPGA.
Credits go to [Resarch Group Digital Techniques][], Hogeschool voor
Wetenschap & Kunst, Campus de Nayer

-   Altera HW tutorial [PDF][].
-   Xilinx HW tutorial [PDF][1].

Tutorials on how to implement OR1200 on Xilinx and Altera FPGAs using
MinSoC.

-   MinSoC Tutorials openrisc on xilinx, [minsoc.com start][3]

Tutorials on compiling and running software in or1ksim:

-   Simple C program compilation and execution from rte.se: [Writing an application program][]

A Dynamic Reconfigurable OpenRISC Framework called Proteus : [Proteus
Framework][]

  [De0 Nano]:https://github.com/openrisc/tutorials/tree/master/de0_nano
  [Or1ksim]:https://github.com/openrisc/tutorials/tree/master/or1ksim
  [Jeremy Bennett]: https://web.archive.org/web/20160528191223/http://opencores.org/or1k/User:Jeremybennett
  [blog on OpenRISC for newbies]: https://web.archive.org/web/20181225174757/http://www.rte.se/blog/blogg-modesty-corex/openrisc-1200-soft-processor
  [Embecosm Application Note 2]: https://www.embecosm.com/appnotes/ean2/html/index.html
  [Embecosm Application Note 1]: https://www.embecosm.com/appnotes/ean1/html/index.html
  [Resarch Group Digital Techniques]: https://web.archive.org/web/20161029074149/http://emsys.denayer.wenk.be/
  [PDF]: /tutorials/docs/openrisc-HW-tutorial-Altera.pdf
  [1]: /tutorials/docs/openrisc-HW-tutorial-Xilinx.pdf
  [3]: https://web.archive.org/web/20170331103546/http://www.minsoc.com/1_0:start
  [Writing an application program]: https://web.archive.org/web/20160706154031/http://www.rte.se/blog/blogg-modesty-corex/writing-application-program
  [Proteus Framework]: https://web.archive.org/web/20151023123112/http://proteus-project.org/
