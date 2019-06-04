---
layout: proposal
title: ORFPX32/ORFPX64 - lf.sf* (P7)
category: r1.3
date: 2015-03-06 23:25
author: Rth
---

The current definitions of comparisons do not allow easily testing the "unordered" property, which is
important in the presence of NaNs.  There are four conditions for which we might want to test, which
when combined produce all of the possible results.  Referencing the ISO C 99 <math.h> functions:

<pre>
31    26    21   16   11     6     0
[ 0x32 | res | rA | rB | res | opc ]

                            Setup
          Mnemonic    Opc   U E L G X
          ---------------------------
Existing  lf.sfeq.s   0x08  0 1 0 0 0
          lf.sfne.s   0x09  1 0 1 1 0
          lf.sfgt.s   0x0a  0 0 0 1 1
          lf.sfge.s   0x0b  0 1 0 1 1
          lf.sflt.s   0x0c  0 0 1 0 1
          lf.sfle.s   0x0d  0 1 1 0 1

New       lf.sfun.s   0x28  1 0 0 0 0  /* isunordered(rA,rB) */
          lf.sfult.s  0x29  1 0 1 0 0  /* !isgreaterequal(rA,rB) */
          lf.sfule.s  0x2a  1 1 1 0 0  /* !isgreater(rA,rB) */
          lf.sfueq.s  0x2b  1 1 0 0 0  /* !islessgreater(rA,rB) */

BandVIG Proposed
          lf.sfueq.s  0x28  1 1 0 0 0
          lf.sfune.s  0x29  1 0 1 1 0
          lf.sfugt.s  0x2a  1 0 0 1 0
          lf.sfuge.s  0x2b  1 1 0 1 0
          lf.sfult.s  0x2c  1 0 1 0 0
          lf.sfule.s  0x2d  1 1 1 0 0
          lf.sfun.s   0x2e  1 0 0 0 0

un <- isnan(rA) | isnan(rB)
eq <- rA == rB
lt <- rA < rB
gt <- rB < rA

SR[F] <- (u & un) | (e & eq) | (l & lt) | (g & gt)

if (X & un)
  raise INVALID_OPERAND exception

For Double operations opc is the above opc but `(opc | 0x10)`.  The mnemonic is
`lf.sf*.d`.

</pre>

The hardware that produces the existing comparisons must be able to
produce all of the proper intermediate conditions.  It's merely a
matter of exposing all of the conditions we need to be able to test
in order to implement `<math.h>` properly.

If we drop backward compatibility, i.e. drop lf.sfgt and lf.sfge,
there are only 8 comparisons and we can fit them into 0b0-1xxx.
Which has a nice bit of symmetry to it.

## Updates

Added BandVIG proposed unordered encodings which have been implemented
in `or1k_marocchino`.
