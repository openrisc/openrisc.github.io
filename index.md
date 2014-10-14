---
layout: page
title: OpenRISC
tagline: Project Overview
---
{% include JB/setup %}

Welcome to the project overview of the OpenRISC project. The major
goal of the project it to create a free and open processor for
embedded system. This includes:

- a free and open RISC instruction set architecture with DSP features

- a set of free, open source implementations of the architecture

- a complete set of free, open source software development tools,
  libraries, operating systems and applications

- a variety of system-on-chip and system simulators

The project is driven by a very active community and has a long
history. This unfortunately lead to scattered and partly outdated
information. The goal of this page is to provide an overview over
active parts of the project and the current development to ease the
enty for newcomers or people seeking basic information. The
information is collected from the following sites where you can find
more information (which can be partly outdated):

- [The OpenRISC pages at opencores.org](http://opencores.org/or1k/Main_Page)

- [openrisc.net](http://www.openrisc.net)

- [The github projects](https://www.github.com/openrisc)

## Quick start

<div style="float: right">
    <img src="{{ BASE_PATH }}/assets/jor1k-screenshot.png" width="300px" margin="10px"/>
</div>

### The very quick start: jor1k

There is an interesting project in case you just want to try out the
OpenRISC in your browser: [jor1k](http://s-macke.github.io/jor1k/) is
an instruction set simulator written in javascript that boots Linux
inside your browser. You can play a game, watch some demos or surf the
internet using this emulator.

If that's not enough, feel free to compile your own code and run it in
the simulator. There also is a <a
href="http://s-macke.github.io/jor1k/compile.html">simple project</a>
where you can edit, compile and run inside the browser, so that you
don't even need a cross-compiler toolchain!

### Processor cores

There are two mainline processor core implementations:

- [OR1200]({{BASE_PATH}}/implementations.html#OR1200) is the original first
  implementation of the processor in Verilog. It implements the basic
  features and is still widely used, although not actively developed.

- [mor1k]({{BASE_PATH}}/implementations.html#mor1kx) is a novel
  implementation which is more sophisticated and has different
  variants with respect to the number of pipeline stages, tightly
  coupled memory or the presence of a delay slot. It has also been
  recently extended to support atomic operations and multicore
  features.

### System simulators

If you want to start with simulating the processor core to just try it
out, you have the following options:

- [or1ksim]({{BASE_PATH}}/implementations.html#or1ksim) is an
  instruction accurate simulator with a lot of features including
  flexbile configuration and gdb debugging.

- [qemu]({{BASE_PATH}}/implementations.html#qemu) has a patch to
  support the OpenRISC processor

### System-on-Chip

While a processor core is still the heart of every system, the
peripherals, memory etc. are of course equally important. There are a
number of system-on-chip available that you can use to perform RTL
simulations, SystemC simulations or perform an FPGA synthesis of an
OpenRISC-powered entire system:

- [fusesoc]({{BASE_PATH}}/soc.html#fusesoc) is a new SoC generator
  that not only supports OpenRISC. It also manages the available
  peripheral cores and allows you to easily configure and generate
  your system-on-chip.

- [orpsoc]({{BASE_PATH}}/soc.html#orpsoc) is the predecessor of fusesoc
  and the components are still partly used.

- [minsoc]({{BASE_PATH}}/soc.html#minsoc) is a minimal OpenRISC-based
  system-on-chip, that is easy to configure and implement, but still
  uses the OR1200 processor implementation.

- [OpTiMSoC]({{BASE_PATH}}/soc.html#optimsoc) is a flexible multicore
  system-on-chip that is based on a network-on-chip and connects a
  configurable number of OpenRISC (mor1kx) processors to arbitrarily
  large platforms.

### Operating Systems

If you want to run an operating system on your OpenRISC you have a few
options:

- [Linux]({{BASE_PATH}}/software.html#Linux) has been ported and is
  now upstream in the standard Linux repositories (upstream is the
  term that denotes that you submitted your changes to an open source
  project and they have been accepted and are now part of this
  software)

- [RTEMS]({{BASE_PATH}}/software.html#RTEMS) has been ported during a
  Google Summer of Code project and is also upstream.

### Toolchains

The following toolchains are generally supported:

- [GNU binutils]({{BASE_PATH}}/software.html#binutils) are the
  standard set of code generation and linking tools, which are also
  part of the upstream implementation.

- [GCC]({{BASE_PATH}}/software.html#gcc) is available and used to
  build different cross-compiler toolchains as described below.

- [LLVM]({{BASE_PATH}}/software.html#llvm) is a more modular compiler
  framework and the OpenRISC port is fastly improving.

A C library is an essential part of your toolchain as it provides you
the basic features. The following C libraries are available:

- [newlib]({{BASE_PATH}}/software.html#newlib) is a small library
  mainly used for baremetal usage. We also maintain a port of it for
  the baremetal toolchain `or1k-elf-gcc`

- [uClibc]({{BASE_PATH}}/software.html#newlib) is a similar small
  library and primarily used for Linux applications.
  `or1k-linux-uclibc-gcc` is the standard toolchain for Linux at the
  moment.

- [musl]({{BASE_PATH}}/software.html#musl) is a new C library with a
  strong emphasis on being leight-weight and correctness. There also
  is a full toolchain `or1k-linux-musl-gcc` supported.

## Latest news
<ul class="posts">  
  {% for post in site.posts limit:5 %}  
    <li>  
      <span><b>{{ post.date | date_to_string }}</b></span> &raquo;  
      <a href="{{ BASE_PATH }}{{ post.url }}">  
      <b>{{post.title}}</b></a><br/>
      <i>({{post.author}})</i> {{ post.content | strip_html | truncatewords: 50 }}..
      <a href="{{ BASE_PATH }}{{ post.url }}">  
      more</a><br/>
    </li>
  {% endfor %}  
</ul>

