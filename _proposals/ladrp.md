---
layout: proposal
title: ORBIS64/ORFPX64 Additions - l.adrp (P9)
category: draft
date: 2015-03-06 16:41
author: Rth
---

We need an efficient method of forming 64-bit addresses.  The fact that this will improve
-fpic code generation in 32-bit mode too is an added bonus.

<pre>
31    26   21   0
[ 0x03 | rD | N ]

rD <- exts(Immediate << 13) + (InsnAddr & -8192)
</pre>

That is, it computes the address of the page of the target from the address of the page of the insn.
The balance of the address is the 13 bit page offset, computable at link time.
This can be added to the page in several ways:

<pre>
l.adrp  r3, foo
l.ori   r4, r3, po(foo)
l.lbz   r5, po(foo)(r3)
l.sb    po(foo)(r3), r6
</pre>

Where the assembler function "po" (page offset) produces the new relocations.

