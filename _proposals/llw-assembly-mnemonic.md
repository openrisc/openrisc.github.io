---
title: l.lw assembly mnemonic (P4)
category: draft
date: 2012-05-16 09:25
author: Julius
---

Add the l.lw assembly mnemonic, which encodes as a l.lwz instruction.

The l.lwz definition page in the spec should have:

 Format:
 l.lwz rD,I(rA)
 
 or
 
 l.lw rD,I(rA)

### Commentary

*Jeremy Bennett 11:32, 16 May 2012 (CEST)*

> The downside of this is that it is potentially confusing in a 64-bit 
> implementation, where you want to be explicit about sign extension. If we do go 
> down this route, then for consistency, we should also have l.lh and l.lb as 
> synonyms for l.lhz and l.lbz. 


*rdiez Sat Oct 6 16:43:25 2012*

> For the 32-bit architecture, in order to reduce confusion it would be best to 
> remove the l.lws opcode, and remove the l.lws and l.lwz mnemonics, then add an 
> "l.lw" mnemonic which maps to the old l.lwz opcode. or1200 hasn't implemented 
> (or didn't implement) the l.lws opcode for a long time anyway. By the way, 
> l.extws and l.extwz should also be marked as obsolete, as l.ori can achieve the 
> same results. For the 64-bit architecture, l.lw shouldn't be a valid mnemonic, 
> so the programmer must think whether he wants the l.lwz or the l.lws behaviour. 
