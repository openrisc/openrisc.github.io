---
layout: proposal
title: Clarification on Atomic Boundaries (P16)
category: draft
date: 2017-08-18 18:21
author: Stafford Horne
---

Section `7.3 Atomicity` explains that a upon load a reservation is made at
the address of the load memory location and that subsequent stores to the
same memory location will cancel the reservation.  It is not clear whether
stores of byte or half-word size overlapping the memory location cause
reservation cancellation.

In current implementations stores anywhere within the 32-bit boundary will
invalidate the memory reservation.  This should be clarified.

## Changes

Change the sentence in `7.3 Atomicity` from:

  The reservation for a subsequent l.swa is cancelled if another store to
  the same memory location occur, another master writes the same memory
  location (snoop hit), another l.swa (to any memory location) is executed,
  another l.lwa is executed or a context switch (exception) occur.

to 

  The reservation for a subsequent l.swa is cancelled if another store
  *overlapping* the same memory location occurs, another master writes
  *overlapping* the same memory location (snoop hit), another l.swa (to any 
  memory location) is executed, another l.lwa is executed or a context
  switch (exception) occur.  *The overlapping writes may be byte or
  half-word size.*

