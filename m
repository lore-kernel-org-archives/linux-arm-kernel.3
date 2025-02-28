Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA831C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 12:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k9ZVSga6lwI98W0bLvyFgnwGf/I1aLNhuhYX32VhGps=; b=ULjU9l0fTe/iFQcE5DA7ZvJ9gT
	e6bKLIMrthaEuqewbdtCJwrpeRnLZNORiO348NerATliRA6B91DNI4/ZYiBJDiBTre1Le3DMLjky2
	xO8RF8+EeTxj4V4Vtzv2Q10grM7ihu4RQ+9kF7GkXcUeL0S0p2QCp/zLeTYaZ3HuDs3L4V9TCThcw
	i/uKxxCbsw0iIQHsc+RT3ZdlCZwCSTzfHIWLRI6BcdQ+Rl4MX2tywnpdGnmV4fWEyLpFNyY1BxeXo
	Be4q+jaAzj76QGLtlMDfPn7Dtp+5DCG35NDlvj8XycryyScUV9RaJ/MXKFgf7ze+BNwTo4czyf4em
	bR/5wIZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzpv-0000000AzLY-0VjE;
	Fri, 28 Feb 2025 12:51:27 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzoM-0000000Az5Z-0D73
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 12:49:51 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5494cb8c2e7so947319e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 04:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740746988; x=1741351788; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k9ZVSga6lwI98W0bLvyFgnwGf/I1aLNhuhYX32VhGps=;
        b=GbAYNk/KR822aOv+DTDZeVTG5YfTON5pk/9jNElhdxpMHK0dsHb6hEqEsFpW3hkvTl
         f/CxAzc3tPlF9sCM4o4gL6odBGkJVaj4By2zk9GEE3iz+FZN6WkGJrNEKjx3g3SrykiP
         ASpXaLGzaIltzIeVZH17hje2COCwKCz8YUftW7SFTgXW/AN/Rczm97kW3jAENUEb2UoK
         hDUC6jaU11S/4gFomhGbuEhIb91vyf1NNNooiNyrVCDzaaz/5820XJCa8ouqHw2JcXn9
         qjQA1aoURFBZadTbmWcb2Ht8I8tfig2XvJoD+ySTIsVPYwuuLqDqxX3kzNmTm6Ic9Zl5
         wKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740746988; x=1741351788;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k9ZVSga6lwI98W0bLvyFgnwGf/I1aLNhuhYX32VhGps=;
        b=TImSEq8bNtfuNXWSldJdV5jktVakKnL2NlERXwfCYf7rrMiNUINNyaP7WlKYNoRYuE
         hgUhbJxz9IIEARXak7pp5sOtklW7BsSxt7eIPBlIrITvTT/mP8HOrodgknPHZA4tykmV
         N7geSD4FZFd78W8Bdr1NWRWtykT1bvXjISto1Ms1O+dwbZNQqcUgcuvr/20GitAyujTo
         HsG7/l7ibsFnam/WBBwaIYlWjluo+mUMCirxdC+bTcdvINOssQBdOJBMKoOV9f6FN908
         kMURpzMSjBLzxIrVsG2aUlgMID9hjrQFt1O6/zp6HD4O8BPPNW1FHIgz908AHTPro4yX
         dZTw==
X-Gm-Message-State: AOJu0YybLrTk8P5kGyaQeGNtMhYrTfSm991qr5sHwOFpxvOT7Bj0l+Rz
	4YRJwFoX+tlftBLN9MgRBImy+cQsT/EzHRPSjZvoyErIQ7lALKOY1p2Y/xsi3TG2k4rQj9GDNXI
	Np7Q3noKn7EAXErv58y2pgcW3+KxgLCuXFVmAAg==
X-Gm-Gg: ASbGnctFpnlckYUxOM8sfSTyksxSgdeKlIE1eJpO00+4qKmwFsSr9o54+ajFNmL0SIP
	aZ7kZYbjuIhnZDoYowgLxr3VKYqXseUC9Cxyv4+uyuyelrqGWD8EarMcrAgvXPI2JIL4st82sIM
	ln0KV20fw=
X-Google-Smtp-Source: AGHT+IHv83YpGHio3+QUhR9YCHOCFGwkWFesxurjw0y4ui3gJWLrfpdRDm9UFJwwj67jhbgnlPAfU8P+mtTd204EoWM=
X-Received: by 2002:a05:6512:701:b0:549:4e7e:d397 with SMTP id
 2adb3069b0e04-5494e7ed39amr937756e87.0.1740746987344; Fri, 28 Feb 2025
 04:49:47 -0800 (PST)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 13:49:36 +0100
X-Gm-Features: AQ5f1Jr1JCLHNsD1t1m2zbNIWF1lepmNOrK6kS2jMjpmw7TZR5By60X1siM-XvU
Message-ID: <CACRpkdZCiiMTwf7eGJJ9aCKFOC3_xTGv1JKQUijjyp+_++cZ_A@mail.gmail.com>
Subject: [GIT PULL] Generic entry for ARM
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_044950_100992_44B12605 
X-CRM114-Status: GOOD (  17.30  )
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

please consider pulling the following git branch for generic entry,
see below.

This branch was just harvested from my own v5 patch series on
lore with b4 am -t 20250225-arm-generic-entry-v5-0-2f02313653e5@linaro.org
then git am on top of v6.14-rc1, so you can do the same if you
prefer.

It's possible to squash patches, even all of them into one
big all-or-nothing patch, given the not very gradual nature generic
entry conversion seems to have.

Main upsides and downsides are in the signed tag.

I don't know who the most important stakeholders are, but I guess
the context tracker maintainer (Paul McKenney) and the people working
on generic entry (tglx) could have a say on how important this is, or isn't.

I think it's pretty neat.

Yours,
Linus Walleij

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
tags/arm-generic-entry-for-v6.15

for you to fetch changes up to 98b8e133458a3feefdf882ea16fb7f1f576a49e5:

  ARM: entry: Reimplement local restart in C (2025-02-28 13:40:44 +0100)

----------------------------------------------------------------
Main upsides:

- Using the same common entry as used by x86_64, RISCV, S390
  and Loongarch, probably soon also ARM64.

- Moves ARM away from the obsoleted context tracker entry points
  user_enter_callable() and user_exit_callable() are now only used
  by ARM, CSKY and Xtensa.

- Solves a few lockdep warnings in the process.

- Converts a bit of assembly into C.

Main downside:

- Slightly increased system call overhead, around 6% in
  measurements.

----------------------------------------------------------------
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

