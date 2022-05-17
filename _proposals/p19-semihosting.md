---
layout: proposal
title: Semihosting (P19)
category: r1.4
date: 2022-05-17 17:02
author: Stafford Horne
---

The OpenRISC `l.nop` instruction has a 16-bit immediate argument.  In the spec
it says, *Immediate value can be used for simulation purposes.*

This is true and it is indeed used in `or1ksim` and the GNU `sim`.  However,
when trying to incorporate this to QEMU they have two reservations:
 - The handling of `l.nop` simulation operations should be behind the
   *semihosting* facility.
 - The `l.nop` simulation operations need to be formally documented in the spec.

Formally documenting these operations should help make it possible to get this
support upstream in qemu.

Example emails:
 - 2015 [[PATCH] openrisc: terminate qemu process upon receiving a halt signal.](https://lists.nongnu.org/archive/html/qemu-devel/2015-04/msg00466.html)
 - 2017 [[PATCH 2/7] target/openrisc: add shutdown logic](https://lists.gnu.org/archive/html/qemu-devel/2017-04/msg02514.html)
 - 2022 [[PATCH 2/7] target/openrisc: add shutdown logic](https://www.mail-archive.com/qemu-devel@nongnu.org/msg884580.html)

The *semihosting* term comes from ARM where they provide instructions
which can be used when simulating to interact with the host.  ARM semihosting
provides [operations](https://developer.arm.com/documentation/dui0471/g/Semihosting/Semihosting-operations?lang=en)
which mostly center around accessing host OS facilities like timers and
filesystem.

For OpenRISC I propose we document all `l.nop` operations:

```c
#define NOP_NOP          0x0000      /* Normal nop instruction */
#define NOP_EXIT         0x0001      /* End of simulation */
#define NOP_REPORT       0x0002      /* Report the value of r3 */
#define NOP_PUTC         0x0004      /* Sim putc instruction */
#define NOP_CNT_RESET    0x0005      /* Reset statistics counters */
#define NOP_GET_TICKS    0x0006      /* Get # ticks running, 64-bit result */
#define NOP_GET_PS       0x0007      /* Get picosecs/cycle, 32-bit result */
#define NOP_TRACE_ON     0x0008      /* Turn on tracing */
#define NOP_TRACE_OFF    0x0009      /* Turn off tracing */
#define NOP_RANDOM       0x000a      /* Return 4 random bytes, 32-bit result */
#define NOP_OR1KSIM      0x000b      /* Return non-zero if this is Or1ksim */
#define NOP_EXIT_SILENT  0x000c      /* End of simulation, quiet version */
#define NOP_RESET        0x000d      /* Causes the simulator to reset */
```

Some of these operations take arguments and return values.

 - Arg `r3` - simulator operation argument, similar to function calling.
 - Result `r11` - 32-bit results are stored in r11 similar to function calling.
 - Result `r12,r11` - 64-bit results are stored in the r12,r11 pair similar to
   function calling.

This will require changes to:

 - The SPEC
  - New section in 17. ABI, 17.6 Semihosting ABI explaining
    each of the functions above.
  - Mention section 17.6 in the `l.nop` instruction description.
 - Qemu to implement semihosting

