Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47031C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 06:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f38S9AhpgMTQ3QbKR8FFmsyRL7os9Le4hDnMslgtL44=; b=YG1BQHJSEOJ3ni
	gav9C1eEtcgDmBjxdYBSwuO+nFSeVGD0gx+gM1XDDUHYRjNs6aKZsEGxcCMlEk+xGO6ejRwRQkYkW
	7frgkhvg6PkoGfU/Ug29TDF1y/AUDFq6CLRf7q8auj4T3B1OgX7+/0sc6Ej9DvCXGwrR2bJhT7qdA
	xuaueSn6FqvR1KK4KLK/qo713RxxSqamx3re7V6Mvl8NH3lJ3y2JGIcZWEYdzmMXpt0RUElkLw0xe
	ULTKm9kPjDofnp6tvP/LRw10jr2X9VoJrGFl/hpRLluDT4/uz/MYgzKCfaHrMgW6UqB3DSRm5quso
	Qt9wvqPfCjbR9UO8sYWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6kUP-00000003h4l-0Ows;
	Mon, 21 Apr 2025 06:18:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6kSY-00000003guj-2PUq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 06:16:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89A291063;
	Sun, 20 Apr 2025 23:16:45 -0700 (PDT)
Received: from [10.162.16.49] (unknown [10.162.16.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7732F3F59E;
	Sun, 20 Apr 2025 23:16:47 -0700 (PDT)
Message-ID: <e703f1c9-2d71-4b27-8f29-f31a22e6e063@arm.com>
Date: Mon, 21 Apr 2025 11:46:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/debug: Drop redundant DBG_MDSCR_* macros
To: inux-arm-kernel@lists.infradead.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20250417105253.3188976-1-anshuman.khandual@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250417105253.3188976-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_231650_720558_C7B692A5 
X-CRM114-Status: GOOD (  19.13  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

+ linux-arm-kernel@lists.infradead.org

LAKML email address had a typo, just adding it back.

On 4/17/25 16:22, Anshuman Khandual wrote:
> MDSCR_EL1 has already been defined in tools sysreg format and hence can be
> used in all debug monitor related call paths. Subsequently all DBG_MDSCR_*
> macros become redundant and hence can be dropped off completely. While here
> convert all variables handling MDSCR_EL1 register as u64 which reflects its
> true width as well.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v6.15-rc2
> 
>  arch/arm64/include/asm/assembler.h      |  4 ++--
>  arch/arm64/include/asm/debug-monitors.h |  6 ------
>  arch/arm64/kernel/debug-monitors.c      | 22 +++++++++++-----------
>  arch/arm64/kernel/entry-common.c        |  2 +-
>  4 files changed, 14 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
> index ad63457a05c5..f229d96616e5 100644
> --- a/arch/arm64/include/asm/assembler.h
> +++ b/arch/arm64/include/asm/assembler.h
> @@ -53,7 +53,7 @@
>  	.macro	disable_step_tsk, flgs, tmp
>  	tbz	\flgs, #TIF_SINGLESTEP, 9990f
>  	mrs	\tmp, mdscr_el1
> -	bic	\tmp, \tmp, #DBG_MDSCR_SS
> +	bic	\tmp, \tmp, #MDSCR_EL1_SS
>  	msr	mdscr_el1, \tmp
>  	isb	// Take effect before a subsequent clear of DAIF.D
>  9990:
> @@ -63,7 +63,7 @@
>  	.macro	enable_step_tsk, flgs, tmp
>  	tbz	\flgs, #TIF_SINGLESTEP, 9990f
>  	mrs	\tmp, mdscr_el1
> -	orr	\tmp, \tmp, #DBG_MDSCR_SS
> +	orr	\tmp, \tmp, #MDSCR_EL1_SS
>  	msr	mdscr_el1, \tmp
>  9990:
>  	.endm
> diff --git a/arch/arm64/include/asm/debug-monitors.h b/arch/arm64/include/asm/debug-monitors.h
> index 8f6ba31b8658..1f37dd01482b 100644
> --- a/arch/arm64/include/asm/debug-monitors.h
> +++ b/arch/arm64/include/asm/debug-monitors.h
> @@ -13,14 +13,8 @@
>  #include <asm/ptrace.h>
>  
>  /* Low-level stepping controls. */
> -#define DBG_MDSCR_SS		(1 << 0)
>  #define DBG_SPSR_SS		(1 << 21)
>  
> -/* MDSCR_EL1 enabling bits */
> -#define DBG_MDSCR_KDE		(1 << 13)
> -#define DBG_MDSCR_MDE		(1 << 15)
> -#define DBG_MDSCR_MASK		~(DBG_MDSCR_KDE | DBG_MDSCR_MDE)
> -
>  #define	DBG_ESR_EVT(x)		(((x) >> 27) & 0x7)
>  
>  /* AArch64 */
> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
> index 58f047de3e1c..08f1d02507cd 100644
> --- a/arch/arm64/kernel/debug-monitors.c
> +++ b/arch/arm64/kernel/debug-monitors.c
> @@ -34,7 +34,7 @@ u8 debug_monitors_arch(void)
>  /*
>   * MDSCR access routines.
>   */
> -static void mdscr_write(u32 mdscr)
> +static void mdscr_write(u64 mdscr)
>  {
>  	unsigned long flags;
>  	flags = local_daif_save();
> @@ -43,7 +43,7 @@ static void mdscr_write(u32 mdscr)
>  }
>  NOKPROBE_SYMBOL(mdscr_write);
>  
> -static u32 mdscr_read(void)
> +static u64 mdscr_read(void)
>  {
>  	return read_sysreg(mdscr_el1);
>  }
> @@ -79,16 +79,16 @@ static DEFINE_PER_CPU(int, kde_ref_count);
>  
>  void enable_debug_monitors(enum dbg_active_el el)
>  {
> -	u32 mdscr, enable = 0;
> +	u64 mdscr, enable = 0;
>  
>  	WARN_ON(preemptible());
>  
>  	if (this_cpu_inc_return(mde_ref_count) == 1)
> -		enable = DBG_MDSCR_MDE;
> +		enable = MDSCR_EL1_MDE;
>  
>  	if (el == DBG_ACTIVE_EL1 &&
>  	    this_cpu_inc_return(kde_ref_count) == 1)
> -		enable |= DBG_MDSCR_KDE;
> +		enable |= MDSCR_EL1_KDE;
>  
>  	if (enable && debug_enabled) {
>  		mdscr = mdscr_read();
> @@ -100,16 +100,16 @@ NOKPROBE_SYMBOL(enable_debug_monitors);
>  
>  void disable_debug_monitors(enum dbg_active_el el)
>  {
> -	u32 mdscr, disable = 0;
> +	u64 mdscr, disable = 0;
>  
>  	WARN_ON(preemptible());
>  
>  	if (this_cpu_dec_return(mde_ref_count) == 0)
> -		disable = ~DBG_MDSCR_MDE;
> +		disable = ~MDSCR_EL1_MDE;
>  
>  	if (el == DBG_ACTIVE_EL1 &&
>  	    this_cpu_dec_return(kde_ref_count) == 0)
> -		disable &= ~DBG_MDSCR_KDE;
> +		disable &= ~MDSCR_EL1_KDE;
>  
>  	if (disable) {
>  		mdscr = mdscr_read();
> @@ -415,7 +415,7 @@ void kernel_enable_single_step(struct pt_regs *regs)
>  {
>  	WARN_ON(!irqs_disabled());
>  	set_regs_spsr_ss(regs);
> -	mdscr_write(mdscr_read() | DBG_MDSCR_SS);
> +	mdscr_write(mdscr_read() | MDSCR_EL1_SS);
>  	enable_debug_monitors(DBG_ACTIVE_EL1);
>  }
>  NOKPROBE_SYMBOL(kernel_enable_single_step);
> @@ -423,7 +423,7 @@ NOKPROBE_SYMBOL(kernel_enable_single_step);
>  void kernel_disable_single_step(void)
>  {
>  	WARN_ON(!irqs_disabled());
> -	mdscr_write(mdscr_read() & ~DBG_MDSCR_SS);
> +	mdscr_write(mdscr_read() & ~MDSCR_EL1_SS);
>  	disable_debug_monitors(DBG_ACTIVE_EL1);
>  }
>  NOKPROBE_SYMBOL(kernel_disable_single_step);
> @@ -431,7 +431,7 @@ NOKPROBE_SYMBOL(kernel_disable_single_step);
>  int kernel_active_single_step(void)
>  {
>  	WARN_ON(!irqs_disabled());
> -	return mdscr_read() & DBG_MDSCR_SS;
> +	return mdscr_read() & MDSCR_EL1_SS;
>  }
>  NOKPROBE_SYMBOL(kernel_active_single_step);
>  
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index b260ddc4d3e9..6dbfc1008007 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -354,7 +354,7 @@ static void cortex_a76_erratum_1463225_svc_handler(void)
>  
>  	__this_cpu_write(__in_cortex_a76_erratum_1463225_wa, 1);
>  	reg = read_sysreg(mdscr_el1);
> -	val = reg | DBG_MDSCR_SS | DBG_MDSCR_KDE;
> +	val = reg | MDSCR_EL1_SS | MDSCR_EL1_KDE;
>  	write_sysreg(val, mdscr_el1);
>  	asm volatile("msr daifclr, #8");
>  	isb();

