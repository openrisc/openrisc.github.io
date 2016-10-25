---
title: ORBIS64/ORFPX64 Additions - l.movl, l.addl (P10)
category: draft
date: 2015-03-06 17:40
author: Rth
---

We need an efficient method of forming 64-bit constants.  Currently it takes 5 insns and two registers,
or 6 insns and one register to form a full 64-bit constant.  Propose extending opcode 0x06 (l.movhi/l.macrc)
to be able to form a 64-bit constant (or add a 64-bit displacement!) in only 4 insns:

<pre>
31    26   21  20  19  18    17    16     0
[ 0x06 | rD | A | U | L | SH1 | SH2 |  K  ]

shift = (SH1:~SH2) << 4
lower = (L << shift) - 1
const = exts(U:K) << shift | lower
input = (A ? rD : 0)                /* l.addl vs l.movl */

rD <- input + const
</pre>

The strange encoding of the shift count (SH1:~SH2) is due to being backward compatible with l.movhi.
By representing the low bit of the shift inverted, we map (0b00) -> 16.

The U ("upper") and L ("lower") bits produce all ones above and below the shifted K, respectively.
Note that the concatenation of U and K essentially forms a 17-bit signed constant.
This allows the easy formation of both large negative numbers and powers-of-two-minus-one.  E.g.

<pre>
l.movl  r3, 0xfffffffff0600000  (U=1,L=0,SH=16,K=0xf060 : -262144000)
l.movl  r3, 0x00007fffffffffff  (U=0,L=1,SH=32,K=0x7fff)
l.movl  r3, 0xffff0000ffffffff  (U=1,L=1,SH=32,K=0x0000)
</pre>

Note that because of the conflict with the existing l.macrc instruction, which overlaps with the SH2 bit,
one must ensure that one of A, U, or L is set when encoding SH=0 (0b00001).  Setting L is trivial, as it
makes no change to the constant produced; with a zero shift, "lower" is 0.

One can now form arbitrary 64-bit constants with one l.movl and three l.addl.

<pre>
l.movl  r3, 0x1234000000000000  (SH=48,K=0x1234)
l.addl  r3, 0x0000567800000000  (SH=32,K=0x5678)
l.addl  r3, 0x000000009abc0000  (SH=16,K=0x9abc)
l.addl  r3, 0x000000000000def0  (SH=00,K=0xdef0)
</pre>

Note that since the intent of l.addl is both constant formation and address arithmetic, no overflow
and carry bits will be computed.  If overflow or carry is desired, form the 64-bit constant into a
register and then use l.add.

