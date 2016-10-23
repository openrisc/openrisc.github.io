---
layout: page
title: SPR access updates (P3)
category: draft
date: 2015-03-03 10:41
author: Wallento
---

There has been a discussion about different SPRs and the possibility to access them from user space.

The topic can be split in two aspects: Defining privileges on instruction and defining the behavior for insufficient privileges.

### SPR privileges

Essentially the idea is to allow user space access to certain configuration registers: VR, UPR, CPUCFGR, DMMUCFGR, IMMUCFGR, DCCFGR, ICCFGR, VR2, AVR. (Potentially add COREID and NUMCORES)

During discussion it turned out, that we might consider splitting the user space access to SPRs into configuration and state registers. We thereby allow to expose information about the core, but not about the current execution state.

The proposal is to add an extra field CSUMRA to SR for the configuration registers.

### Accessing SPRs with insufficient privileges

At present there is no comment on what should happen in the event that l.mtspr/l.mfspr are used on SPRs which require supervisor mode to access, or if l.rfe is used in user mode.

There are currently two proposals for handling this:

The first is to leave the behavior in these cases implementation defined or completely undefined.  If this option is chosen, the manual should be changed to state this explicitly.

The first proposal (by Julius) is for a l.mtspr (write to an SPR) requiring write in supervisor mode while in user mode makes that instruction equivalent to an l.nop. Also that l.mfspr (read from an SPR) with insufficient privileges returns 0, just like an unimplemented SPR would.

The second proposal, by firefalcon and pgavin, is that we keep in line with other ISAs and make the ISA fully virtualizable by throwing an exception in this case.

Some elaboration by pgavin: I think we should actually *use* the definition of "privileged" as given on page 15 of the manual (section 1.6).  It is defined, but never used in the manual, from what I've found.  Additionally, I think we should raise an exception whenever a privileged instruction has been executed while in user mode.  For example, the l.rfe instruction should always raise this exception when executed in user mode.  Additionally, in user mode, an attempt to read or write an SPR that is not permitted as indicated on Table 4-2 of the manual should raise this exception.  An instruction that accesses a privileged resource in user mode should raise a privileged instruction exception.  We can either reuse the current illegal instruction for this purpose, or add a new exception type.

l.rfe should always be privileged.  It seems to me that allowing this instruction from user mode makes little sense, and could, in fact, be dangerous.  l.mtspr would be privileged whenever the address does not have a W in the "user mode" column of table 4-2, and l.mfspr would be privileged whenever the address does not have an R in that column.  The descriptions for these instructions would need to be changed to indicate that they may cause exceptions; it currently says that they do not.

Incidentally, some bits in the SR register (F, CY, OV) are not accessible from user mode, and so these bits should be mirrored in a separate SPR that is R/W from user mode. Or alternatively, we could add new instructions to read/write them.

Also incidentally, I also think l.mtspr/l.mfspr on an unimplemented register should raise an illegal instruction exception.  The presence of SPRs that are optional should be indicated by a bit in the UPR, and so this should be checked prior to accessing them.  If some registers are not covered by presence bits, the bits should be added.  However, the behavior currently defined by the standard is not a problem for virtualization, as far as I can tell, provided that l.mtspr/l.mfspr behave identically on unimplemented registers whether in user or supervisor mode.

### Summarized proposals

Proposal A:

* Add CSUMRA bit (17) to SR: Allow user-mode access to configuration SPRs
* Set of configuration SPRs: VR, UPR, CPUCFGR, DMMUCFGR, IMMUCFGR, DCCFGR, ICCFGR, VR2, AVR
* Add exception at 0xf00: Access violation from user mode
* Add exception 0xf00 to l.mfspr, l.mtspr and l.rfe

