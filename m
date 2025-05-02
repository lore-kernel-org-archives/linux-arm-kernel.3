Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AEDC3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ecXMoqRiAJqQ7+z0QHC3HixFy9oKnj7LNDRJfMhbalM=; b=yMOjzHjG7uqJa/Z6UoemcQpCxv
	IDj/pnaWlwb4g0shSC/E94hU4VMygCi/yHizBESoVLKXvRnrzrtIgbOBVprFkszlEmusb89NsSQ4L
	iLZhxruNDR4OYDQOpEtPoqaFjgzGvSBjUoFqHjG0dN++40jLNYahvnuT2Q3ZtcM87nG/Er8+1Cs8Z
	BxfCJ0QZ+ouBaEg7Nlxv/KPODO+4r2FkSkMBV4Vgm5rkNmG/Sev3EGtFpswQVpwMDaXB47JGBfyhP
	BH/S+fz/iBM7wZiOUa4R8E3T0tdkgxmNGIwR+AJZyyPDrywd4WAzGLMcse17RcpcJtMefA+vt5p1Z
	YDnEdZsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAu6f-00000002eYT-19OO;
	Fri, 02 May 2025 17:23:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAtwN-00000002ceT-0Mfa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 17:12:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2D5945C04EA;
	Fri,  2 May 2025 17:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75993C4CEE4;
	Fri,  2 May 2025 17:12:42 +0000 (UTC)
Date: Fri, 2 May 2025 18:12:40 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: will@kernel.org, broonie@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, yury.khrustalev@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	shmeerali.kolothum.thodi@huawei.com, james.morse@arm.com,
	mark.rutland@arm.com, huangxiaojia2@huawei.com,
	akpm@linux-foundation.org, surenb@google.com, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, nd@arm.com,
	Peter Collingbourne <pcc@google.com>
Subject: Re: [PATCH v3 1/3] arm64: add FEAT_MTE_TAGGED_FAR feature
Message-ID: <aBT9CA7vnlfszTDw@arm.com>
References: <20250410074721.947380-1-yeoreum.yun@arm.com>
 <20250410074721.947380-2-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410074721.947380-2-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_101247_167831_38AC0434 
X-CRM114-Status: GOOD (  12.05  )
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

On Thu, Apr 10, 2025 at 08:47:19AM +0100, Yeoreum Yun wrote:
> Add FEAT_MTE_TAGGED_FAR cpucap which makes FAR_ELx report
> all non-address bits on a synchronous MTE tag check fault since Armv8.9
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Acked-by: Yury Khrustalev <yury.khrustalev@arm.com>
[...]
> @@ -3191,6 +3199,7 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
>  #ifdef CONFIG_ARM64_MTE
>  	HWCAP_CAP(ID_AA64PFR1_EL1, MTE, MTE2, CAP_HWCAP, KERNEL_HWCAP_MTE),
>  	HWCAP_CAP(ID_AA64PFR1_EL1, MTE, MTE3, CAP_HWCAP, KERNEL_HWCAP_MTE3),
> +	HWCAP_CAP(ID_AA64PFR2_EL1, MTEFAR, IMP, CAP_HWCAP, KERNEL_HWCAP_MTE_FAR),

Nitpick: from a theoretical bisectability perspective, I'd move the
hwcap exposing to the following patch. The rest, feature detection etc
can stay in this file. Otherwise, one can apply this patch, see the
hwcap but not get the actual behaviour.

>  #endif /* CONFIG_ARM64_MTE */
>  	HWCAP_CAP(ID_AA64MMFR0_EL1, ECV, IMP, CAP_HWCAP, KERNEL_HWCAP_ECV),
>  	HWCAP_CAP(ID_AA64MMFR1_EL1, AFP, IMP, CAP_HWCAP, KERNEL_HWCAP_AFP),
> diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> index 285d7d538342..e2b13454e38a 100644
> --- a/arch/arm64/kernel/cpuinfo.c
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -160,6 +160,7 @@ static const char *const hwcap_str[] = {
>  	[KERNEL_HWCAP_SME_SFEXPA]	= "smesfexpa",
>  	[KERNEL_HWCAP_SME_STMOP]	= "smestmop",
>  	[KERNEL_HWCAP_SME_SMOP4]	= "smesmop4",
> +	[KERNEL_HWCAP_MTE_FAR]		= "mte_far",

Personal preference: "mtefar" (no underscore), mostly because there's no
other underscore in the hwcap strings yet ;).

-- 
Catalin

