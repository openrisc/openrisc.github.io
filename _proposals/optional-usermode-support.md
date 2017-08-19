---
layout: proposal
title: Optional user-mode support (P2)
category: draft
date: 2015-03-03 10:51
author: Wallento
---

As some processors designed for embedded applications won't necessarily run software with a user/supervisor-mode split of operation, it's not necessary for them to implement user-mode features (eg. protect from unprivileged access to SPRs and the like.) Obviously this lack of support for user mode should be indicated via a bit in the CPUCFGR. So I propose a bit is added so that implementations without user-mode support can be detected by software which requires user-mode.

### Commentary

*Wallento 11:51, 3 March 2015 (CET)*

> I think this is maybe too much of generalization. Except there is a specific 
> plan to also implement a core without it, I don't think we should 
> over-complicate the spec. 
