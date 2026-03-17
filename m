Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0998FD7079
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQc4bd0ilkjbSNjGMCgmkOKO2JmA/jg+HurPoc3KgU8=; b=lq7HtcaHoQEniEkjjhRqFqhvqK
	3Va4xhCha1mPYCBZnXjUO6xFuoVGALYAGzXq6QL2CLau0zTs/hlEEZlXdVD1yhmgOEn0M18kBAKoR
	zct9zYBacVHbKS7wOPtTugdRG8b1rn3uj1m01QWtnUFtoO//zZG5hZh4+GwTrXMRFg0CrUvshJrCL
	AZSfnRU8KN7YoCWTQLKfTp1NRsDQiDB2UxuKwjCx/Nvb/As+p3NqfewT+MpWbykLj5OpJ4L3Bd6wx
	Le9qxPDd+R4ohIg18ZVKTTPQwxhKvaQ82TJnXGrgKf3Mu3qoBuR1X8YsZyGpY2mjzSUqJ497Hb3Vz
	Ti8ddOyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SAK-000000064wW-2snI;
	Tue, 17 Mar 2026 11:00:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SAJ-000000064wA-0tEZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 11:00:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F4DD440A1;
	Tue, 17 Mar 2026 11:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFD3EC19425;
	Tue, 17 Mar 2026 11:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773745246;
	bh=D9+ljMcoiZyCaCMfqoN3FwEpjRE42TDCVmchQSoVReg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=PE/N5nknJnR/aKxp7MZkTPkYp+fdjpWoPj162EXomZ8lgySWRmbeofS89UqXkUq51
	 ss4Qn+yoS0AqbOUNfJ85BIhtAil1et4/JzRIPjDNKo8ZY7Pc/SG85UUmE7W45uuJ/w
	 Nilw/RX36NHMSuCNimGuLAkyJWb1k9ZCn02mYb23TAFQYp6Wex4SXHid6LJqLLMkbr
	 U8XU//Gbtd8RYDvFDlvfA760iJuVtb702Ezz+ubFlTVc9hq5dRFX27z57e1/8VZTQE
	 qLdTr/zaeL/p2usQSII6r32oh1Nraf80MSSfY9KO39HyYskuB2zto4U+N7tPT4UYUN
	 QvPF27QRvYwOA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id C0237F4007C;
	Tue, 17 Mar 2026 07:00:44 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Tue, 17 Mar 2026 07:00:44 -0400
X-ME-Sender: <xms:XDS5aYayN2Dzy7Icc_KoLcQ33RUJOKWwir3OEI-ByFlNE6wy2wQxOg>
    <xme:XDS5aeM6MqWsYJMhhteDkv3_5lrjVe3L574Yq7UdM5Edy9OGfOhUfz5V5k_exy2Z3
    T3lAlQwvQwD-jqGsxS4IOIqxlqHAawJrz1Tm276cHj_9ZsNlUi1JEU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftddutdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeeffeevtdeifedttddtuddukeefkeffjeehjedvtdeihfdutdevhfeljefh
    leeiudenucffohhmrghinheplhgushdrshgsnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrugdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqudeijedthedttdejledqfeefvdduieegudehqdgrrhgusgeppehkvghrnh
    gvlhdrohhrghesfihorhhkohhfrghrugdrtghomhdpnhgspghrtghpthhtohepudehpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehkvghrnhgvlhdqthgvrghmsegrnhgurh
    hoihgurdgtohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdr
    tghomhdprhgtphhtthhopehmrghrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtph
    htthhopehrohhsthgvughtsehgohhoughmihhsrdhorhhgpdhrtghpthhtoheptghmlhhl
    rghmrghssehgohhoghhlvgdrtghomhdprhgtphhtthhopehqphgvrhhrvghtsehgohhogh
    hlvgdrtghomhdprhgtphhtthhopehsrghmihhtohhlvhgrnhgvnhesghhoohhglhgvrdgt
    ohhmpdhrtghpthhtohepshgvrghnjhgtsehgohhoghhlvgdrtghomhdprhgtphhtthhope
    ifihhllhhmtghvihgtkhgvrhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:XDS5aZc8PFDgM0G-NXPoSEKQWtq_UQOghzk--B-UsgPYLXaTn_5Fag>
    <xmx:XDS5aXrp80j_aXMboVxHREJRLuOT-MVtLLRoNDcigcJNzbnSUiteSA>
    <xmx:XDS5aSR1-ZxTKvbsewfeW9O3l2_F1XWzipss8X1X1eLfxyCNAydepg>
    <xmx:XDS5afUHN4F-bWZXR-RZ65Red8_zjfnKcoL5AimgOpybcNSizSj56w>
    <xmx:XDS5afeLG1wOein348MqLu2XUK5KkJR1uuTmrb27HCNrnifFDuUokr4x>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 93C00700065; Tue, 17 Mar 2026 07:00:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A4nMOTjRT8v3
Date: Tue, 17 Mar 2026 11:59:49 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Carlos Llamas" <cmllamas@google.com>,
 linux-arm-kernel@lists.infradead.org
Cc: "Sami Tolvanen" <samitolvanen@google.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Kees Cook" <kees@kernel.org>,
 "Quentin Perret" <qperret@google.com>,
 "Steven Rostedt" <rostedt@goodmis.org>,
 "Will McVicker" <willmcvicker@google.com>,
 "Sean Christopherson" <seanjc@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Message-Id: <6053b599-c00e-47d0-8f9c-4554fec6d288@app.fastmail.com>
In-Reply-To: <20260313061852.4025964-1-cmllamas@google.com>
References: <20260313061852.4025964-1-cmllamas@google.com>
Subject: Re: [PATCH v7] arm64: implement support for static call trampolines
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_040047_322652_A08D34B4 
X-CRM114-Status: GOOD (  33.68  )
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

Hi Carlos,

On Fri, 13 Mar 2026, at 07:18, Carlos Llamas wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Implement arm64 support for the 'unoptimized' static call variety, which
> routes all calls through a single trampoline that is patched to perform a
> tail call to the selected function.
>
> Since static call targets may be located in modules loaded out of direct
> branching range, we need to use a ADRP/ADD pair to load the branch target
> into R16 and use a branch-to-register (BR) instruction to perform an
> indirect call. Unlike on x86, there is no pressing need on arm64 to avoid
> indirect calls at all cost, but hiding it from the compiler as is done
> here does have some benefits:
> - the literal is located in .rodata, which gives us the same robustness
>   advantage that code patching does;
> - no performance hit on CFI enabled Clang builds that decorate compiler
>   emitted indirect calls with branch target validity checks.
>

It was pointed out to me that this claim is unsubstantiated: IIRC this patch was written before kcfi was introduced, but even if it wasn't, it might be better to call out the actual difference here.

kCFI conditionally performs an indirect call to address 'x', after loading the u32 located at x-4 and comparing it with a compile time constant that encodes the function prototype expected by the call site.

The static call trampoline involves two branches: one direct branch to the trampoline, and an indirect one to the target function. (We can drop the conditional branch and the ret here, see below).

If there is any measurable difference, it will likely be highly dependent on micro-architectural details and the nature of the workload, and neither one is obviously more efficient.

TL;DR maybe just drop the bullet point? But at least drop the claim that it speeds up static call dispatch with CFI enabled.


> Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Carlos Llamas <cmllamas@google.com>
> ---
> v7:
>   - Took Ard's v3 patch (as it leaves the code patching logic out) and
>     rebased it on top  of mainline 7.0-rc3.
>   - Dropped the changes to arch/arm64/lib/insn.c and instead switched to
>     the (now) existing aarch64_insn_write_literal_u64().
>   - Added the RET0 trampoline define which points to the generic stub
>     __static_call_return0.
>   - Made the HAVE_STATIC_CALL conditional on CFI as suggested by Ard.
>   - Added .type and .size sections to the trampoline definition to
>     support ABI tools.
>
>  arch/arm64/Kconfig                   |  1 +
>  arch/arm64/include/asm/static_call.h | 33 ++++++++++++++++++++++++++++
>  arch/arm64/kernel/Makefile           |  1 +
>  arch/arm64/kernel/static_call.c      | 20 +++++++++++++++++
>  arch/arm64/kernel/vmlinux.lds.S      |  1 +
>  5 files changed, 56 insertions(+)
>  create mode 100644 arch/arm64/include/asm/static_call.h
>  create mode 100644 arch/arm64/kernel/static_call.c
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
> index 000000000000..331580542fd4
> --- /dev/null
> +++ b/arch/arm64/include/asm/static_call.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_STATIC_CALL_H
> +#define _ASM_STATIC_CALL_H
> +
> +#define __ARCH_DEFINE_STATIC_CALL_TRAMP(name, target)			    \
> +	asm("	.pushsection .static_call.text, \"ax\"			\n" \
> +	    "	.align	3						\n" \
> +	    "	.globl	" STATIC_CALL_TRAMP_STR(name) "			\n" \
> +	    STATIC_CALL_TRAMP_STR(name) ":				\n" \
> +	    "	hint	34	/* BTI C */				\n" \
> +	    "	adrp	x16, 1f						\n" \
> +	    "	ldr	x16, [x16, :lo12:1f]				\n" \
> +	    "	cbz	x16, 0f						\n" \
> +	    "	br	x16						\n" \
> +	    "0:	ret							\n" \
> +	    "	.type	" STATIC_CALL_TRAMP_STR(name) ", %function	\n" \
> +	    "	.size	" STATIC_CALL_TRAMP_STR(name) ", . - " 
> STATIC_CALL_TRAMP_STR(name) " \n" \
> +	    "	.popsection						\n" \
> +	    "	.pushsection .rodata, \"a\"				\n" \
> +	    "	.align	3						\n" \
> +	    "1:	.quad	" target "					\n" \
> +	    "	.popsection						\n")
> +
> +#define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)			\
> +	__ARCH_DEFINE_STATIC_CALL_TRAMP(name, #func)
> +
> +#define ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)			\
> +	__ARCH_DEFINE_STATIC_CALL_TRAMP(name, "0x0")
> +

We could use either __static_call_return0 or __static_call_nop here, rather than 0x0, and do the same in the implementation of arch_static_call_transform(). That way, we can drop the cbz and ret instructions from the trampoline.

(__static_call_return0 is perfectly acceptable as a NOP, given that R0 is clobbered in any case after a function returning void returns, so just do whatever is easiest)

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
> index 000000000000..944ecabb821f
> --- /dev/null
> +++ b/arch/arm64/kernel/static_call.c
> @@ -0,0 +1,20 @@
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

Here, set func to &__static_call_return0 if it is NULL.

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
> 2.53.0.880.g73c4285caa-goog

