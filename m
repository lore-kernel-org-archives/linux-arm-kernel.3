Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98C7C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 06:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CnJ0eMvP0asJkEhnB2QBqAN1V7cUTfU+n2bdTzV33Qs=; b=lhQAyDrArhNkzA3n8lDhrDl67q
	pQrvx6AkOcEGdljB9HNhV7RsOYZLGvdmjNdDlsivFdMN/VnOtpCSC/GMEhra8MafDFYckTLWivZNW
	/9IJjgR/DfS8fQ4f2XmFYEDvIygCujKE7EZT5nN3kypOIfI5tqOLBv5aVckrRaewNLyFOW2I6Q/Fz
	36GS0pOheZkXESC6MRr8lAaqpSGv0MA3/UGNBT28sw2WAvmIih9kkVpldN4HPB0EIXD/eyxIDL5yr
	eg3CaIkNKpVtpxNWqzui22o9BRbk0q9Jb96E/rcVyL8FFvv7RLVvIqAYEWVvLzG6GFLEY3mqyUII3
	CVtz3IxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn951-0000000FYTv-3Gzc;
	Fri, 24 Jul 2026 06:08:19 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn94z-0000000FYTS-3ylC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 06:08:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1784873295; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=CnJ0eMvP0asJkEhnB2QBqAN1V7cUTfU+n2bdTzV33Qs=;
	b=iJiLYWf0nkkdmpyHa6FkyRQ2Iil1INL27tDxhTnok0aYbamUhy7YrWKXX/WxAmfI46AOC7TGMTDMQ15BtgSHhNLd9I7vfsttDtshBJQq/I2H+rgnpuOa5yOV/3P/18FIE6vrvC6Nsa08pIrO6Z5K6rgGj9I4U5Eg87rsULUfiyQ=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R271e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X7iAqER_1784873294;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X7iAqER_1784873294 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 24 Jul 2026 14:08:14 +0800
Date: Fri, 24 Jul 2026 14:08:14 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH v3 12/28] arm64: Add FEAT_NV2p1 detection
Message-ID: <leed6lsv67xhgslunjjt77oznuchk22pixp3nrefpiapz6udlf@4todi6bcqifk>
References: <20260722074234.3330999-1-maz@kernel.org>
 <20260722074234.3330999-13-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722074234.3330999-13-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_230818_325830_5F03A332 
X-CRM114-Status: GOOD (  13.00  )
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

On Wed, Jul 22, 2026 at 08:42:18AM +0800, Marc Zyngier wrote:
> Add the necessary NV2p1 probing to the cpufeature infrastructure.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kernel/cpufeature.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 9a22df0c5120f..c9c124b0ccc8e 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2620,6 +2620,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>  			{ /* Sentinel */ }
>  		},
>  	},
> +	{
> +		.desc = "FEAT_NV2p1",
> +		.capability = ARM64_HAS_NV2P1,
> +		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
> +		.matches = has_cpuid_feature,
> +		ARM64_CPUID_FIELDS(ID_AA64MMFR4_EL1, NV_frac, NV2P1)
> +	},

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

>  	{
>  		.capability = ARM64_HAS_32BIT_EL0_DO_NOT_USE,
>  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
> --
> 2.47.3

