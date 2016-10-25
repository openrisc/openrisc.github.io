---
title: Instruction Classes (P5)
category: draft
date: 2012-04-21
author: Julius
---

At present, there are class I and II instructions. Class I must always be implemented. Class II may be optionally implemented.

There are a few problems with the current scheme.

1. There is no register where class II instructions are indicated as present or not
2. Some fundamental instructions, such as compare-and-set-flag-against-immediate (<code>l.sf*i</code>) are class II and should really be I
3. Software multi-lib support with such a configurable instruction set is difficult

Reorganising these will make it clearer which functionality should be tested and expected to be present in an implementation. It will also make it easier for software libraries to be prepared for a particular combination of supported instructions.

## Current ORBIS32 Class II instructions

As of revision 0 of the specification, the following are marked as ORBIS32 class II:

* l.cmov
* l.csync
* l.cust1-8
* l.div*
* l.ext[bhw]*
* l.ff1
* l.fl1
* l.mac*,l.msb
* l.mul*
* l.psync
* l.ror,l.rori
* l.sf*i (l.sfeqi,l.sfgesi etc.)
* l.trap

## Proposed ORBIS Classifications

Class I should remain mandatory to implement.

A new classification is proposed:

* Class II - Optional Maths: l.div*, l.mul* (in OR1200 on Virtex 5, serial l.div, full mult costs 265FF, 550LUT - respectively 71FF, 173LUT and 194FF, 377 LUT)
* Class III - Optional Bit Manipulation: l.ext[bwh]*, l.ff1, l.fl1, l.ror, l.rori (in OR1200 on Virtex 5 they cost 183 LUT)
* Class IV - MAC Instructions - l.mac*, l.msb
* Class V - Remaining Optional Instructions: l.cmov, l.csync, l.msync, l.psync, l.cust1-8

Classes II-IV will be all-or-nothing support classes, with class V individually implementable.

l.sf*i and l.trap should be made class I.

[rth: l.cmov is much more important to good code generation than all of the class III instructions.  I would not move it out of class II.  l.msync at least should be moved to class I, as it needs to be used in conjunction with l.lwa and l.swa.  I see no reason why l.csync and l.psync couldn't be class I as well, since in the simplest implementations they should be nops.]

## Presence bits

Presence bits in a new register should be added for classes II-IV, with a bit for each instruction in class V.

The CPUCFGR should be extended beyond bit 9 to contain:
 
```
 [25] l.cust1 instruction supported
 [24] l.cust2 instruction supported
 [23] l.cust3 instruction supported
 [22] l.cust4 instruction supported
 [21] l.cust5 instruction supported
 [20] l.cust6 instruction supported
 [19] l.cust7 instruction supported
 [18] l.cust8 instruction supported
 [17] l.cmov instruction supported
 [16] l.csync instruction supported
 [15] l.msync instruction supported
 [14] l.psync instruction supported
 [13] Class IV instruction supported
 [12] Class IV instruction supported
 [11] Class III instruction supported
 [10] Class II instruction supported
```

