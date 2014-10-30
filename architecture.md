---
layout: page
title: Architecture
tagline: 
group: navigation
weight: 2
---
{% include JB/setup %}

The OpenRISC 1000 architecture is a completely open architecture. It
defines the architecture of a family of open source, RISC
microprocessor cores. The OpenRISC 1000 architecture allows for a
spectrum of chip and system implementations at a variety of
price/performance points for a range of applications. It is a
32/64-bit load and store RISC architecture designed with emphasis on
performance, simplicity, low power requirements, and scalability.
OpenRISC 1000 targets medium and high performance networking and
embedded computer environments.

Performance features include a full 32/64-bit architecture; vector,
DSP and floating-point instructions; powerful virtual memory support;
cache coherency; optional SMP and SMT support, and support for fast
context switching. The architecture defines several features for
networking and embedded computer environments. Most notable are
several instruction extensions, a configurable number of
general-purpose registers, configurable cache and TLB sizes, dynamic
power management support, and space for user-provided instructions.

Most OpenRISC implementations are designed to be modular and
vendor-independent. They can be interfaced with other open-source
cores, e.g., available at www.opencores.org. The OpenRISC community
encourages third parties to design and market their own
implementations of the OpenRISC 1000 architecture and to participate
in further development of the architecture.

## Basic Features

The OpenRISC instruction set architecture (ISA) is a simple RISC
architecture with the following features:

 - Linear 32-bit or 64-bit address space (currently no 64-bit
   implementations)

 - Uniform-length instructions (32-bit instructions aligned at 32-bit
   boundaries)

 - ORBIS32/64: Basic instruction set (load/store, arithmetic, logical,
   ..) operating on 32-bit/64-bit data

 - ORVDX64: Vector/DSP extensions (SIMD) operating on 8-, 16-, 32- and
   64-bit data

 - ORFPX32/64: Floating point extensions operating on 32-bit/64-bit

 - Two simple adressing modes: Register indirect with displacement and
   PC relative