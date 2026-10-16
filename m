Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59C7CC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 04:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+G5oNGHBtgSEfaM4yLK0yHRWSGLMFpyUUu9ssREcRk=; b=IP6/DR+/6Mn5eZBIHHWfe3ZC0T
	6159DinPCJzH7B1horCz2SYKhpf5GEYN7gkJLKG4LlvXPLGUM9cW8eRZe/i/B04WYV3wRC0uHMgod
	/TN+WA7T7trncEffFW+GdYrAiiqdVq85qLcm1ou4+IWB5Kj1oPToNy3MMxcFAJ7wuD4oRDAPQqXTm
	/sBuKwUV4fym+PHl2rrnFnlTW2mCs33zn0VwMaBzNiUOBcy+86f6ydqi2idjTQblyMlhaZWkqmcRa
	HMHwz/KWki+d3jX370z8CrxkfKD22hRgFPIFXiZPIiGtQ2WdfcXEMknvqSFpd705BKuaIYR4BbDiF
	73C1WF/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHZbY-00000001yLf-3koe;
	Fri, 16 Oct 2026 04:31:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHZbW-00000001yLA-1Wk0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 04:31:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 369241476;
	Thu, 15 Oct 2026 21:31:33 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE2543F871;
	Thu, 15 Oct 2026 21:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792125096; bh=7dvgtR6IAJzmByMHoU98gCi2VvaEl4YphESQfyGMYs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i2XNg9RYo68YXCxpG4Ep0vz7SCjihqAY0qVVIe2GCxbC049N49ZUN5d+K3okqBHd7
	 ScnlxUeqcFHr63+D0J+h/SeqsBosSudpFH2jh0W7/U4bEK3n59PP6z6t3eVbw1BpNA
	 y8X5Ts2Li+BK8RAHdnZG8fIcdEZE/APfhhY/+l8k=
Date: Fri, 16 Oct 2026 10:01:33 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, tabba@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Use symbolic constants for the ccmp NZCV
 immediates
Message-ID: <i45aoi7mqknrhxm6ubpif5hwgahqcje64vjhfwzspnte472bd5@sqohcb3mftnc>
References: <20261009072147.474952-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009072147.474952-1-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_213138_483814_B78219B6 
X-CRM114-Status: GOOD (  17.32  )
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

On Fri, Oct 09, 2026 at 08:21:47AM +0100, Fuad Tabba wrote:
> The ccmp instructions in the EL2 setup code, reset_pmuserenr_el0 and
> the hyp vectors give the flags to set when their condition fails as a
> raw NZCV immediate, #4 or #8. Which condition that leaves true for the
> branch that follows has to be worked out from the pseudocode each time.
> 
> Define CCMP_NZCV_EQ and CCMP_NZCV_LT from the PSR bits, named for the
> condition each leaves true, and pass those instead.
> 
> No functional change intended.
> 
> Suggested-by: Will Deacon <will@kernel.org>
> Link: https://lore.kernel.org/all/asIQ1ZwUjkmNJbRP@willie-the-truck/
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  arch/arm64/include/asm/assembler.h | 2 +-
>  arch/arm64/include/asm/el2_setup.h | 4 ++--
>  arch/arm64/include/asm/ptrace.h    | 4 ++++
>  arch/arm64/kvm/hyp/hyp-entry.S     | 2 +-
>  4 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
> index 0b58b550e8dce..b4b97e03db828 100644
> --- a/arch/arm64/include/asm/assembler.h
> +++ b/arch/arm64/include/asm/assembler.h
> @@ -500,7 +500,7 @@ alternative_else_nop_endif
>  	mrs	\tmpreg, id_aa64dfr0_el1
>  	ubfx	\tmpreg, \tmpreg, #ID_AA64DFR0_EL1_PMUVer_SHIFT, #4
>  	cmp	\tmpreg, #ID_AA64DFR0_EL1_PMUVer_NI
> -	ccmp	\tmpreg, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF, #4, ne
> +	ccmp	\tmpreg, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF, #CCMP_NZCV_EQ, ne
>  	b.eq	9000f				// Skip if no PMU present or IMP_DEF
>  	msr	pmuserenr_el0, xzr		// Disable PMU access from EL0
>  9000:
> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index 1da277baacf78..c0ece880e85bd 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -137,7 +137,7 @@
>  	mrs	x1, id_aa64dfr0_el1
>  	ubfx	x0, x1, #ID_AA64DFR0_EL1_PMUVer_SHIFT, #4
>  	cmp	x0, #ID_AA64DFR0_EL1_PMUVer_NI
> -	ccmp	x0, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF, #4, ne
> +	ccmp	x0, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF, #CCMP_NZCV_EQ, ne
>  	b.eq	.Lskip_pmu_\@			// Skip if no PMU present or IMP_DEF
>  	mrs	x0, pmcr_el0			// Disable debug access traps
>  	ubfx	x0, x0, #11, #5			// to EL2 and allow access to
> @@ -422,7 +422,7 @@
>  	mrs	x1, id_aa64dfr0_el1
>  	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMUVer_SHIFT, #4
>  	cmp	x1, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF
> -	ccmp	x1, #ID_AA64DFR0_EL1_PMUVer_V3P9, #8, ne
> +	ccmp	x1, #ID_AA64DFR0_EL1_PMUVer_V3P9, #CCMP_NZCV_LT, ne
>  	b.lt	.Lskip_pmuv3p9_\@		// Skip if < PMUv3p9 or IMP_DEF
>  
>  	orr	x0, x0, #HDFGRTR2_EL2_nPMICNTR_EL0
> diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
> index f7dc5fb9427d6..15c381ef7d2c2 100644
> --- a/arch/arm64/include/asm/ptrace.h
> +++ b/arch/arm64/include/asm/ptrace.h
> @@ -30,6 +30,10 @@
>  #define PSR_MODE_THREAD_BIT	(1 << 0)
>  #define PSR_IL_BIT		(1 << 20)
>  
> +/* CCMP NZCV immediates that make the named condition hold */
> +#define CCMP_NZCV_EQ		(PSR_Z_BIT >> 28)
> +#define CCMP_NZCV_LT		(PSR_N_BIT >> 28)
> +
>  /* AArch32-specific ptrace requests */
>  #define COMPAT_PTRACE_GETREGS		12
>  #define COMPAT_PTRACE_SETREGS		13
> diff --git a/arch/arm64/kvm/hyp/hyp-entry.S b/arch/arm64/kvm/hyp/hyp-entry.S
> index 03f97d71984c4..8621eacd13738 100644
> --- a/arch/arm64/kvm/hyp/hyp-entry.S
> +++ b/arch/arm64/kvm/hyp/hyp-entry.S
> @@ -46,7 +46,7 @@ el1_sync:				// Guest trapped into EL2
>  	mrs	x0, esr_el2
>  	ubfx	x0, x0, #ESR_ELx_EC_SHIFT, #ESR_ELx_EC_WIDTH
>  	cmp	x0, #ESR_ELx_EC_HVC64
> -	ccmp	x0, #ESR_ELx_EC_HVC32, #4, ne
> +	ccmp	x0, #ESR_ELx_EC_HVC32, #CCMP_NZCV_EQ, ne
>  	b.ne	el1_trap
>  
>  	/*
> -- 
> 2.39.5
> 

