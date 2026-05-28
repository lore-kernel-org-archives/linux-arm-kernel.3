Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD4CCD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 10:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uf8OOS9w8K2nnKpcG8N7Or//SZ7kw7jH9ROTyM2KyWY=; b=KfXPnbrj4TyWgdW8Y7wy7Y58aD
	9mX5ZQ1d0+rk/7P3qTQdCQeOrR6B3sUmxwn9oCjBHXHd/l/2PbkAUAurBFocMKPuE76RzC6XRU56s
	799EXNhaL9aoaBGOGhb1r6fqoRGxdpo9UdLj3bkZhvEKmQiLoepZmk4X2drHbJ+P5YWAqfq8/xcZl
	C+XD376bQU1FR47PFTLCBFSGQkyJVlXhe2vZOp7eWVQK3bhZDFikcq8hoDhHm70+RmjjdE6/tYv9f
	ANLMIq39gngXH71pUYNwAOnsS8/0EPisTeEniwr0mi/euSLo0c+lOAxC3gye8HofKTJT5q4xoKxYf
	TXuqaKtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSYR3-00000005clB-2L0X;
	Thu, 28 May 2026 10:57:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSYR1-00000005ckE-1CdS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 10:57:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B7E64176A;
	Thu, 28 May 2026 10:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1161F000E9;
	Thu, 28 May 2026 10:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779965874;
	bh=uf8OOS9w8K2nnKpcG8N7Or//SZ7kw7jH9ROTyM2KyWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DEkKoxVoorrPdTxtupr2rvWQFXSCXdd2vYUnDkDTq4rdf8mTSR5uOW/DRTJSwA26o
	 609khKhGlox+UYDSKgxr9FqU27djS4eFqeok1Q3N/Pz6+SZq+bpR/pUDk2+fl5DkXX
	 6F6eGcG3tAgrmCzRqNym+Q+kUyxUn9m0+mQUjr6oPRiw16AvZO0EOxV3oxWU5HL+7n
	 jdl6kjRd+AcpE1S+oAnMYimCEgqSvDaM9hqWx12ThU7zphz7T3FjOZ8W3Psr30Xq5w
	 WCKsmMJ2mOMcQkXYEvKZDskSIMaQT408znIGE/fYFL0ANb+PgRaWp8WlSCF+fjTiXt
	 gMSnaOP66gfqA==
Date: Thu, 28 May 2026 11:57:49 +0100
From: Will Deacon <will@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, maz@kernel.org
Subject: Re: [PATCH v4 4/6] arm64/cpufeature: Add field details for
 ID_AA64DFR1_EL1 register
Message-ID: <ahgfrdlEioodRPQ1@willie-the-truck>
References: <20260407-arm-debug-8-9-v4-0-a4864e69b0ea@kernel.org>
 <20260407-arm-debug-8-9-v4-4-a4864e69b0ea@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-arm-debug-8-9-v4-4-a4864e69b0ea@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_035755_363390_4BEB7570 
X-CRM114-Status: GOOD (  22.82  )
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

On Tue, Apr 07, 2026 at 09:29:46AM -0500, Rob Herring (Arm) wrote:
> From: Anshuman Khandual <anshuman.khandual@arm.com>
> 
> This adds required field details for ID_AA64DFR1_EL1, and also drops dummy
> ftr_raz[] array which is now redundant. These register fields will be used
> to enable increased breakpoint and watchpoint registers via FEAT_Debugv8p9
> later. The register fields have been marked as FTR_STRICT, unless there is
> a known variation in practice.
> 
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm64/kernel/cpufeature.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index c31f8e17732a..24c8e9147e35 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -570,6 +570,21 @@ static const struct arm64_ftr_bits ftr_id_aa64dfr0[] = {
>  	ARM64_FTR_END,
>  };
>  
> +static const struct arm64_ftr_bits ftr_id_aa64dfr1[] = {
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_ABL_CMPs_SHIFT, 8, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_DPFZS_SHIFT, 4, 0),

Why does FTR_LOWER_SAFE make sense for DPFZS? From what I can tell, the
new behaviour isn't opt-in, so maybe an FTR_EXACT of 0 would make more
sense if we have to be non-strict (along with a comment like we have for
DFR0.PMUVer)?

> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_EBEP_SHIFT, 4, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_ITE_SHIFT, 4, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_ABLE_SHIFT, 4, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_PMICNTR_SHIFT, 4, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_SPMU_SHIFT, 4, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_CTX_CMPs_SHIFT, 8, 0),

I find it very weird for this to be non-strict when DFR0.CTX_CMPs _is_
strict.

> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_WRPs_SHIFT, 8, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_BRPs_SHIFT, 8, 0),

Given that things like hw_breakpoint_reset() rely on the sanitised
register view to determine the number of {break,watch}points, I think we
have to be strict here unless that is changed.

> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_SYSPMUID_SHIFT, 8, 0),

Again, I'm not sure that FTR_LOWER_SAFE makes a lot of sense here, but
it's hard to tell without an upstream driver for the system PMU.

> +	ARM64_FTR_END,
> +};
> +
>  static const struct arm64_ftr_bits ftr_mvfr0[] = {
>  	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, MVFR0_EL1_FPRound_SHIFT, 4, 0),
>  	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, MVFR0_EL1_FPShVec_SHIFT, 4, 0),
> @@ -756,10 +771,6 @@ static const struct arm64_ftr_bits ftr_single32[] = {
>  	ARM64_FTR_END,
>  };
>  
> -static const struct arm64_ftr_bits ftr_raz[] = {
> -	ARM64_FTR_END,
> -};
> -
>  #define __ARM64_FTR_REG_OVERRIDE(id_str, id, table, ovr) {	\
>  		.sys_id = id,					\
>  		.reg = 	&(struct arm64_ftr_reg){		\
> @@ -832,7 +843,7 @@ static const struct __ftr_reg_entry {
>  
>  	/* Op1 = 0, CRn = 0, CRm = 5 */
>  	ARM64_FTR_REG(SYS_ID_AA64DFR0_EL1, ftr_id_aa64dfr0),
> -	ARM64_FTR_REG(SYS_ID_AA64DFR1_EL1, ftr_raz),
> +	ARM64_FTR_REG(SYS_ID_AA64DFR1_EL1, ftr_id_aa64dfr1),

I'm guessing that KVM will need some updates for this in its sys reg
handling code?

Will

