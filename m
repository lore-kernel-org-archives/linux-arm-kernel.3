Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CECCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 09:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQQcN91JYp8LP/P8dq9S6DwHu2J6IWC+LIrNOPBCE3E=; b=uEQ7JPA0GyqH3PW39bRuNhZhh4
	XYNeQ2Ew4FxwvM8QhDpQ1tK3OpZq54MmbqfZWvKfz1f4+au/fbQbCDyDGJbeR7QSrqPwh3bb5c3Pk
	jl61EhZVxjK4NY8vnppir6ZhSmC3u5W9SrwlDG3sZsbXFzVMsrpDSCK5fmQGGYEkBhfIDVPmeGz6A
	eprc4u+1XjcFWUD5B5LAdFaW3lAwuIhRHgG55EX31g+1V026MrmsnMdNHbtf01IKvQU45Dfmt/Qij
	sQ5wyb4mQrhDrKbGd0LCNPHd8CjBWu8mauiOivURSwJC/3euIzz1GoZT5/Ep1m31JUG+sDycKhVaX
	F1v927uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQM3P-0000000AJKQ-0Tuj;
	Fri, 22 May 2026 09:20:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQM3L-0000000AJIt-48mP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 09:20:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD5B81C01;
	Fri, 22 May 2026 02:20:13 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55DC23F7B4;
	Fri, 22 May 2026 02:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779441618; bh=5/WDhjKZ0zxg7IRZA5h/AyU0LXUj7WScqINlbmD6ppM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J2LXS/vJuoNb23KU68GTNQemU1r9hgJAVxyds7wFfIKQlXi6O6cDkTs+Sw6i9Ra6B
	 dP2G+aAxT4uSm64QcR/rLNHOGmNHf5KDrmdHOqiQS1Z25VRKw+bQG/wAOEKP59foBt
	 RMUUleX2MIaGNA7Gb4pPPY4KGJd3CKz79trOQk54=
Date: Fri, 22 May 2026 10:20:14 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>, Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>, Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: mm: Add note about overlays in PIE_EL1
Message-ID: <ahAfznOLiv+oG+Bv@e129823.arm.com>
References: <20260521-poe_futex-v1-0-1da286b8f9b2@arm.com>
 <20260521-poe_futex-v1-1-1da286b8f9b2@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521-poe_futex-v1-1-1da286b8f9b2@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_022024_285879_8D9C6115 
X-CRM114-Status: GOOD (  16.10  )
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

LGTM.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

> It isn't completely obvious why user page types do not have overlays
> applied in PIE_EL1. Add a comment to that effect, to avoid
> unpleasant surprises in the future.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/include/asm/pgtable-prot.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
> index 212ce1b02e15..6e2f99820909 100644
> --- a/arch/arm64/include/asm/pgtable-prot.h
> +++ b/arch/arm64/include/asm/pgtable-prot.h
> @@ -175,6 +175,13 @@ static inline bool __pure lpa2_is_enabled(void)
>  	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_READONLY),      PIE_R_O)   | \
>  	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_SHARED),        PIE_RW_O))
>  
> +/*
> + * Regular user page types such as _PAGE_SHARED must not have overlays applied
> + * in PIE_EL1. If POE is enabled at EL1, and in the absence of FEAT_LSUI, this
> + * would break futex atomic operations on user memory with a non-default
> + * POIndex; the privileged atomic load/store instructions would be mistakenly
> + * checked against POR_EL1.
> + */
>  #define PIE_E1	( \
>  	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS),           PIE_NONE_O) | \
>  	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS_RO),        PIE_NONE_O) | \
> 
> -- 
> 2.51.2
> 
> 

-- 
Sincerely,
Yeoreum Yun

