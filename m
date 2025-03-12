Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A33C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 18:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dR4Z7GVHURSby8xRbYMo+7FpzlvtIJxGVKgF8KuNqPk=; b=JqIcHDPATUgWDZWAPTObGb1tPS
	cEm3erttoCZS20QSfAwULJBT6P37jTTy6vgKdybiN/6UbW9hlNVRW9GMESMgdmET4cHaFoXnzssM+
	fLJyodChN+9fRv7YbANKu8ASisR13BbG4vPCJr84RwOlzcfzdZ9kHuvoSGTjg091AakjGWlxb2idU
	WqeDm0xHlKBmmRG4h2Ezu+bUDeZdwTOQN4AkPAj4+SGPTKit8Pmu+AVxcePUMzFT8yU2+I0Wb5PZI
	iTVBZTq1E+BkkDG3AHys+qwAzsqSZmYj+5RHyJQLdU+hpHCEEDFmomevebQc0cH5GSDv+G3TlbUU/
	pry+o8Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsQQq-00000009DHh-1S7n;
	Wed, 12 Mar 2025 18:03:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsQNu-00000009Ckg-1YZh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 18:00:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 48830A47172;
	Wed, 12 Mar 2025 17:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4796C4CEDD;
	Wed, 12 Mar 2025 18:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741802448;
	bh=HN1FCCnOPEE1t9kDpU0yT04ErPNnu/s1L++w4bo0Eyk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=nJe5CU02GRqxawUj3zBmpDi9uypIV37zQ6ZHT4HmzeJonfYaFdBq8I8cx6dpmlqQt
	 ZxEWrXQQNjUtDJ9rtkWmugwVVT8zTZzDvLzXfGidPvut94rz5VcphYane24BWGgPpH
	 EGOvWc/yeTadVLE1WI6oaY+56Tphly0MY0Vwk4Ye3+Csh9qldIDLF/SAzyKPaCSCIl
	 aJraceyr5Aj6TQ0UclTtuWH+oA2QdoTIO6y9+oTO+J8hJMX3Pg2BBVpndEf/KC17dJ
	 EYyMxndQbBD7eZGzTM75dDF+SVZJ1bqK1Zbi3EyX2R/i1Jz+MhwRSd+NrE8OgQiX/J
	 OtGX/zH41eYAQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 68F38CE1401; Wed, 12 Mar 2025 11:00:48 -0700 (PDT)
Date: Wed, 12 Mar 2025 11:00:48 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <rmk+kernel@armlinux.org.uk>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel <linux-kernel@vger.kernel.org>, frederic@kernel.org
Subject: Re: [GIT PULL] Generic entry for ARM
Message-ID: <1277cefd-b080-42a5-bfe5-57296e7ccc3e@paulmck-laptop>
References: <CACRpkdZCiiMTwf7eGJJ9aCKFOC3_xTGv1JKQUijjyp+_++cZ_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZCiiMTwf7eGJJ9aCKFOC3_xTGv1JKQUijjyp+_++cZ_A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_110050_536430_89A221E6 
X-CRM114-Status: GOOD (  30.23  )
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
Reply-To: paulmck@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Feb 28, 2025 at 01:49:36PM +0100, Linus Walleij wrote:
> Hi Russell,
> 
> please consider pulling the following git branch for generic entry,
> see below.
> 
> This branch was just harvested from my own v5 patch series on
> lore with b4 am -t 20250225-arm-generic-entry-v5-0-2f02313653e5@linaro.org
> then git am on top of v6.14-rc1, so you can do the same if you
> prefer.
> 
> It's possible to squash patches, even all of them into one
> big all-or-nothing patch, given the not very gradual nature generic
> entry conversion seems to have.
> 
> Main upsides and downsides are in the signed tag.
> 
> I don't know who the most important stakeholders are, but I guess
> the context tracker maintainer (Paul McKenney) and the people working
> on generic entry (tglx) could have a say on how important this is, or isn't.
> 
> I think it's pretty neat.

No argument here!

Once you are confident that you have all the needed "noinstr"
and "__always_inline" instances in place, could you please add
ARCH_WANTS_NO_INSTR to the list of "select" clauses for "config ARM"
in arch/arm/Kconfig?

Once all architectures that support trampoline-based tracing also select
ARCH_WANTS_NO_INSTR we can drop RCU Tasks Rude.  ;-)

In the meantime, for the series:

Acked-by: Paul E. McKenney <paulmck@kernel.org>

							Thanx, Paul

> Yours,
> Linus Walleij
> 
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
> 
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
> tags/arm-generic-entry-for-v6.15
> 
> for you to fetch changes up to 98b8e133458a3feefdf882ea16fb7f1f576a49e5:
> 
>   ARM: entry: Reimplement local restart in C (2025-02-28 13:40:44 +0100)
> 
> ----------------------------------------------------------------
> Main upsides:
> 
> - Using the same common entry as used by x86_64, RISCV, S390
>   and Loongarch, probably soon also ARM64.
> 
> - Moves ARM away from the obsoleted context tracker entry points
>   user_enter_callable() and user_exit_callable() are now only used
>   by ARM, CSKY and Xtensa.
> 
> - Solves a few lockdep warnings in the process.
> 
> - Converts a bit of assembly into C.
> 
> Main downside:
> 
> - Slightly increased system call overhead, around 6% in
>   measurements.
> 
> ----------------------------------------------------------------
> Linus Walleij (31):
>       ARM: Prepare includes for generic entry
>       ARM: ptrace: Split report_syscall()
>       ARM: entry: Skip ret_slow_syscall label
>       ARM: process: Rewrite ret_from_fork i C
>       ARM: process: Remove local restart
>       ARM: entry: Invoke syscalls using C
>       ARM: entry: Rewrite two asm calls in C
>       ARM: entry: Move trace entry to C function
>       ARM: entry: save the syscall sp in thread_info
>       ARM: entry: move all tracing invocation to C
>       ARM: entry: Merge the common and trace entry code
>       ARM: entry: Rename syscall invocation
>       ARM: entry: Create user_mode_enter/exit
>       ARM: entry: Drop trace argument from usr_entry macro
>       ARM: entry: Separate call path for syscall SWI entry
>       ARM: entry: Drop argument to asm_irqentry macros
>       ARM: entry: Implement syscall_exit_to_user_mode()
>       ARM: entry: Drop the superfast ret_fast_syscall
>       ARM: entry: Remove fast and offset register restore
>       ARM: entry: Untangle ret_fast_syscall/to_user
>       ARM: entry: Do not double-call exit functions
>       ARM: entry: Move work processing to C
>       ARM: entry: Stop exiting syscalls like IRQs
>       ARM: entry: Complete syscall and IRQ transition to C
>       ARM: entry: Create irqentry calls from kernel mode
>       ARM: entry: Move in-kernel hardirq tracing to C
>       ARM: irq: Add irqstack helper
>       ARM: entry: Convert to generic entry
>       ARM: entry: Handle dabt, pabt, and und as interrupts
>       ARM: entry: Block IRQs in early IRQ context
>       ARM: entry: Reimplement local restart in C
> 
>  arch/arm/Kconfig                    |   1 +
>  arch/arm/include/asm/entry-common.h |  66 ++++++++++++
>  arch/arm/include/asm/entry.h        |  14 +++
>  arch/arm/include/asm/ptrace.h       |   8 +-
>  arch/arm/include/asm/signal.h       |   4 -
>  arch/arm/include/asm/stacktrace.h   |   2 +-
>  arch/arm/include/asm/switch_to.h    |   4 +
>  arch/arm/include/asm/syscall.h      |   7 ++
>  arch/arm/include/asm/thread_info.h  |  22 ++--
>  arch/arm/include/asm/traps.h        |   5 +-
>  arch/arm/include/uapi/asm/ptrace.h  |   2 +
>  arch/arm/kernel/Makefile            |   5 +-
>  arch/arm/kernel/asm-offsets.c       |   1 +
>  arch/arm/kernel/entry-armv.S        |  82 ++++-----------
>  arch/arm/kernel/entry-common.S      | 198 +++++++++++++-----------------------
>  arch/arm/kernel/entry-header.S      | 100 ++----------------
>  arch/arm/kernel/entry.c             | 120 ++++++++++++++++++++++
>  arch/arm/kernel/irq.c               |   6 ++
>  arch/arm/kernel/irq.h               |   2 +
>  arch/arm/kernel/process.c           |  25 ++++-
>  arch/arm/kernel/ptrace.c            |  81 +--------------
>  arch/arm/kernel/signal.c            |  68 +++----------
>  arch/arm/kernel/syscall.c           |  59 +++++++++++
>  arch/arm/kernel/traps.c             |  30 +-----
>  arch/arm/mm/abort-ev4.S             |   2 +-
>  arch/arm/mm/abort-ev4t.S            |   2 +-
>  arch/arm/mm/abort-ev5t.S            |   4 +-
>  arch/arm/mm/abort-ev5tj.S           |   6 +-
>  arch/arm/mm/abort-ev6.S             |   2 +-
>  arch/arm/mm/abort-ev7.S             |   2 +-
>  arch/arm/mm/abort-lv4t.S            |  36 +++----
>  arch/arm/mm/abort-macro.S           |   2 +-
>  arch/arm/mm/abort-nommu.S           |   2 +-
>  arch/arm/mm/fault.c                 |   4 +-
>  arch/arm/mm/fault.h                 |   8 +-
>  arch/arm/mm/pabort-legacy.S         |   2 +-
>  arch/arm/mm/pabort-v6.S             |   2 +-
>  arch/arm/mm/pabort-v7.S             |   2 +-
>  38 files changed, 484 insertions(+), 504 deletions(-)
>  create mode 100644 arch/arm/include/asm/entry-common.h
>  create mode 100644 arch/arm/include/asm/entry.h
>  create mode 100644 arch/arm/kernel/entry.c
>  create mode 100644 arch/arm/kernel/irq.h
>  create mode 100644 arch/arm/kernel/syscall.c

