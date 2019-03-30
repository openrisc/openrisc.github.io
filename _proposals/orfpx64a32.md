---
layout: proposal
title: ORFPX64A32 (P14)
category: draft
date: 2015-03-12 15:35
author: BAndViG
---
Adaptation double precision floating point ISA for 32-bit OR1K architecture.
The idea is analogue to other 32-bit architectures. Namely use paired GPRs to
perform operations with double precision floating point data.

Example:

```
lf.add.d rD,rA,rB

32-bit Implementation (ORFPX64A32):
{(rD+n)[31:0],rD[31:0]} ← {(rA+n)[31:0], rA[31:0]} + {(rB+n)[31:0], rB[31:0]}

Where `n` is `2` for registers `r16` and greater and `1` otherwise.

64-bit Implementation (ORFPX64):
rD[63:0] ← rA[63:0] + rB[63:0]
```

## Register spilling

In order to avoid spilling registers (having to save registers to the stack)
across function calls data may be placed in callee saved registers.  On
OpenRISC the ABI dedicates even registers `r14 -> r30` as callee saved
registers.  For this reason ORFPX64A32 registers pairs use an offset of `2` for
`r16` and greater.  Why not `r14` and greater?  This is because GCC internally
uses `r16` for the PIC register and there is not much benefit to store 64-bit
values in `r14` and `r16` as `r16` is not available.

## Frame Pointer considerations

If `r2` is not used for the frame pointer, then the following GPRs could be paired:
```
{r2,r3} … {r6,r7}, {r11,r12} … {r28,r30}
```

''As far as I understand it is the case of current implementation in GCC. GCC
operates with 64-bit data as structured type and uses stack to transmit such
parameters into a function.''

**Stafford** - *GCC uses register pairs i.e. `{r3,r4}` to transfer 64-bit data
to a function.*

For cases when `R2` is used for the frame pointer:
```
{Rr,Rr} … {Rr,r8}, {r11,r12} … {r28,r30}
```

''For the case we also able to extend binary interface by allow for a compiler
to transmit up to three 64-bit values as function parameters through `r3` … `r8`.
Personally, I would like to vote for this variant. Even so, the approach leads
to binary backward incompatibility; I don’t think that could be a big problem
for such open source project as OpenRISC and its application.''

**Stafford** - *As per my above comment it's not necessary.*
