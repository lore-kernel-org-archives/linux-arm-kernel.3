Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FF9C3ABA4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 13:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OTzOZIYgOSm5iHgHYHs17cr0e11rjTGNrgKqn3vjBeY=; b=wcnHwjv3dTZo8LXn0GQaRjCSb/
	nZtXni8qrHjYVoS1PPRMZTTny1A3D8SYnevxeuUPwqYhey/9KObzQ8DWHRevMglPgFRK1fIiDFb9Z
	O3k4DfN/Z9PWkz5pug0I4PFGAcowwcqhoVcuOR5JJiS2Qs2aw+FwyMbMDv2MtpEoSmkjM6eU4sjnI
	sFykDCPl0NG3DefOliQ3rvMSBKexisFcnQ0yFmkjWr/bpi3rlD0P4S1j+A8X9VTV01w/+7tHKYJUr
	aSzjysiLLAtOMwCt1EZGAQo25ESRsXG9puXp4/Utf/6ZNfmdP0/x04aKGiZO/aAohdespQ9QHk5Du
	qroVjoSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Owr-00000006YGO-2iMs;
	Mon, 28 Apr 2025 13:55:05 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Obv-00000006UsI-3hEf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 13:33:29 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-31062172698so50397041fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 06:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745847205; x=1746452005; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OTzOZIYgOSm5iHgHYHs17cr0e11rjTGNrgKqn3vjBeY=;
        b=K/J6mA0Ub2p3zEEH3U4LmmzlAceIasOOaKN/me0OrMp4pog54G2AD3RGhfxW1bvKlF
         40q0++x3/tw6pX8GUnEZv3rJGbHMM2kFiLCcz4tkaFsMsuQqFfA/Cn2peOY+31SIODAz
         pejzy7be+HKkTxPLV2rN2oDM4JSnJ70uK2Ec8oDUbOYoOrHxeTVm1DTeOwYsaj1ueYAe
         GZo5h/eA33I2dIdmD/4seMDtSfj/HP5s7110XVEGGdiUpoEJmzqasGJ/VVh/ltSyGzmA
         7y7QPVLbcGU3mElqw3qE06vZeZqr9SJxLRGoIBpKzM6B3Bf4oxYNcD4KzEwy736sNiGJ
         CJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745847205; x=1746452005;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OTzOZIYgOSm5iHgHYHs17cr0e11rjTGNrgKqn3vjBeY=;
        b=ubXWrEIuL4+TCEU5MyefOqCdPbSY7F4gyFOH/MAgU09w1XA1/ctUg3Iw7QkS5sZPzz
         a8qIt9jhDqCXOZadCdokJaXm+X0bYxVomXYMSPaKlhCGMwlZrA4QSC7BXMAhJMog45t5
         VilU+/nfhaPIA80R5/tEExDuigo8J68xnyB12pphSo+jnfRZ7D7l38zL8+s4d/g4v7/l
         Ef7wckRopDXAtZZ+98EQwEhw1uLA+jWzb0ADz28xt2oLbeDqye51xHSuGrD6rYpz+C1R
         xkQa8eNnNFQNhYTtfF5MczK92gqTr2OCdMHoKBMAQ3f7OA9a1Ite0qzGVjuB1igDPJdG
         fBLw==
X-Gm-Message-State: AOJu0YxppE0d1Y6tMVM0QLzLxRXTI2YIGu1/v47U3Q38uMx/juVdPB3z
	a5+7ET3E6jPoahMl2g2rhsY0NwgHRRmCA9d25o3Z92MUCNGZKCk1QSF1DoDXkThJNXniUz4ww4Y
	E/XuOxEjP/1ofeU4oi+p3WmOM7xC88AA/bTulEwunPfo1s9+L+FI=
X-Gm-Gg: ASbGnctHUBSSNNCKBrL/tH/H3eueiO44i78JP/7AgAFRe0Os1YrsWO7ZhRpCsJZmLxg
	YiCCqP6PE3PsGpQj9DSUYShMXUQR81/Iki6IKIthNRO6ou7XvsyRLhGpGJ616cAlrQbnVhMY9o3
	PM01tYpK4g2dumyfm2F/2qJA==
X-Google-Smtp-Source: AGHT+IHg0AT7QEt67ZcddZlZ0cst6ypLtze1zVI2LlhtcUEjYYjpW8WKEZ9byzb7Kcir1ctsBebclNZzqHA8eROwPPw=
X-Received: by 2002:a05:651c:210f:b0:309:2653:5dda with SMTP id
 38308e7fff4ca-31907611ed5mr41639391fa.29.1745847204931; Mon, 28 Apr 2025
 06:33:24 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Apr 2025 15:33:13 +0200
X-Gm-Features: ATxdqUGU8Ix5hUMDuCCK8X0KpttsBjuthMDapQsBmSFhrZWTWQmiRbpNq7qfXFY
Message-ID: <CACRpkdaAiF0=SCNBuOT7fyJwbHdMXMfBsRUiQEPnqWO-7nYz5A@mail.gmail.com>
Subject: [GIT PULL] Generic entry for ARM for v6.16
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Russell King <rmk+kernel@armlinux.org.uk>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_063327_918859_D278C1A1 
X-CRM114-Status: GOOD (  18.77  )
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

Hi Russell,

please consider pulling the following git branch for ARM generic entry,
for v6.16 see below.

This branch is identical to the v6 patch series:
https://lore.kernel.org/linux-arm-kernel/20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org/

It's possible to squash patches, even all of them into one
big all-or-nothing patch, given the not very gradual nature generic
entry conversion seems to have.

Main upsides and downsides are in the signed tag.

This series contains the ACKs from tglx and paulmck.

What's new apart from rebasing is the two following remasks in the
signed tag:

- Makes it possible to move ahead with ARCH_WANTS_NO_INSTR.

- Good base for CONFIG_ARCH_HAS_RESCHED_LAZY which is a good
  base for CONFIG_PREEMPT_RT.

I think Arnd may be working on this and this could be a good starting
point for PREEMPT_RT.

Yours,
Linus Walleij


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
tags/arm-generic-entry-for-v6.16

for you to fetch changes up to 8c259349fa675315e1a80a463b04803501a045f6:

  ARM: entry: Reimplement local restart in C (2025-04-07 14:51:17 +0200)

----------------------------------------------------------------
Main upsides:

- Using the same common entry as used by x86_64, RISCV, S390
  and Loongarch, probably soon also ARM64.

- Moves ARM away from the obsoleted context tracker entry points
  user_enter_callable() and user_exit_callable() are now only used
  by ARM, CSKY and Xtensa.

- Solves a few lockdep warnings in the process.

- Converts a bit of assembly into C.

- Makes it possible to move ahead with ARCH_WANTS_NO_INSTR.

- Good base for CONFIG_ARCH_HAS_RESCHED_LAZY which is a good
  base for CONFIG_PREEMPT_RT.

Main downside:

- Slightly increased system call overhead, around 6% in
  measurements.

----------------------------------------------------------------
Linus Walleij (32):
      ARM: Switch to generic entry
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
      ARM: entry: Reimplement local restart in C

 arch/arm/Kconfig                    |   1 +
 arch/arm/include/asm/entry-common.h |  66 ++++++++++++
 arch/arm/include/asm/entry.h        |  14 +++
 arch/arm/include/asm/ptrace.h       |   8 +-
 arch/arm/include/asm/signal.h       |   4 -
 arch/arm/include/asm/stacktrace.h   |   2 +-
 arch/arm/include/asm/switch_to.h    |   4 +
 arch/arm/include/asm/syscall.h      |   7 ++
 arch/arm/include/asm/thread_info.h  |  22 ++--
 arch/arm/include/asm/traps.h        |   5 +-
 arch/arm/include/uapi/asm/ptrace.h  |   2 +
 arch/arm/kernel/Makefile            |   5 +-
 arch/arm/kernel/asm-offsets.c       |   1 +
 arch/arm/kernel/entry-armv.S        |  82 ++++-----------
 arch/arm/kernel/entry-common.S      | 198 +++++++++++++-----------------------
 arch/arm/kernel/entry-header.S      | 100 ++----------------
 arch/arm/kernel/entry.c             | 120 ++++++++++++++++++++++
 arch/arm/kernel/irq.c               |   6 ++
 arch/arm/kernel/irq.h               |   2 +
 arch/arm/kernel/process.c           |  25 ++++-
 arch/arm/kernel/ptrace.c            |  81 +--------------
 arch/arm/kernel/signal.c            |  68 +++----------
 arch/arm/kernel/syscall.c           |  59 +++++++++++
 arch/arm/kernel/traps.c             |  30 +-----
 arch/arm/mm/abort-ev4.S             |   2 +-
 arch/arm/mm/abort-ev4t.S            |   2 +-
 arch/arm/mm/abort-ev5t.S            |   4 +-
 arch/arm/mm/abort-ev5tj.S           |   6 +-
 arch/arm/mm/abort-ev6.S             |   2 +-
 arch/arm/mm/abort-ev7.S             |   2 +-
 arch/arm/mm/abort-lv4t.S            |  36 +++----
 arch/arm/mm/abort-macro.S           |   2 +-
 arch/arm/mm/abort-nommu.S           |   2 +-
 arch/arm/mm/fault.c                 |   4 +-
 arch/arm/mm/fault.h                 |   8 +-
 arch/arm/mm/pabort-legacy.S         |   2 +-
 arch/arm/mm/pabort-v6.S             |   2 +-
 arch/arm/mm/pabort-v7.S             |   2 +-
 38 files changed, 484 insertions(+), 504 deletions(-)
 create mode 100644 arch/arm/include/asm/entry-common.h
 create mode 100644 arch/arm/include/asm/entry.h
 create mode 100644 arch/arm/kernel/entry.c
 create mode 100644 arch/arm/kernel/irq.h
 create mode 100644 arch/arm/kernel/syscall.c

