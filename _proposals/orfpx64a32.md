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

## lf.add.d Add Floating-Point Double-Precision

```
    31  26  21  16  11           8      0
   [ 0x32 | D | A | B | regoffset | 0x10 ]    lf.add.d
```

## 32-bit Format (ORFPX64A32):

```
lf.add.d rD1,rD2,rA1,rA2,rB1,rB2
```

## 64-bit Format (ORFPX64):

```
lf.add.d rD,rA,rB
```

## Description

The contents of general-purpose register rA are added to the contents of
general-purpose register rB to form the result. The result is placed into
general-purpose register rD.

On 32-bit machines the second registers (rD2,rA2,rB2) are encoding via `regoffset`.
The `regoffset` bitmask indicates if the second register is offset by 1 or 2
as per the following:

- bit[10] - 1 indicates if rD2 is rD1+2, otherwise rD1+1
- bit[9]  - 1 indicates if rA2 is rA1+2, otherwise rA1+1
- bit[8]  - 1 indicates if rB2 is rB1+2, otherwise rB1+1

On 64-bit machines these shall be set to `0`.

## 32-bit Implementation (ORFPX64A32):

```
{rD2[31:0],rD1[31:0]} ← {rA2[31:0], rA1[31:0]} + {rB2[31:0], rB1[31:0]}
```

## 64-bit Implementation (ORFPX64):

```
rD[63:0] ← rA[63:0] + rB[63:0]
```


Other example encodings

ALU

```
    31  26  21  16  11           8      0
   [ 0x32 | D | A | B | regoffset | 0x10 ]    lf.add.d
   [ 0x32 | D | A | B | regoffset | 0x11 ]    lf.sub.d
                       ...
```

Comparisons

```
    31  26    21  16  11  10           8      0
   [ 0x32 | res | A | B | 0 | regoffset | 0x18 ]  lf.sfeq.d
   [ 0x32 | res | A | B | 0 | regoffset | 0x19 ]  lf.sfne.d
                       ...
```

Long Long <-> Double conversions

```
    31  26  21  16    11           9   8      0
   [ 0x32 | D | A | 0x0 | regoffset | 0 | 0x15 ]  lf.ftoi.d
   [ 0x32 | D | A | 0x0 | regoffset | 0 | 0x14 ]  lf.itof.d
```

## Considerations

### Integer conversion

On 32-bit (ORFPX64A32) processors the `lf.ftoi.d` and `lf.itof.d` instructions
convert to and from 64-bit integers composed of 32-bit register pairs.

### Register spilling

In order to avoid spilling registers (having to save registers to the stack)
across function calls data may be placed in callee saved registers.  On
OpenRISC the ABI dedicates even registers `r14 -> r30` as callee saved
registers.  For this reason ORFPX64A32 registers pairs can use an offset of `1`
or `2`.

### Frame Pointer considerations

If `r2` is not used for the frame pointer, then the following GPRs could be paired:

`{r2,r3} … {r6,r7}, {r11,r12} … {r28,r30}`

''As far as I understand it is the case of current implementation in GCC. GCC
operates with 64-bit data as structured type and uses stack to transmit such
parameters into a function.''

**Stafford** - *GCC uses register pairs i.e. `{r3,r4}` to transfer 64-bit data
to a function.*

For cases when `r2` is used for the frame pointer:
```
{r3,r4} … {r7,r8}, {r11,r12} … {r28,r30}
```

''For the case we also able to extend binary interface by allow for a compiler
to transmit up to three 64-bit values as function parameters through `r3` … `r8`.
Personally, I would like to vote for this variant. Even so, the approach leads
to binary backward incompatibility; I don’t think that could be a big problem
for such open source project as OpenRISC and its application.''

**Stafford** - *As per my above comment it's not necessary.*
