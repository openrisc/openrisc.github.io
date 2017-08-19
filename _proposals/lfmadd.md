---
layout: proposal
title: ORFPX32/ORFPX64 - lf.madd (P6)
category: draft
date: 2015-03-06 21:57
author: Rth
---

The description of these instructions needs to make it clear that the result is computed without
intermediate rounding.  See the ISO C 99 functions fma and fmaf.

With no other changes, this would suggest a definition of

<pre>
rD <- rD + rA * rB
</pre>

However, there's nearly room in the instruction set to make this a full 3-operand insn.
The bits at fault are l.cust1.s, l.cust1.d, whose opcode spills over into bit 6.  As I doubt there
are any users of these opcodes, I propose removing them.  One can always use one of the l.cust*
major opcodes to interact with your custom fp hardware.

This lets us define a family of madd instructions as 

<pre>
31    26  21  16  11   6     0
[ 0x32 | D | A | B | C | opc ]

Mnemonic  NegA  NegP  BaseOpc
-----------------------------
lf.madds  0     0     0b000111
lf.msub   1     0     0b100000
lf.nmadd  0     1     0b100001
lf.nmsub  1     1     0b100011

Define inv(x,y) to return x with the sign-bit xor'd with y

rD <- (rA * inv(rB,NegP)) + inv(rC,NegA)
</pre>

