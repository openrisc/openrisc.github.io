---
layout: proposal
title: Designation of r10 for TLS (P15)
category: draft
date: 2017-08-18 17:54
author: Stafford Horne
---

In the Linux kernel and GCC r10 is already being used for TLS, so add it to
the spec.

## Changes

Update section `16.2.1 Register Usage` usage of R10 from 'Callee-saved
register' to 'Thread Local Storage'.

## Additions

In the assigned roles tables of section `16.2.1 Register Usage` explain:

<pre>

| R10 [TLS] | *Thread Local Storage* used to locate the thread local
              storage structure.  This mechanism, as explained in the GCC
              manual, allows variables to be "allocated such that there is
              one instance of the variable per extant thread".
</pre>
