---
layout: proposal
title: ORFPX64A32 (P14)
category: draft
date: 2015-03-12 15:35
author: BAndViG
---
Adaptation double precision floating point ISA for 32-bit OR1K architecture.
The idea is analogue to other 32-bit architectures. Namely use paired GPRs for perform operations with double precision floating point data.

Example:
<pre>
lf.add.d rD,rA,rB

32-bit Implementation (ORFPX64A32):
{rD[31:0],(rD+1)[31:0]} ← {rA[31:0],(rA+1)[31:0]} + {rB[31:0],(rB+1)[31:0]}

64-bit Implementation (ORFPX64):
rD[63:0] ← rA[63:0] + rB[63:0]
</pre>


If R2 is not used for frame pointer, than the following GPRs could be paired:
<pre>
{R2,R3} … {R6,R7}, {R11,R12} … {R29,R30}
</pre>
''As far as I understand it is the case of current implementation in GCC. GCC operates with 64-bit data as structured type and uses stack to transmit such parameters into a function.''


For case when R2 is used for frame pointer:
<pre>
{R3,R4} … {R7,R8}, {R11,R12} … {R29,R30}
</pre>
''For the case we also able to extend binary interface by allow for a compiler to transmit up to three 64-bit values as function parameters through R3 … R8. Personally, I would like to vote for this variant. Even so, the approach leads to binary backward incompatibility; I don’t think that could be a big problem for such open source project as OpenRISC and its application.''

