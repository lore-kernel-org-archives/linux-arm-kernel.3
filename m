Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FC0C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZ2RSrqdzwvbcRB9YpzdAxMffxIRcX8h6SQ0knzYOr4=; b=M1lBd/gLpeDKtojJQfD+Dqpbkb
	Jn+26cPj/QG1CIORPFOlioJVsRdq26n/FBaTNDfpZjywCOR8//K1i4U2NZTYLo6Q2QmYpniKe5NFL
	zUZQfrCYw6MjUAlUWflrDR7Pyyt2iqn6g/wlzGjNPd865ahJGLmB3rmTI2a07Zc824Mz1Mf2GvUuO
	RcFlXO+Lcqrgvs3TVcWBy4bXrAnN/zhjJ+rsjFmxgYV6dTV78LsLyB1RXhJHB+qGoz+C1z+6jY1ET
	00qDPEfmXiCSgWXayCNrpnLHkCXZGbNOKEiffn5CUnXklm85X6Rf6tp/KHhczcmgzzstl/1Cmf9HR
	gHPL7/Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBTA-0000000Fpve-3khC;
	Fri, 24 Jul 2026 08:41:24 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBT8-0000000Fput-0MW0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:41:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1784882480; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=oZ2RSrqdzwvbcRB9YpzdAxMffxIRcX8h6SQ0knzYOr4=;
	b=tEOpFMUvo6fjpbcY3zRLEoCBO5G+Fxv+0gpvOMlzp4JvyNsOCkjsSHZ8WjrgQ7UAZ3z2M2jHKu56aDTFWKjJlq3/o6UDTtWR6qak6mWMlmOmkvTRG3QjaiWnZgE4hjzxeyCJkYcYZMUX2O/ZnVV/tUrgmQEFlOAOLeATVsHSoOo=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X7ib9P9_1784882478;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X7ib9P9_1784882478 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 24 Jul 2026 16:41:19 +0800
Date: Fri, 24 Jul 2026 16:41:18 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH v3 26/28] KVM: arm64: Add FEAT_NV3 detection
Message-ID: <nrezy2eavvkr3jckeuisommccuifwmxfx4737nhcarwxuwhssk@h7n6ucd5qnlh>
References: <20260722074234.3330999-1-maz@kernel.org>
 <20260722074234.3330999-27-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722074234.3330999-27-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_014122_297994_9CFBA08F 
X-CRM114-Status: GOOD (  13.19  )
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

On Wed, Jul 22, 2026 at 08:42:32AM +0800, Marc Zyngier wrote:
> Now that everything is in place to engage the FEAT_NV3 fast-path,
> add the detection code to cpufeature.c.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kernel/cpufeature.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index c9c124b0ccc8e..6ae1c816e2010 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2627,6 +2627,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>  		.matches = has_cpuid_feature,
>  		ARM64_CPUID_FIELDS(ID_AA64MMFR4_EL1, NV_frac, NV2P1)
>  	},
> +	{
> +		.desc = "FEAT_NV3",
> +		.capability = ARM64_HAS_NV3,
> +		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
> +		.matches = has_cpuid_feature,
> +		ARM64_CPUID_FIELDS(ID_AA64MMFR4_EL1, NV_frac, NV3)
> +	},

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

>  	{
>  		.capability = ARM64_HAS_32BIT_EL0_DO_NOT_USE,
>  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
> --
> 2.47.3

