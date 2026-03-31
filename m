Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B80C1061B39
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 12:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDatyFVAiZLhLxBFtYnTIvtR7O2b1Etoyk1xIQrbCZ8=; b=eDtbcTqXkY8WBmIspgl1awJZ6x
	37sTzfIyQQEGb7b/as08lrMMls9zb4yscE2YTbMqVMVcsrmnYLof6bzuafppthzh1Sr+TYQOkSrl1
	ldOZ5ZdsZ6+iLuD0Ajs9YPpsqcE6+Aqk/ljfv3hCOY1YoStkidN2OiAZ8FeIM/Mn8I7CT+KDIUMVR
	Mw+shAMbYj2l/p0LbGV4p0mIJjwuKst/ObCZDsHf8RmC4Ey1vBu/Eac42xDCxkUDnK1V6eURqU4Be
	GgFKnSbMlZj+AUSXWQodVuL0Kaltvyeu7kUQbO8ADRDfYvZry5wPEF8960WHH+SE7ckx+rsjJjez7
	WNqC410g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Xrf-0000000CuhA-1x3t;
	Tue, 31 Mar 2026 12:06:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Xrc-0000000Cugp-17SH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 12:06:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A242C43CFD;
	Tue, 31 Mar 2026 12:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31819C2BC9E;
	Tue, 31 Mar 2026 12:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774958788;
	bh=nCD/5aGuYUj4L+YCsXbJhOdKE/QuS5AuzVdRTwZBaMc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=C9fJtmA1ePeEazZIzpwZaDNABi2ijNY7yhY2LRIymbb11/SJlEMKdiff83cReX+5i
	 z9Kkapz5RbV6BWWkdwNgi5A6TQXRgiNkcDuWd/mCVEEChUeA8zwF32kMWHopzxMmTr
	 yypyNXQyD9aGfpWh0JtJOeqxY2/2bIFz38qHeTNsbQAZjALN1uw8Zm5JrBOX93r5FP
	 mSoPklkmUGclMHMFHmIGQNZs9vvfZTGodPqJdsXaQsqJ6LDAsTFZUWBTWMZOvTmfs7
	 A1WpPiixkwMaZUYjrxoN8kMYsWVBJtYxveHt2dBZBU3mup2fJbLE/Xs19sq8QSpZYh
	 JubhnVThwN83w==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 46EEEF4006A;
	Tue, 31 Mar 2026 08:06:27 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Tue, 31 Mar 2026 08:06:27 -0400
X-ME-Sender: <xms:w7jLacjFp-NImW40mgm9cxKVvAuO8MtyAj8UMSczFZgO2vS--siBAg>
    <xme:w7jLaf25D0pPBQRzfIBBh6IZTmQoMWnFpfHwulYk-eRPwcWIaeLBF3lpQu9ou0tWd
    zae-er7E2l2wDJunXAjfshylDxftnpqYZtoSxsPWueaJPp96jeewnY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    foggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhguuceuihgv
    shhhvghuvhgvlhdfuceorghruggssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepfffhkefhfeefgfevvdehvedthfevvdelieekledufeeifeejvdevvddtueeilefh
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghdplhgushdrshgsnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrugdomhgvshhmthhprghu
    thhhphgvrhhsohhnrghlihhthidqudeijedthedttdejledqfeefvdduieegudehqdgrrh
    gusgeppehkvghrnhgvlhdrohhrghesfihorhhkohhfrghrugdrtghomhdpnhgspghrtghp
    thhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghrkhdrrhhuth
    hlrghnugesrghrmhdrtghomhdprhgtphhtthhopegrrhgusgdoghhithesghhoohhglhgv
    rdgtohhmpdhrtghpthhtoheptghmlhhlrghmrghssehgohhoghhlvgdrtghomhdprhgtph
    htthhopehsrghmihhtohhlvhgrnhgvnhesghhoohhglhgvrdgtohhmpdhrtghpthhtohep
    shgvrghnjhgtsehgohhoghhlvgdrtghomhdprhgtphhtthhopeifihhllhhmtghvihgtkh
    gvrhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggv
    rggurdhorhhgpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopeifihhllheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:w7jLaaF73S-Hof8rnzcGZSs8Luzde4kM1AR-ca5kBb6eCo-nA3Z9ug>
    <xmx:w7jLaXMcsevncWVmaI2ih1BuOcutoajiP7FQQM-vVULp_7VXQ35imQ>
    <xmx:w7jLaRKKxz0m9dkRODUt-ax_AUVC51sI_k2AU64u0_qKQlNLQ6xgzw>
    <xmx:w7jLaY9gyzVjEQToi-rYhCNvlVAEMeeAA9-bOeu6syMKhzmUZs9wuQ>
    <xmx:w7jLaVHQfW42uL28EHwfdQxuBnAZZY2VVqa58lYoRXUVBRVuULC8Q13G>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 21DD370006B; Tue, 31 Mar 2026 08:06:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Anx-CxvWeZ1g
Date: Tue, 31 Mar 2026 14:06:06 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Ard Biesheuvel" <ardb+git@google.com>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-hardening@vger.kernel.org, "Will Deacon" <will@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Carlos Llamas" <cmllamas@google.com>,
 "Sami Tolvanen" <samitolvanen@google.com>,
 "Sean Christopherson" <seanjc@google.com>, "Kees Cook" <kees@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Will McVicker" <willmcvicker@google.com>
Message-Id: <eb3fedac-7a99-4ad7-9883-832e193356f9@app.fastmail.com>
In-Reply-To: <20260331110422.301901-2-ardb+git@google.com>
References: <20260331110422.301901-2-ardb+git@google.com>
Subject: Re: [PATCH v8] arm64: Use static call trampolines when kCFI is enabled
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_050632_369380_C2B06F57 
X-CRM114-Status: GOOD (  30.52  )
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

On Tue, 31 Mar 2026, at 13:04, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Implement arm64 support for the 'unoptimized' static call variety, which
> routes all calls through a trampoline that performs a tail call to the
> chosen function, and wire it up for use when kCFI is enabled. This works
> around an issue with kCFI and generic static calls, where the prototypes
> of default handlers such as __static_call_nop() and __static_call_ret0()
> don't match the expected prototype of the call site, resulting in kCFI
> false positives [0].
>
> Since static call targets may be located in modules loaded out of direct
> branching range, this needs a ADRP/ADD pair to load the branch target

Sashiko correctly points out that this should say ADRP/LDR rather than
ADRP/ADD, and this means that the sequence is in fact different from the
one used by modules.

> into R16 and a branch-to-register (BR) instruction to perform an
> indirect call. This is the exact code sequence that is used by modules
> when the call target is out of direct branching range.
>

... so please drop this last sentence when applying.


> Unlike on x86, there is no pressing need on arm64 to avoid indirect
> calls at all cost, but hiding it from the compiler as is done here does
> have some benefits:
> - the literal is located in .rodata, which gives us the same robustness
>   advantage that code patching does;
> - no D-cache pollution from fetching hash values from .text sections.
>
> From an execution speed PoV, this is unlikely to make any difference at
> all.
>
> [0] https://lore.kernel.org/all/20260311225822.1565895-1-cmllamas@google.com/
>
> Cc: Carlos Llamas <cmllamas@google.com>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Sean Christopherson <seanjc@google.com>
> Cc: Kees Cook <kees@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Will McVicker <willmcvicker@google.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
> v8: Simplify the trampoline by combining the NULL and RET0 cases, and
>     dropping the conditional branch and return
> v7: https://lore.kernel.org/all/20260313061852.4025964-1-cmllamas@google.com/
>
>  arch/arm64/Kconfig                   |  1 +
>  arch/arm64/include/asm/static_call.h | 31 ++++++++++++++++++++
>  arch/arm64/kernel/Makefile           |  1 +
>  arch/arm64/kernel/static_call.c      | 23 +++++++++++++++
>  arch/arm64/kernel/vmlinux.lds.S      |  1 +
>  5 files changed, 57 insertions(+)
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 38dba5f7e4d2..9ea19b74b6c3 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -252,6 +252,7 @@ config ARM64
>  	select HAVE_RSEQ
>  	select HAVE_RUST if RUSTC_SUPPORTS_ARM64
>  	select HAVE_STACKPROTECTOR
> +	select HAVE_STATIC_CALL if CFI
>  	select HAVE_SYSCALL_TRACEPOINTS
>  	select HAVE_KPROBES
>  	select HAVE_KRETPROBES
> diff --git a/arch/arm64/include/asm/static_call.h 
> b/arch/arm64/include/asm/static_call.h
> new file mode 100644
> index 000000000000..b73960c949e4
> --- /dev/null
> +++ b/arch/arm64/include/asm/static_call.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_STATIC_CALL_H
> +#define _ASM_STATIC_CALL_H
> +
> +#define __ARCH_DEFINE_STATIC_CALL_TRAMP(name, target)		    \
> +	asm("	.pushsection .static_call.text, \"ax\"		\n" \
> +	    "	.align	4					\n" \
> +	    "	.globl	" name "				\n" \
> +	    name ":						\n" \
> +	    "	hint	34	/* BTI C */			\n" \
> +	    "	adrp	x16, 1f					\n" \
> +	    "	ldr	x16, [x16, :lo12:1f]			\n" \
> +	    "	br	x16					\n" \
> +	    "	.type	" name ", %function			\n" \
> +	    "	.size	" name ", . - " name "			\n" \
> +	    "	.popsection					\n" \
> +	    "	.pushsection .rodata, \"a\"			\n" \
> +	    "	.align	3					\n" \
> +	    "1:	.quad	" #target "				\n" \
> +	    "	.popsection					\n")
> +
> +#define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)			\
> +	__ARCH_DEFINE_STATIC_CALL_TRAMP(STATIC_CALL_TRAMP_STR(name), #func)
> +
> +#define ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)			\
> +	ARCH_DEFINE_STATIC_CALL_TRAMP(name, __static_call_return0)
> +
> +#define ARCH_DEFINE_STATIC_CALL_RET0_TRAMP(name)			\
> +	ARCH_DEFINE_STATIC_CALL_TRAMP(name, __static_call_return0)
> +
> +#endif /* _ASM_STATIC_CALL_H */
> diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
> index 76f32e424065..fe627100d199 100644
> --- a/arch/arm64/kernel/Makefile
> +++ b/arch/arm64/kernel/Makefile
> @@ -46,6 +46,7 @@ obj-$(CONFIG_MODULES)			+= module.o module-plts.o
>  obj-$(CONFIG_PERF_EVENTS)		+= perf_regs.o perf_callchain.o
>  obj-$(CONFIG_HARDLOCKUP_DETECTOR_PERF)	+= watchdog_hld.o
>  obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
> +obj-$(CONFIG_HAVE_STATIC_CALL)		+= static_call.o
>  obj-$(CONFIG_CPU_PM)			+= sleep.o suspend.o
>  obj-$(CONFIG_KGDB)			+= kgdb.o
>  obj-$(CONFIG_EFI)			+= efi.o efi-rt-wrapper.o
> diff --git a/arch/arm64/kernel/static_call.c 
> b/arch/arm64/kernel/static_call.c
> new file mode 100644
> index 000000000000..8b3a19e10871
> --- /dev/null
> +++ b/arch/arm64/kernel/static_call.c
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/static_call.h>
> +#include <linux/memory.h>
> +#include <asm/text-patching.h>
> +
> +void arch_static_call_transform(void *site, void *tramp, void *func, 
> bool tail)
> +{
> +	u64 literal;
> +	int ret;
> +
> +	if (!func)
> +		func = __static_call_return0;
> +
> +	/* decode the instructions to discover the literal address */
> +	literal = ALIGN_DOWN((u64)tramp + 4, SZ_4K) +
> +		  aarch64_insn_adrp_get_offset(le32_to_cpup(tramp + 4)) +
> +		  8 * aarch64_insn_decode_immediate(AARCH64_INSN_IMM_12,
> +						    le32_to_cpup(tramp + 8));
> +
> +	ret = aarch64_insn_write_literal_u64((void *)literal, (u64)func);
> +	WARN_ON_ONCE(ret);
> +}
> +EXPORT_SYMBOL_GPL(arch_static_call_transform);
> diff --git a/arch/arm64/kernel/vmlinux.lds.S 
> b/arch/arm64/kernel/vmlinux.lds.S
> index 2964aad0362e..2d1e75263f03 100644
> --- a/arch/arm64/kernel/vmlinux.lds.S
> +++ b/arch/arm64/kernel/vmlinux.lds.S
> @@ -191,6 +191,7 @@ SECTIONS
>  			LOCK_TEXT
>  			KPROBES_TEXT
>  			HYPERVISOR_TEXT
> +			STATIC_CALL_TEXT
>  			*(.gnu.warning)
>  	}
> 
> -- 
> 2.53.0.1018.g2bb0e51243-goog

