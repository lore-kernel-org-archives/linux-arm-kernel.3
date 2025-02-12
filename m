Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47D6C021A7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sXGvP6JipV+8uUkai1pZ0JQN3eZ7gykFyofKu5Tpi/M=; b=nEd1qblKHU+u1K
	FkSFVD29cruWleMyfYJusSFOEKvzMjluCSj/rxWgspr+NmdVEVZexc/snWfir1olDECGM7+T7ZdGx
	vs7ujbCqixVTZYhPE2g4natrcWilGgASxQLOSZ7NxDYhytPHc9EFvI5BUBbA8dYdr59+unp7Fg4qG
	3O3tSouUP0mROjV/w3a1sYmwN7dl6RlIQ1AneRFui5b68ioThYNEH38VllzGLVTedbEOKdM8cj1IR
	4+u+lgQEu2Lk+TfKiueoo7nhwJ2OtKN4LfVAGX1i1c5dfw3hDu4mgGn5WsFBl97rRzLAjqd163dZJ
	zVUQ/KaDb4Iutnxchkwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAt6-00000007AVv-1R2H;
	Wed, 12 Feb 2025 11:26:40 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiApg-000000079af-2NXb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:10 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-543cc81ddebso7328178e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359386; x=1739964186; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sXGvP6JipV+8uUkai1pZ0JQN3eZ7gykFyofKu5Tpi/M=;
        b=aRKJlvBI2X2iAfBngz6IZ2utHbINlnJWdcZox5FSv7rE09Jgw3MTCx6kxZt+Fzbj5W
         d9m0az5Apavr2ieS7d8B13TlfDQwUO53roF8MICy1GoliY40TIjPmddkVGmuhDdEy2m4
         sQqJ/NHv01h+tYYPZPxASt8ImmIUFrgsBWYd+aiZBFtfrmWUt8/zWHdEagVS8l8CZA/s
         V68n6yQXsrmHXXxHPq6xb3mfoNrHeUEJvbPLY/uXXCez3nLxITgFOJ0VtA7pxTwIgFy+
         J/oSpPq9bxMpYkVMhRAQIF5iCa86Kpqn+vSYPJtbQnl6KaMPJbYGFm/xJGPu1hrTHc3n
         6Grw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359386; x=1739964186;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sXGvP6JipV+8uUkai1pZ0JQN3eZ7gykFyofKu5Tpi/M=;
        b=c6g7zUspruJeo+tVVRcaFhJ8mvh1xm7puDw6RDtwn7wzLipttoYMTHa2E9B83DJLGV
         eBLNicTsh534JXZAiZ5nla677N75i13s6hulgM8tAi8YtbMrRd0jgrgRqi0fHrWN8ou2
         olXUzFwnVjgcvd8ERWdCauMjYu9sgaQLU1PyIzgQYaucORfzv/XzjEZz3t5oUno4UFFv
         M9x/FFyDLalViVuH36vXVB5SE12aGgOY1c9/J/0gfqNVP4c5HgjIq+m/yI4mDcCuNs7Q
         MfT03FjMNf8Ybc0lripU4C8XgJAwjL4wno02p4qHYthBpBWaunidqSR4lVfYnZVEiKoo
         OjXw==
X-Gm-Message-State: AOJu0Yw7nI7mrSUSw9COTB3PbJROx+YfntWOxJDkO3svwzb9ioGmw7ho
	JDExlYuE6BB/0GraZRD6tF0NouAiBMyYfXhJiUx+j9n7jxhrCKt8aPSbRmwb/q8=
X-Gm-Gg: ASbGnct/aZFA7+gLaaeO5iZ0/xiSa3xseo0on2xaNC5UiXSR+Rs74HQ5bpdjPjwV2rK
	73obcnxWd206RLhml52eSEqyo+ABomvCWt9X5wCQ+2Saf3YS4rhyuHmWKEbBtudiONsE9Xuz7r5
	5Q0LGXaTe7PVO9Oo4K2+bgGKBNp9Ots1yOmYg+YL5S5Fsp1GdtmU77+hKxd6Xx7f1kSh9gnF0Mj
	i7hYCjRnJfu9MuZfGZep9OJ5hkpH85FZx8Q8pdCq96HNz/Eb10YaYpTMTnJio4gvdj2epNWidwQ
	0c/sntqrlfLb2/ueFMcwmiSsLg==
X-Google-Smtp-Source: AGHT+IGfW6UuSv4ugNHZKr/TSO63oKM0CCCS12M+6yxNTE3BJ4hH4kgYgHngRtagJ1WK92UvO2ed3w==
X-Received: by 2002:a05:6512:b8b:b0:545:17b:3cf5 with SMTP id 2adb3069b0e04-545181a9513mr874187e87.47.1739359385949;
        Wed, 12 Feb 2025 03:23:05 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:05 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v4 00/31] ARM: Switch to generic entry
Date: Wed, 12 Feb 2025 12:22:54 +0100
Message-Id: <20250212-arm-generic-entry-v4-0-a457ff0a61d6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI+ErGcC/23OTQrCMBAF4KtI1kbySxpX3kNcJM2kDWgqSQmW0
 rubFgTFLt/A+97MKEMKkNH5MKMEJeQwxBrE8YDa3sQOcHA1I0aYIJpwbNIDdxBrq8UQxzRh4ww
 VkqvGWkC190zgw2szr7ea+5DHIU3bRKHrddMooWRHKxQTbLXwQlJHGmUv9xBNGk5D6tDKFfZFM
 L1HsEpIxSXVxoLnzR/BP4SsT6g9gldCgPS8pdJZ5n6IZVnetw14NTkBAAA=
X-Change-ID: 20240903-arm-generic-entry-ada145378bbe
To: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_032308_626277_AE038B91 
X-CRM114-Status: GOOD (  46.71  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

First non-RFC version.

This patch series converts a slew of ARM assembly into the
corresponding C code, step by step moving the codebase
closer to the expectations of the generic entry code,
and as a last step switches ARM over to the generic
entry code, and an RFC patch fixes a bunch of warnings
from lockdep and the context tracker.

This was inspired by Jinjie Ruans similar work for ARM64.

The low-level assembly calls into arch/arm/kernel/syscall.c
to invoke syscalls from userspace, and to the functions listed
in arch/arm/kernel/entry.c for any other transitions to
and from userspace. Looking at these functions and the
call sites in the assembly on the final result should give
a pretty good idea about how this works, and what the
generic entry expects from an architecture.

This was successfully booted on ARMv7m as well: the v7m
avoids the interrupt path in the generic entry, because it
never called the context tracker to begin with. It uses
the common path for syscalls however and this works just
fine. Adding proper context tracking to the ARMv7m IRQs is
probably a good idea but a separate issue altogether.

There is a git branch you can pull in and test (v6.14-rc1
based):
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/log/?h=b4/arm-generic-entry-v6.14-rc1

Upsides:

- Same code paths as x86, S390, RISCV, Loongarch and probably
  soon ARM64 is used for the ARM systems. This includes some
  instrumentation stubs helping out with things we haven't
  even started to look at such as kmsan and live patching (!).

- By introducing the new callbacks to C, we can move away
  from the deprecated (and I think partly unmaintained) context
  tracking mechanism for RCU (user_exit_callable(),
  user_enter_callable()) in favor of what everyone else
  is using, i.e. calling rcu_irq_enter_check_tick() on
  IRQ entry. If we do not go with this patch set we can
  perhaps look into a separate patch just switching ARM32
  to the new context tracking, as tests show the performance
  impact appears negligible for this.

- I think also lockdep is now behaving more according to
  expectations (the lockdep calls in ARM64 and generic entry
  seems different and more fine-granular from the ARM32 code)
  and the three warnings I see on Vexpress boots with mainline
  goes away after this patch set, but I am no expert in lockdep
  so I cannot really tell if this is a real improvement.
  The patches does make ARM lockdep clean.

Downsides:

- I had to remove the "fast syscall restart" from Al Viro.
  I don't know how much it will affect performance, but
  if this is something we must have, let's try to make
  the solution generic, i.e. add fast syscall restart in
  the generic entry code.

- The "superfast return to userspace" using just very
  small assembly snippets to get back to userspace on
  e.g. IRQs if and only if no instrumentation was compiled
  in, is no longer possible, since we unconditionally
  call into code written in C. I *think* this accounts
  for the majority of the ~3-4% performance impact (see
  measurements below).

Both downsides are more or less unavoidable side effects
if you just want to use the non-deprecated context tracking,
as that involves calling into C from every exception,
without exceptions.

Testing:

- Booted into Versatile Express QEMU (ARMv7), Ux500 full
  graphic UI (PostmarketOS Phosh, ARMv7 on hardware,
  Gemini ARMv4 on hardware. No special issues.

- Tested some ptrace/strace obviously, such as issuing
  several instances of "ptrace find /" and let this scroll
  by in the terminal over some 10 minutes or so.

- Turned on RCU torture tests and ran for a while. Seems
  stable and the test outputs look normal.

- Ran stress-ng, works fine.

- Booted with "lockdep" (CONFIG_PROVE_LOCKING). The ARM32
  mainline produce 3 warnings at boot and those go away
  after these patches. I haven't looked closer at what
  it was that I inadvertedly fixed here, but I suspect the
  current context tracking has the same issues as what
  I fix in the RFC patch.

Performance impact:

The changes were tested using the standard syscall overhead
testing oneliner:

  perf bench syscall all

This executes 10,000,000 getppid() in sequence and measures
the time taken for this to complete. The numbers vary a bit
but they are consistent.

In QEMU I tested with Vexpress and two CPU cores (-M vexpress-a15
-m 2G -smp cpus=2). DRM graphics and framebuffer was activated to
give a bit of background IRQ activity (vsync interrupts).

I ran the perf command three times on each configuration, and
picked the one iteration where the original code performed the
best, and the one where the patches kernel performed the worst, to
get a worst-case comparison.

v6.14-rc1 vexpress_defconfig, best invocation:

     Total time: 146.546 [sec]
      14.654698 usecs/op
         68,237 ops/sec

v6.14-rc1 vexpress_defconfig, and this patch set, worst invocation:

     Total time: 156.263 [sec]
      15.626398 usecs/op
         63,994 ops/sec

Here we see a performance degradation of around 6-7% operations/sec
for a vexpress dualcore defconfig in the best vs worst case. (This
isn't statistically correct, the effect is likely smaller.)

Debians stock kernel was noticably faster, so I investigated what
causes this. It turns out that the big performance hog for syscalls
is actually PAN which cause an order of magnitude syscall performance
decrease, and I think Debian armhf simply turns this off. Consistent
tests with PAN disabled also see around 6-7% on that performance
figure.

To conclude if any of this was due to the new context tracking,
at one point I tested to patch back the old context tracking on top
of generic entry. This is hardly something that can be recommended,
and anyway showed no noticeable overhead difference.

Open questions:

- I need to test with an OABI rootfs.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v4:
- Rebased on v6.14-rc1, marked non-RFC.
- Tested on ARMv7m, it works.
- Fixed a bug where I missed to handle syscall "-1" which
  when tracing means "skip syscall". This took some time to
  find, taking up much of my debug time despite being so
  obvious :/
- Added stubs for PTRACE_SYSEMU and PTRACE_SYSEMU_SINGLESTEP.
- No feedback on the "fast syscall restart" so I conclude
  that this is some ARM oddity, if it is needed for
  performance (i.e. a workload constantly restarting syscalls)
  we should look at recreating it inside the generic entry
  code.
- After discussing with Ard about the IRQ stacks, altered
  the irqstack handling to just assume IRQ stack or overflow
  stack is in use if we are not on the main thread stack.
- Unmark the patch to block IRQs in early IRQ context as
  "RFC": when doing proper context tracking this is likely
  plain necessary. Block IRQs in the early assembly entry
  directly in CPSR instead of later in the exception handler.
- New cleanup patch in the tail of the patch series.
- Link to v3: https://lore.kernel.org/r/20250107-arm-generic-entry-v3-0-4e5f3c15db2d@linaro.org

Changes in v3:
- Rewrote the code in entry.c so the IRQ handler saves pt_regs
  calls IRQ handler (including switching to IRQ stack!) and
  restores pt_regs in one function instead of one entry and
  one exit function. This is what every other arch using
  generic entry is doing, and we should do it too.
- The rewrite solved the caveat warnings from the previous patch
  set which was blatantly not SMP safe :/
- Rewrite the data abort and prefetch abort handlers in a
  separate patch which we may squash in the end, but this makes
  the patch set easier to review.
- Drop a pointless patch rewriting the NMI handlers in C, it's
  better to just patch into the end result in the last patch,
  as we're replacing handle_fiq_as_nmi().
- Syscall C invocations have to be tagged __ADDRESSABLE() in order
  not to upset KCFI: the file is only referenced in both ends by
  assembly so we need to point this out to the compiler.
- Link to v2: https://lore.kernel.org/r/20241029-arm-generic-entry-v2-0-573519abef38@linaro.org

Changes in v2:
- Performance impact measurements have been provided.
- Link to v1: https://lore.kernel.org/r/20241010-arm-generic-entry-v1-0-b94f451d087b@linaro.org

---
Linus Walleij (31):
      ARM: Prepare includes for generic entry
      ARM: ptrace: Split report_syscall()
      ARM: entry: Skip ret_slow_syscall label
      ARM: process: Rewrite ret_from_fork i C
      ARM: process: Remove local restart
      ARM: entry: Invoke syscalls using C
      ARM: entry: Rewrite two asm calls in C
      ARM: entry: Move trace entry to C function
      ARM: entry: save the syscall sp in thread_info
      ARM: entry: move all tracing invocation to C
      ARM: entry: Merge the common and trace entry code
      ARM: entry: Rename syscall invocation
      ARM: entry: Create user_mode_enter/exit
      ARM: entry: Drop trace argument from usr_entry macro
      ARM: entry: Separate call path for syscall SWI entry
      ARM: entry: Drop argument to asm_irqentry macros
      ARM: entry: Implement syscall_exit_to_user_mode()
      ARM: entry: Drop the superfast ret_fast_syscall
      ARM: entry: Remove fast and offset register restore
      ARM: entry: Untangle ret_fast_syscall/to_user
      ARM: entry: Do not double-call exit functions
      ARM: entry: Move work processing to C
      ARM: entry: Stop exiting syscalls like IRQs
      ARM: entry: Complete syscall and IRQ transition to C
      ARM: entry: Create irqentry calls from kernel mode
      ARM: entry: Move in-kernel hardirq tracing to C
      ARM: irq: Add irqstack helper
      ARM: entry: Convert to generic entry
      ARM: entry: Handle dabt, pabt, and und as interrupts
      ARM: entry: Block IRQs in early IRQ context
      ARM: entry: Straighten syscall returns

 arch/arm/Kconfig                    |   1 +
 arch/arm/include/asm/entry-common.h |  66 +++++++++++
 arch/arm/include/asm/entry.h        |  14 +++
 arch/arm/include/asm/ptrace.h       |   8 +-
 arch/arm/include/asm/signal.h       |   4 -
 arch/arm/include/asm/stacktrace.h   |   2 +-
 arch/arm/include/asm/switch_to.h    |   4 +
 arch/arm/include/asm/syscall.h      |   7 ++
 arch/arm/include/asm/thread_info.h  |  18 +--
 arch/arm/include/asm/traps.h        |   5 +-
 arch/arm/include/uapi/asm/ptrace.h  |   2 +
 arch/arm/kernel/Makefile            |   5 +-
 arch/arm/kernel/asm-offsets.c       |   1 +
 arch/arm/kernel/entry-armv.S        |  82 ++++----------
 arch/arm/kernel/entry-common.S      | 218 +++++++++++++-----------------------
 arch/arm/kernel/entry-header.S      | 100 ++---------------
 arch/arm/kernel/entry.c             | 120 ++++++++++++++++++++
 arch/arm/kernel/irq.c               |   6 +
 arch/arm/kernel/irq.h               |   2 +
 arch/arm/kernel/process.c           |  25 ++++-
 arch/arm/kernel/ptrace.c            |  81 +-------------
 arch/arm/kernel/signal.c            |  57 +---------
 arch/arm/kernel/syscall.c           |  37 ++++++
 arch/arm/kernel/traps.c             |  30 +----
 arch/arm/mm/abort-ev4.S             |   2 +-
 arch/arm/mm/abort-ev4t.S            |   2 +-
 arch/arm/mm/abort-ev5t.S            |   4 +-
 arch/arm/mm/abort-ev5tj.S           |   6 +-
 arch/arm/mm/abort-ev6.S             |   2 +-
 arch/arm/mm/abort-ev7.S             |   2 +-
 arch/arm/mm/abort-lv4t.S            |  36 +++---
 arch/arm/mm/abort-macro.S           |   2 +-
 arch/arm/mm/abort-nommu.S           |   2 +-
 arch/arm/mm/fault.c                 |   4 +-
 arch/arm/mm/fault.h                 |   8 +-
 arch/arm/mm/pabort-legacy.S         |   2 +-
 arch/arm/mm/pabort-v6.S             |   2 +-
 arch/arm/mm/pabort-v7.S             |   2 +-
 38 files changed, 456 insertions(+), 515 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20240903-arm-generic-entry-ada145378bbe

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


