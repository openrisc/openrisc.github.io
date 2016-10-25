---
title: ORBIS64/ORFPX64 Additions - ACC instructions (P12)
category: draft
date: 2015-03-06 18:29
author: Rth
---

At present, the SPRs are defined to be 32-bits wide, which restricts the width of the MACHI:MACLO
accumulator register.  This is emphasized by the definition of the l.macrc instruction.  Further,
user-space access to MACHI and MACLO SPRs may be disabled by the kernel via SR[SUMRA].  Better to
introduce another method of performing double-word arithmetic and accumulation that does not depend
on SPRs at all.

For the purposes of discussion, name this set of instructions "ACC" (Alternate aCCumulate).

<pre>
31    26   21   16   11    6     5     4     0
[ 0x14 | rD | rA | rB | rC | SOV | SCY | opc ]

Mnemonic    Opc   Setup
---------------------------------------------
l.aadd      0000  a=D:A, m=0, c=0, s=0
l.asub      0001  a=D:A, m=0, c=1, s=1
l.aadc      0010  a=D:A, m=0, c=SR[CY], s=0
l.asbb      0011  a=D:A, m=0, c=~SR[CY], s=1
l.amul      0100  a=0, m=1, e=1, c=0, s=0
l.amulu     0101  a=0, m=1, e=0, c=0, s=0
l.amac      0110  a=D:A, m=1, e=1, c=0, s=0
l.amacu     0111  a=D:A, m=1, e=0, c=0, s=0
l.amsb      1000  a=D:A, m=1, e=1, c=1, s=1
l.amsbu     1001  a=D:A, m=1, e=0, c=1, s=1

if (m)
  x = (e ? exts(rB) : extz(rB))
  y = (e ? exts(rC) : extz(rC))
  p = x * y
else
  p = rB:rC

rD:rA <- a + (s ? ~p : p) + c

if (~SCY)
  SR[CY] <- (s ? ~carry-out : carry-out) (unsigned overflow)
if (~SOV)
  SR[OV] <- signed overflow
</pre>

The circuits needed to implement these insns are virtually identical to
that needed to implement the MAC instructions.  Only the sources and
destinations differ.

This uses pairs of registers to perform the same double-word arithmetic
that's currently possible with the MAC instructions, but leaves the result
in general registers.  This makes it simple to organize coding of general
multi-word arithmetic (libgmp), the performance of which is crucial for
implementing public-key encryption.

Note the l.aadc and l.asbb instructions include the carry-in, and so can
be strung together to produce two words of a multi-word addition each.

Note that unlike l.mac vs l.macu, these instructions produce both SR[CY]
and SR[OV] from the addition stage.  Whether or not the multiply stage is
zero-extended or not should not imply anything about the signed-ness of
the addition.

Note the SOV and SCY bits to "suppress" generation of either SR[OV] or
SR[CY] from the addition when they're not desired by the programmer.
The inverted sense of these bits (set to suppress rather than set to
generate) will tie in to another proposal for normal arithmetic.

