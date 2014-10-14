---
layout: page
title: Source
tagline: Get and build OpenRISC tools
group:
---
{% include JB/setup %}

### Ubuntu OpenRISC VirtualBox image

The purpose with the [Ubuntu OpenRISC VirtualBox image][] is to make it
SUPER easy to get started with the OpenRISC processor platform, both
with hardware and software. The VirtualBox image contain the necessary
tools pre-installed for both hardware and software.

### Prepackaged versions

Various versions of the system compoenents are available prepackaged for
[download][].

### Repositories for latest versions

**NOTE: or32-\* target has been changed to or1k-\* / or1knd-\* in the
development versions.**

The very latest versions of both hardware and software are held in
revision controlled repositories.

There are three revision control systems that are being used to store
all source-code, GitHub, an SVN (subversion) system and a [Git][]
system. Currently they are not mirrors of each other, and host separate
parts of the project.

#### GitHub

Most of the code you will need can be found at
<https://github.com/openrisc>

-   or1k-gcc - GCC
-   or1k-src - binutils and GDB
-   or1ksim - Simulator for or1k
-   uClibc-or1k - uClibc

Instructions on building can be found here: [OpenRISC GNU toolchain][]

#### SVN repository

The SVN repository currently contains the following:

-   OR1200
-   [ORPSoC][]
-   [Or1ksim][] (OpenRISC architectural simulator)
-   GNU toolchain port source (stable, older version - newer development
    version is in git)
-   RTOS ports
-   OR Debug proxy source

Browse the SVN repository via the [web-SVN-GUI][].

Get a subversion checkout of the repository with

`svn co http://opencores.org/ocsvn/openrisc/openrisc/trunk`

**Note:** The checkout process may take a while. It may also fail to
completely checkout the repository - performing an SVN update will make
the checkout continue.

#### Git repository

The Git repository contains source code for the following blocks:

-   Linux kernel port
-   uClibc port

You may obtain the latest version from Git using:

`git clone git://openrisc.net/jonas/linux`\
`git clone git://openrisc.net/jonas/uClibc`

It's possible to browse the Git repository at [git.openrisc.net][]

  [Ubuntu OpenRISC VirtualBox image]: Ubuntu_VirtualBox-image_updates_and_information
    "wikilink"
  [download]: http://opencores.org/download,or1k
  [Git]: http://git-scm.com/about
  [OpenRISC GNU toolchain]: http://opencores.org/or1k/OpenRISC_GNU_tool_chain#Installation_of_development_versions
  [ORPSoC]: OR1K:Community_Portal#ORPSoC "wikilink"
  [Or1ksim]: Or1ksim "wikilink"
  [web-SVN-GUI]: http://opencores.org/websvn,listing,openrisc
  [git.openrisc.net]: http://git.openrisc.net
