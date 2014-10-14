---
layout: page
title: Wishlist
group:
---
{% include JB/setup %}

### Future work

We have a list of projects, some of which are currently in progress, and
some of which we want others to start work on.

OpenRISC is a very broad project and there is likely something to do for
any discipline. That said, below are some projects we have identified
and would like help solving.

### Why and How to Volunteer

Taking responsibility for maintaining a package is a great way to gain
experience of practical program management. If you are a student, or
early in your career, it adds important credibility to your resume. And
since it is all open source, your expertise can be publicly verified by
any potential employer.

To take part, post a message on the [mailing lists][], or email the
Release Manager, [Julius Baxter][] or come and talk to us on [IRC][].

### Project Ideas

#### OpenRISC System Creator

**Brief explanation:** OpenRISC project main problem is difficulty in
creating a full system design (CPU, switch, peripherals) and visualizing
them.

Task is to create a tool to solve this problem.

Several approaches are possible:

- You'll design Mercurial/Git/Npm like tool for OpenRISC system design.
By executing 'openrisc init' empty system will get created, by doing
'openrisc create switch' switch will be placed in the system etc..
Example:

` openrisc init`\
` openrisc create switch sw0`\
` openrisc create cpu -t or64k cpu0`\
` openrisc connect sw0.m0 cpu0.s_inst0`\
` openrisc connect sw0.m1 cpu0.s_data0`\
` `\
` etc`

- you'll pick and define DSL (Domain Specific Language) for system
description

- you'll use YAML/JSON as system description.

**Expected results:** Make it easier to create OpenRISC systems.

**Knowledge Prerequisite:** Any scripting language. System design and
computer architecture knowledge

**Mentor:** Wojciech Koszek <wkoszek@freebsd.czest.pl>

#### OpenRISC Web-based system for system visualization

**Brief explanation:** OpenRISC needs easy-to-use system for showing how
system looks like in a graphical way. Think of connecting boxes together
with each other on the schematics. There's no way to do this now in
OpenRISC, since there's no software.

**Expected results:** Goal is to:

- understand HW/SW elements in modern embedded systems.

- figure out in JQuery/Javascript/HTML5 how to write an application with
drag&drop capabilities to place CPU (1 box), Switch (1 box) and some
other blocks, and wire them all together. Then store this config in
memory somehow (JSON) and preserve it on the client side (LocalStorage
on HTML5) and submit it to the server.

- server should at least receive it

**Knowledge Prerequisite:** HTML5, Jquery, Graph/chart javascript
library (d3?)

**Mentor:** Wojciech Koszek <wkoszek@freebsd.czest.pl>

  [mailing lists]: OR1K:Community_Portal#Mailinglists "wikilink"
  [Julius Baxter]: mailto:julius@opencores.org
  [IRC]: OR1K:Community_Portal#IRC "wikilink"

#### OpenRISC package manager

**Brief explanation:**

If you look how most software people install packages, you'll see how
easy it is.

Hardware people don't have this notion of installation. Installing
Wishbone/OpenRISC modules is a whole bunch of pain and nostalgia.

The idea is to solve the problem with packages, so that constructing a
system would be easily possible by just typing couple of commands, which
would fetch RTL sources and prepare the blocks together for you, so you
can easily simulate them. RTL poses new challenges:

- upon fetching, stuff should be simulated and verified to meet the
specs

- it should be matched like shared libraries, since some versions of a
switch may not work with the CPU

- should be tagged: WishBone stuff can't work with AXI interconnect
stuff. It'd be nice to do:

`openriscpkg install openrisc`\
`openriscpkg install wb_mux`\
`openriscpkg install wb_uart`\
`openriscpkg sim wb_mux`\
`openriscpkg package wb_mux`

**Knowledge Prerequisite:**

Any scripting language.

System design and computer architecture knowledge

Understanding of Verilog

Willingness to learn of Wishbone architecture

#### OpenRISC FreeBSD OS port

**Brief explanation:**

Linux is the only operating system running on OpenRISC. Proposal is to
offer alternative software stack for OpenRISC users by porting FreeBSD
OS to OpenRISC.

Task would involve:

-   running or1ksim and getting basic Hello world running
-   installing FreeBSD in VM
-   porting FreeBSD to 'accept' new OpenRISC toolchain on FreeBSD
-   making OpenRISC toolchain work
-   porting FreeBSD kernel to OpenRISC

MVP for this product would be minimal kernel that can boot inside of
OR1KSIM and print something on UART. We'd expect kernel should reach
driver execution stage.

**Knowledge Prerequisite:**

Advanced ANSI C knowledge

OS design and architecture.

Computer architecture

Compiler understanding

#### Linux kernel VDSO support

**Brief explanation:** Syscalls are expensive. VDSO helps speeding this
up.

This is probably a small project. For GSoC it might be suitable to
combine with other projects.

Since or1k does not contain any atomic operations these are implemented
as syscalls. With VDSO these should perform much faster.

**Expected results:** Faster syscalls, better multi-threaded
performance.

**Knowledge Prerequisite:** C, How to build a Linux kernel

**Mentor:** Christian 'bluecmd' Svensson

#### Extend language support for OpenRISC

**Brief explanation:** OpenRISCs GCC disables languages such as Go,
Java, D etc. This project would be to:

-   Find out what kind of work is needed to make these languages
    available (libffi for one).
-   Prioritize with the community.
-   Start implementation of dependencies and the language support.
-   Set up regression testing.
-   Document usage and caveats.

**Expected results:** Increase programming languages available on
OpenRISC.

**Knowledge Prerequisite:** C, Linux internals

**Mentor:** Christian “bluecmd” Svensson

#### GDB for Linux

**Brief explanation:** GDB running in userspace for Linux is in a weird
state.

As far as bluecmd knows GDB should work on bare metal, but not for
userspace Linux. It would be good to clean this up, make it work and
upstream it.

The project would be something like this:

-   Find out what works and does not work with the GDB as it is today
-   Fix GDB
-   Set up automatable regression testing
-   Document how to use
-   Upstream the patches

**Expected results:** GDB running on OpenRISC under Linux

**Knowledge Prerequisite:** C, Linux internals

**Mentor:** ? (maybe bluecmd)

#### Port libffi/gobject-introspection/with friends

**Brief explanation:** This project would be to take a look on how to
port libraries that needs to know stuff about the machine it's running
under. Libffi and gobject-introspections are two examples of this.

libffi provides interfaces to C functions for programs like Python. Not
having it is a bit of a pain.

GObject-introspection is a C wrapper for GNOME objects. It is rumored
that this is a bit tricky to port, but that is only rumor.

This is a smaller project, possibly part of the **Extend language
support** project. Some work has been started by Sebastian Macke:
<https://github.com/s-macke/libffi>

**Expected results:** Wider support and more software available

**Knowledge Prerequisite:** C

**Mentor:** Christian “bluecmd” Svensson

#### Updated to support OR1K 1.0 versioning system

**Brief explanation:** The various implementations (mainly OR1200,
or1ksim) need to be updated to support the versioning system which is
new to OR1K version 1.0.

Specifically, VR2 and ISRs should be implemented and containing
meaningful values.

Any software bundled with these implementations, and the libraries such
as newlib, should be updated, too (at the very least the spr-defs.h
files should be updated - patches for this do exist but need to be
committed.)

Once models look to be working OK with the new versioning scheme, things
like the Linux kernel port should be updated to support the new system.

**Expected results:** ?

**Knowledge Prerequisite:** ?

**Mentor:** ?

#### Upstreaming toolchains

**Brief explanation:** Our toolchains are looking better and better. A
bigger and bigger issue is having to merge with upstream. It would be
very nice if we could come up with a plan and begin merging the work
with upstream.

A big part of this is to figure out what code is used and written by
whom. We have revision histories spanning back to when CVS was used,
over to SVN and finally Git.

**Expected results:**

-   Easy usage for people, no need to pull patches from our
    repositories.
-   Less administrative burden for OpenRISC.
-   Needed for stuff like Debian.

**Knowledge Prerequisite:** Revision Control Systems

**Mentor:** ?

#### Match specification to implementation

**TODO: FORMAT TO TEMPLATE**

The objective is to bring OR1200 specification document into line with
what is actually in the RTL. A few sections still need going over (debug
interface, for one.)

This task is being handled by [Yann Vernier][] [[mailto:yann@orsoc.se][]
yann@orsoc.se].

#### Add multiple associativity to cache and MMU

**TODO: FORMAT TO TEMPLATE**

This is being led by [Michael Unneback][] (<michael@orsoc.se>).

  [Yann Vernier]: User:Yann "wikilink"
  [mailto:yann@orsoc.se]: mailto:yann@orsoc.se
  [Michael Unneback]: User:Unneback "wikilink"
