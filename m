Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200A4606C1A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 13:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v1k7/HA/;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Sqdeb69p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SCloQQxe4+JTc+VFVHtDAnitVmo1Mr2MvV/BTuAwc8U=; b=v1k7/HA/z88+C62XDraTwJlf0p
	15FBLPUplJlhP4qW+crMfXh69pXQWlyVp+Ti9rMQ6yGyqEybpNExrtQJtXZaE+Xci+jgjDG+qSrtg
	CWiObgHpNHl4tcXb9/IEMJGGsPcrwUB7ysGXtVFmzIo+Po9yJskmAn4y/fY8bQRgkfATUcy4bq6BJ
	by07UVT0BW/HaLPOkW2s+TwtwnHzNiwqeCxBxzqmwjf2fv4gplpyz67KjiDknjEUEqOhlp9z9S11R
	wdAvEDouYOD2O/6XI72xckocNpjAZLg2+52StIQLIc3qlMGfUPx7xIkX8iLwEW/jHrx3Gz32WOLNz
	PR/mFinA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAEl-00000009pj5-2Lbm;
	Tue, 20 Oct 2026 13:50:43 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAEj-00000009pht-1R9h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 13:50:42 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2e5d0ee1951so21285565ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 06:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792504240; x=1793109040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SCloQQxe4+JTc+VFVHtDAnitVmo1Mr2MvV/BTuAwc8U=;
        b=Sqdeb69pTbm0nTt0kkNfNvCKInZw4mM7T707ESoin6aN4UKhpZix9Kd83gP2eHW4d7
         Ja+zvqcF0OYd0k4Ngp3tGbzirBPknoEBHlPwdh61Tv/D3Q6+CD1OIc2/PZ1DrP2wo4Kv
         FtqlUN2gLl4xmUALAYOhLWvPfJTo+H72q7HK2jQFkGcj87wMl2dZhPJysMqeXVblpdsn
         mf3G+0PjlF1pjE145QQo7OTa5vvJrTLylt5PTmqy9eWa3WJByE46ytfMcsOXoM7iVBjX
         YSFhwpn5cpkg3n22ynU+rDmt43nMGx8cqLZqauZIFeVQ6L6sMjg2mjURZV+c63jWXqKT
         26wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504240; x=1793109040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SCloQQxe4+JTc+VFVHtDAnitVmo1Mr2MvV/BTuAwc8U=;
        b=gKdXLmfBGaDWHgxwcal597gVrSTmIPwemIxUyCtjc+gUzwJ/V+IhEARf/r5R6dZ40t
         tccgzTxVlXvgSA2w/kBnhm0Qx6CcJVRPfUTG32q81lHTs1VLKzI/ownPFcwAUpbFRh2H
         Hk1xhlEIxBEQFmz5/6zi7ne9Rzkh4FXZS5zWbqGkIdoaH2DxWY05qqY/3hOQJkYhn/NG
         8V4eJJqf+9FnvFVAz/PT4cuKduCkp1KJIyOmw7VtfjgByck7n9PnYV2Uq+2tlmG0b8MW
         OPd5B8MFUqEvvH+nrqdI/0my8s2Xi9Efr0axvDWiDkbgHIRCVgSNRGOeDWYUMulDQ7h2
         8EEQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5AwzrfTEKKcNnWnzSzydIyjshzXTi1hAY+JwakvGRMKNyt9IMIb9A/A6Z+FEfnmLzU1tIPKphfo/7RV9n/6xy@lists.infradead.org
X-Gm-Message-State: AFq9FYLk3Tvqt99HxJ32z6oX/JVIfmPpN5oZI5+G1bzrXb1jOLjgapyo
	y7CXNJfI+spsLBmPwFc2SQYaJgyiG1msm+T4hmBZrljK8bn+dhKBRhah
X-Gm-Gg: AYBFou1aq7moMuMRe+tXNh7dWjTEa/79J/Sa701aigOMkX8kNg9Qzt4Tvhowf4veLMx
	7p+kY/sHKz0KbZyqwF56KN/hjx7otRzuqHvDwFESqCD8W2VFb1H6NpbPwWxhnrJWCOP/dj5Fqzb
	nILZ6/TpOzhSZK+GJkiRkq+3ba03lt2nafJKWvaNWbYIjXv6htST/Wsr0gyrn/WufrOKuYBBb7M
	YrYm5jRsLG5qi9zCs6J6G3/TV894KsMqwWNbppGpE47Kh12ZPVdCn3GWwhXraFBpI5FvaBChZll
	0yz+9rxcZcm/tvCVGrJBxmMJeboMbsxeaQrPOX3PfbDmWRS4+w0QqJw6w/O9l+wU4Wk9TB/9Syt
	5PJ9hgXcdBY48i0UdA81USy5iUttmC5pecSc7U7pLe2O+VxqXOh2kIOiZLlY3Sh8tOoiS5nWXUS
	eTWxICsnzEe7Rxl+sV+OUNnKexxagduhzKnFhBKxdrdzpbMHkQLDAStiNDC2vgZea48xKpr1Jxz
	HGn9EV6vQiTrFqBsmUNGh6DfrWYvklG+t4LdIIR4Ka09P1/C0TkFHA8FhbZ
X-Received: by 2002:a17:90b:48c2:b0:3a7:9413:cfae with SMTP id 98e67ed59e1d1-3acef518dadmr8985793a91.42.1792504239363;
        Tue, 20 Oct 2026 06:50:39 -0700 (PDT)
Received: from envzhu-ertl2024.taild6e5db.ts.net (wnetuser204.wnet.icts.nagoya-u.ac.jp. [133.6.54.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5df5be7asm3661825a91.16.2026.10.20.06.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:50:38 -0700 (PDT)
From: Yoshifumi SHU <envzhu@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Hajime Tazaki <thehajime@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yoshifumi SHU <envzhu@gmail.com>
Subject: [RFC PATCH] ARM: v7m: entry: Convert IRQ handling to generic IRQ entry
Date: Tue, 20 Oct 2026 22:50:25 +0900
Message-ID: <20261020135025.2209550-1-envzhu@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_065041_396101_D4F80FF6 
X-CRM114-Status: GOOD (  34.12  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The recent patch converting ARM to generic IRQ entry [1] leaves the V7M
path using architecture-specific entry due to its distinct exception
model. This RFC attempts to complete that conversion for V7M.

On the V7M architecture, the execution priority cannot be lowered
without an exception return. Therefore, an IRQ handler cannot directly
perform a context switch. irqentry_exit() may schedule, so it cannot run
entirely in the IRQ handler. This is uncommon in other architectures.

The existing V7M code defers exit work to a PendSV (Pendable Service
Call) handler, which runs at the lowest priority (matching the kernel's
priority). Furthermore, kernel preemption on exit to kernel mode is
unsupported; PendSV runs at the kernel's priority and does not preempt
the kernel.

Convert the V7M IRQ path to use generic IRQ entry while deferring exit
work to PendSV:

- IRQ from user mode: if exit work is pending, defer the exit to user
  mode to the PendSV handler. Otherwise, exit directly in the IRQ
  handler to avoid an unnecessary PendSV exception.

- IRQ from kernel mode: perform generic exit handling directly in the
  IRQ handler, with rescheduling suppressed by
  arch_irqentry_exit_need_resched().

- IRQ taken while exit to user mode is deferred: handle it as a nested
  IRQ, i.e., as an IRQ from kernel mode.

Use the separate irqentry_{enter_from,exit_to}_user_mode() and
irqentry_{enter_from,exit_to}_kernel_mode() for these paths.

This keeps the existing V7M scheduling behavior while using generic IRQ
entry.

Tested on MPS3-AN547 (Cortex-M55) and EK-RA8P1 (Cortex-M85) hardware.
RSEQ selftests pass.

Link: https://lore.kernel.org/linux-arm-kernel/20260910-arm-generic-irq-entry-v7-1-v3-1-5fd90f6859e1@kernel.org/ # [1]
Signed-off-by: Yoshifumi SHU <envzhu@gmail.com>
---
This applies on top of v7.3-rc1 with [1] applied.

To avoid unnecessary PendSV exceptions, the bits 0..15 in the thread
information flag are checked to judge whether work won't be triggered.
But irqentry_exit_to_user_mode() actually checks
EXIT_TO_USER_MODE_WORK_IRQ, which is slightly different.
We have to be careful with this check because a judgment mismatch of
whether work is needed can lead to performing a schedule in the IRQ
handler, which is unacceptable here.
I believe checking bits 0..15 is preferable to directly seeing
EXIT_TO_USER_MODE_WORK_IRQ because:
- EXIT_TO_USER_MODE_WORK_IRQ seems not to be intended to be inspected
  outside irqentry_exit(). No other architecture (needs to) sees this
  flag. The macro was introduced recently (February 2026).
- Bits 0..15 cover EXIT_TO_USER_MODE_WORK_IRQ.
- The existing IRQ entry and ret_fast_syscall also check bits 0..15.

Modification candidates as separate series, found while testing. I can
submit these after this RFC discussion:
- A fix for the NVIC driver: The interrupt controller driver (irq-nvic.c)
  sets incorrect registers for priority configurations (the actual
  accessed address of NVIC_IPR is wrong). This can lead to nested IRQs in
  some environments, which is not assumed in the current V7M
  implementation.
- On V7M, ARM_cpsr holds xPSR, a different meaning from that of
  Cortex-A. Specifically, user_mode() and regs_irqs_disabled() may be
  changed according to V7M semantics. Currently, both give the right
  answer as long as IRQs do not nest.

I have tested this RFC patch on MPS3-AN547 (Cortex-M55@32MHz) and
EK-RA8P1 (Cortex-M85@1GHz) hardware.
Also, I applied some additional patches:
- kselftests support on nommu recently submitted [2]
- BSP support for MPS3-AN547 and EK-RA8P1
- AT_RSEQ_FEATURE_SIZE and AT_RSEQ_ALIGN in the FDPIC ELF loader
- The fix for the NVIC driver mentioned above

RSEQ basic_test and param_test kselftests pass on both boards. Without
this RFC patch, under the same test setup, param_test with delay
injection fails on both boards (e.g., "param_test -T l -t 6 -r 1000 -4
10000").

For brief evaluation, the overhead is evaluated by manually
instrumenting the code.
To evaluate the entry part of the IRQ handler, v7m_irq_handler is
measured with irq_{enter,exit_rcu}() and handle_arch_irq() excluded.
For comparison, its counterparts are measured for [1] (before applying
this patch). Mean cycles over 5,000 samples are:

                                        before    after
  MPS3-AN547  kernel idle loop           225.2    259.1   +15%
  (32 MHz)    user loop                  146.5    106.9   -27%
              user loop + 1 ms SIGALRM   125.0     94.2   -25%
  EK-RA8P1    kernel idle loop          1230.0   1822.6   +48%
  (1 GHz)     user loop                  657.2    473.2   -28%
              user loop + 1 ms SIGALRM   703.9    555.1   -21%

"kernel idle loop" runs "sleep 10" repeatedly and is expected to take
IRQs mostly from kernel mode. "user loop" runs a busy loop in user space
and takes IRQs mostly from user mode. "user loop + 1ms SIGALRM" takes
IRQs mostly from user mode with exit work triggered.

"kernel idle loop" (IRQs from kernel mode) shows overhead increase while
the others (IRQs from user mode) show decreases.
I have not yet investigated the reasons for these performance
differences. But I believe they are negligible since the entry part,
measured above, is less than 3% of the entire IRQ handler, including
irq_{enter,exit_rcu}() and handle_arch_irq() (measured on EK-RA8P1).

LLM tools were used for discussion, testing, evaluation, and reviewing.
The code was written by me.

Link: https://lore.kernel.org/all/20261006085642.3852152-1-thehajime@gmail.com/ # [2]
Link: https://lore.kernel.org/all/CAD++jL=VJsnk-GzAvR4oR8oKJayQzq9Oes+ZW7K=iHGrQ1jh0w@mail.gmail.com/
Link: https://lore.kernel.org/linux-arm-kernel/ac3e3fce-b27a-4d17-9616-48a70ddaf28b@gmail.com/
---
 arch/arm/include/asm/entry-common.h |  9 ++++
 arch/arm/include/asm/entry.h        |  4 ++
 arch/arm/kernel/entry-v7m.S         | 49 ++++----------------
 arch/arm/kernel/entry.c             | 72 +++++++++++++++++++++++++++++
 4 files changed, 94 insertions(+), 40 deletions(-)

diff --git a/arch/arm/include/asm/entry-common.h b/arch/arm/include/asm/entry-common.h
index c017df5f39d5..35a4905e7aca 100644
--- a/arch/arm/include/asm/entry-common.h
+++ b/arch/arm/include/asm/entry-common.h
@@ -4,4 +4,13 @@
 
 #include <asm/stacktrace.h>
 
+#ifdef CONFIG_CPU_V7M
+/* V7M never reschedules on exit to kernel mode */
+static inline bool arch_irqentry_exit_need_resched(void)
+{
+	return false;
+}
+#define arch_irqentry_exit_need_resched arch_irqentry_exit_need_resched
+#endif
+
 #endif
diff --git a/arch/arm/include/asm/entry.h b/arch/arm/include/asm/entry.h
index 4a28e54b5bf3..a4a44bda7e99 100644
--- a/arch/arm/include/asm/entry.h
+++ b/arch/arm/include/asm/entry.h
@@ -8,5 +8,9 @@ void arm_rseq_user_enter(void);
 void arm_rseq_user_exit(void);
 void arm_irq_handler(struct pt_regs *regs, int mode);
 void arm_fiq_handler(struct pt_regs *regs);
+#ifdef CONFIG_CPU_V7M
+void v7m_irq_handler(struct pt_regs *regs);
+void v7m_pendsv_handler(struct pt_regs *regs);
+#endif
 
 #endif /* __ASM_ENTRY_H__ */
diff --git a/arch/arm/kernel/entry-v7m.S b/arch/arm/kernel/entry-v7m.S
index 49a3a34e2913..0d6f2eb99ca7 100644
--- a/arch/arm/kernel/entry-v7m.S
+++ b/arch/arm/kernel/entry-v7m.S
@@ -39,41 +39,11 @@ __irq_entry:
 	@
 	@ Invoke the IRQ handler
 	@
-	mov	r0, sp
-	ldr_this_cpu sp, irq_stack_ptr, r1, r2
-
-	@
-	@ If we took the interrupt while running in the kernel, we may already
-	@ be using the IRQ stack, so revert to the original value in that case.
-	@
-	subs	r2, sp, r0		@ SP above bottom of IRQ stack?
-	rsbscs	r2, r2, #THREAD_SIZE	@ ... and below the top?
-	movcs	sp, r0
-
-	push	{r0, lr}		@ preserve LR and original SP
-
-	@ routine called with r0 = struct pt_regs *
-	bl	generic_handle_arch_irq
-
+	mov	r0, sp			@ regs
+	push	{r0, lr}		@ preserve LR with 8-byte stack alignment
+	bl	v7m_irq_handler
 	pop	{r0, lr}
-	mov	sp, r0
-
-	@
-	@ Check for any pending work if returning to user
-	@
-	ldr	r1, =BASEADDR_V7M_SCB
-	ldr	r0, [r1, V7M_SCB_ICSR]
-	tst	r0, V7M_SCB_ICSR_RETTOBASE
-	beq	2f
-
-	get_thread_info tsk
-	ldr	r2, [tsk, #TI_FLAGS]
-	movs	r2, r2, lsl #16
-	beq	2f			@ no work pending
-	mov	r0, #V7M_SCB_ICSR_PENDSVSET
-	str	r0, [r1, V7M_SCB_ICSR]	@ raise PendSV
 
-2:
 	@ registers r0-r3 and r12 are automatically restored on exception
 	@ return. r4-r7 were not clobbered in v7m_exception_entry so for
 	@ correctness they don't need to be restored. So only r8-r11 must be
@@ -87,14 +57,13 @@ ENDPROC(__irq_entry)
 __pendsv_entry:
 	v7m_exception_entry
 
-	ldr	r1, =BASEADDR_V7M_SCB
-	mov	r0, #V7M_SCB_ICSR_PENDSVCLR
-	str	r0, [r1, V7M_SCB_ICSR]	@ clear PendSV
+	mov	r0, sp			@ regs
+	bl	v7m_pendsv_handler
 
-	@ execute the pending work, including reschedule
-	get_thread_info tsk
-	mov	why, #0
-	b	v7m_ret_to_user_from_irq
+#ifdef CONFIG_KSTACK_ERASE
+	bl	stackleak_erase_on_task_stack
+#endif
+	restore_user_regs fast = 0, offset = 0
 ENDPROC(__pendsv_entry)
 
 /*
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 42d9301bdf37..988555eaaf07 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -6,6 +6,9 @@
 #include <asm/entry.h>
 #include <asm/stacktrace.h>
 #include <asm/traps.h>
+#ifdef CONFIG_CPU_V7M
+#include <asm/v7m.h>
+#endif
 
 #include "irq.h"
 
@@ -59,3 +62,72 @@ noinstr void arm_fiq_handler(struct pt_regs *regs)
 
 	irqentry_nmi_exit(regs, state);
 }
+
+#ifdef CONFIG_CPU_V7M
+/*
+ * On V7M architecture, the execution priority cannot be lowered without an
+ * exception return. Therefore, an IRQ handler cannot directly perform a
+ * context switch. To fit generic IRQ entry into this hardware constraint:
+ *
+ * - IRQ from user mode: if exit work is pending, defer the exit to the PendSV
+ *   handler. PendSV has the kernel's priority (that of SVCall), below all
+ *   IRQs, so the PendSV handler runs after all pending IRQs. Otherwise exit to
+ *   user mode directly.
+ * - IRQ from kernel mode: exit directly with rescheduling suppressed using
+ *   arch_irqentry_exit_need_resched(). PendSV cannot preempt the kernel, so a
+ *   reschedule cannot be deferred to the PendSV handler.
+ * - IRQ taken while an exit to user mode is deferred (i.e., while PendSV is
+ *   pending): handle it as an IRQ from kernel mode. This IRQ is logically
+ *   nested from an irqentry_{enter,exit}() perspective (see
+ *   Documentation/core-api/entry.rst), even if its stacked frame is the user
+ *   frame (tail-chaining, or late arrival).
+ */
+noinstr void v7m_irq_handler(struct pt_regs *regs)
+{
+	if (!user_mode(regs) || (readl_relaxed(BASEADDR_V7M_SCB + V7M_SCB_ICSR) &
+				V7M_SCB_ICSR_PENDSVSET)) {
+		/* IRQ from kernel mode, or IRQ taken while PendSV is pending */
+		irqentry_state_t state = irqentry_enter_from_kernel_mode(regs);
+
+		if (on_thread_stack())
+			call_on_irq_stack(handle_arm_irq, regs);
+		else
+			handle_arm_irq(regs);
+
+		/* arch_irqentry_exit_need_resched() prevents rescheduling here */
+		irqentry_exit_to_kernel_mode(regs, state);
+	} else {
+		irqentry_enter_from_user_mode(regs);
+
+		call_on_irq_stack(handle_arm_irq, regs);
+
+		/*
+		 * Check TIF bits in 0..15 to judge whether exit work will be
+		 * triggered, as tested in ret_fast_syscall.
+		 */
+		if (read_thread_flags() & GENMASK(15, 0)) {
+			/*
+			 * Raise PendSV exception to defer the exit to user
+			 * mode to the PendSV handler.
+			 */
+			writel_relaxed(V7M_SCB_ICSR_PENDSVSET, BASEADDR_V7M_SCB +
+					V7M_SCB_ICSR);
+		} else {
+			/*
+			 * Fast path: Directly perform exit in the IRQ handler.
+			 * Safe because work won't be triggered.
+			 */
+			irqentry_exit_to_user_mode(regs);
+		}
+	}
+}
+
+noinstr void v7m_pendsv_handler(struct pt_regs *regs)
+{
+	/* Clear PendSV pending state */
+	writel_relaxed(V7M_SCB_ICSR_PENDSVCLR, BASEADDR_V7M_SCB + V7M_SCB_ICSR);
+
+	/* Call exit and perform the deferred exit work */
+	irqentry_exit_to_user_mode(regs);
+}
+#endif

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
prerequisite-patch-id: 664e34728c0570f7f3602a381394fef3da5dc6d5
-- 
2.53.0


