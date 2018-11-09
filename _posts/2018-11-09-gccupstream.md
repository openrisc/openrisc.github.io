---
layout: post
title: "GCC Upstream for 9.0.0"
description: ""
category:
tags: []
author: Stafford Horne
---
{% include JB/setup %}

We are proud to announce that the OpenRISC port for [gcc](https://www.gnu.org/software/gcc/)
has been committed to upstream.

Mainline OpenRISC support will be available in the upcoming 9.0.0 release of GCC.

Note, this has been a clean room rewrite of the OpenRISC gcc port.  The old port
can still be found in the [OpenRISC github repo](https://github.com/openrisc/or1k-gcc/branches).  Pre-release toolchain binaries for
the new toolchain can be found on [Stafford's github releases](https://github.com/stffrdhrn/gcc/releases/tag/or1k-9.0.0-20181106) page.

There are a few things still not supported in this new port which were available
the previous port.  The current upstream OpenRISC GCC does not have support for:

 - `or1knd` (No-branch delay) targets
 - hardware FPU (floating point unit)

If you have any requests of would like to help out please contact us on the [mailing list](/community).
