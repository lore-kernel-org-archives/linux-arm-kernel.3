Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5570FC54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 09:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bxxEDqBUMzRHf9anrancixsAklPvxt/2mXBU1N+AqJo=; b=UXesa1Gvo76RKtdd54nmOyHdCq
	uFi6uM3CXRGs/mRAOQYB0IF3yLL1t+B2o4BHID/cw/O2+0ByvFdVlR7lb2044vqs+OAm4kdmylQeO
	yu0qjJnfRgcxZn8uNzAB9FHZkOH5c+sUzhASCdfZNzUtzOFb3c6Jq0T4/if4PQ5hGkgG7PAEU+Ov6
	O4IGt7aZs2DUMa/9C3T0f99f1QpnqO4oFAj+Wrzac+jr4Ho/1fO3AEFeq5VYlO3+eLrYvWlx5Jiq0
	jnbCgi4xaZdGDZLido5i/OYcWO/T73YK/3Dp376ng5LWV16HZv8NWUys/DmRAPEo1cQ9hhorycjTK
	JBcRCZpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNNP-0000000A3EW-1btj;
	Thu, 30 Jul 2026 09:48:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNNK-0000000A3Dv-2ZvT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 09:48:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E74B204C;
	Thu, 30 Jul 2026 02:48:21 -0700 (PDT)
Received: from e143914.arm.com (e143914.arm.com [10.2.213.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 161AD3F763;
	Thu, 30 Jul 2026 02:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785404905; bh=WCcxbt8cWBw/MJSGNEPdezkYv++GEzKPaSoAjrPupk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cwYOr1jnOBPVfZTPnducbeuKK2szQun0nSD4EDU+IHwfVsIRVbWnQ312YR0lUWGRT
	 6viI67IWtdTKwM7PVQ8UbNa0kit2vIFfCZ1j7LaTuFMuSx/GXawF2SnOF8jlawnYpH
	 OiBZQPRdV3o3SJMBvoVzcVxx7wQej3+oGhI08Hzo=
Date: Thu, 30 Jul 2026 10:48:21 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>
Subject: Re: [PATCH v4 02/29] arm64: Update ID_AA64MMFR4_EL1 description to
 2026-03 JSON release
Message-ID: <amsd5YfcjfMcBnLy@e143914.arm.com>
References: <20260730071022.296811-1-maz@kernel.org>
 <20260730071022.296811-3-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730071022.296811-3-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_024828_215081_D431B26D 
X-CRM114-Status: GOOD (  12.97  )
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

On Thu, Jul 30, 2026 at 08:09:55AM +0100, Marc Zyngier wrote:
> ID_AA64MMFR4_EL1 has gained a few fields and enum values in the past
> few months, so resync its definition with the 2026-03 JSON release.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Checked the values.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/tools/sysreg | 32 ++++++++++++++++++++++++++++----
>  1 file changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 7cb61aca3797f..3171c87eb2447 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2386,17 +2386,40 @@ EndEnum
>  EndSysreg
>  
>  Sysreg	ID_AA64MMFR4_EL1	3	0	0	7	4
> -Res0	63:48
> -UnsignedEnum	47:44	SRMASK
> +UnsignedEnum	63:60	MTEFGT
> +	0b0000	NI
> +	0b0001	IMP
> +EndEnum
> +UnsignedEnum	59:56	SCRX
> +	0b0000	NI
> +	0b0001	IMP
> +EndEnum
> +UnsignedEnum	55:52	TEV
> +	0b0000	NI
> +	0b0001	IMP
> +EndEnum
> +UnsignedEnum	51:48	TPS
> +	0b0000	VAL_0000
> +	0b0001	VAL_0001
> +	0b0010	VAL_0010
> +EndEnum
> +UnsignedEnum	47:44	SRMASK
> +	0b0000	NI
> +	0b0001	IMP
> +	0b0010	SRMASK2
> +EndEnum
> +UnsignedEnum	43:40	TLBID
>  	0b0000	NI
>  	0b0001	IMP
>  EndEnum
> -Res0	43:40
>  UnsignedEnum	39:36	E3DSE
>  	0b0000	NI
>  	0b0001	IMP
>  EndEnum
> -Res0	35:32
> +UnsignedEnum	35:32	EAESR
> +	0b0000	NI
> +	0b0001	IMP
> +EndEnum
>  UnsignedEnum	31:28	RMEGDI
>  	0b0000	NI
>  	0b0001	IMP
> @@ -2410,6 +2433,7 @@ UnsignedEnum	23:20	NV_frac
>  	0b0000	NV_NV2
>  	0b0001	NV2_ONLY
>  	0b0010	NV2P1
> +	0b0011	NV3
>  EndEnum
>  UnsignedEnum	19:16	FGWTE3
>  	0b0000	NI
> -- 
> 2.47.3
> 

