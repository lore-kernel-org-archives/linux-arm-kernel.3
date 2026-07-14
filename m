Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59C6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 08:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=506m4GAuhBaT5Fj/1/6U1LHAFbPrmTAr+ZgWtn1qXdc=; b=iJOHpYDNiT4lTX
	2+K5jtGjJKH6L4xRPBP0bBn7mRLRnTmGLRu+0y5ZRm2UMYNwaDYsAcmkvyd+BXSHAW8GziRUOe40W
	VveQkuDyq47QxmnPnZBXKyphHEwVN+LWbUqyzEzQWPB3AxMXiwg9Qggkf916JP28E7/S4/pvuSFw6
	PXeiDt76GxYMBMHNJ1E8bUhp68jkiZ8I7gk5/A3m0QeTgoFXMeMyeZf7jWg+nr6g6bCbLUHF/k2Fj
	r2IGujDlZyGXRayrvtf3JM372qBWVv+prYrKAS8D7rII2u/vHp4AagVeE1QXc5aIuiOkesnu8kUmG
	KjsmwUsbreWE+vR4RAfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYsj-0000000BMde-2UHx;
	Tue, 14 Jul 2026 08:52:49 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYsf-0000000BMcc-2PbA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 08:52:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=506m4GAuhBaT5Fj/1/6U1LHAFbPrmTAr+ZgWtn1qXdc=;
	b=vvHGxy5eE7RVAnMkjCsWpoYKlwhecG2/SZLrfD0iWX7bU7vwB2HSqj2N58hiZcP1sn86JQDHL
	ECl8unuSwdtF4N9HiMgLYHeUA91tAAnAx4UAxiSaW4Cde5+cGc8YO3yMdoahcn7an+Tn2Omr3ZV
	oi+xCMwg/L+bnVWGEzX3dR4=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4gztB33mLlzcbMk;
	Tue, 14 Jul 2026 16:43:23 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 99C0240561;
	Tue, 14 Jul 2026 16:52:37 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 14 Jul 2026 16:52:36 +0800
Message-ID: <99efcb43-1a1d-4467-9237-efc5355a1f4f@huawei.com>
Date: Tue, 14 Jul 2026 16:52:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 35/36] arm64: nmi: Add Kconfig for NMI
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-36-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-36-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_015246_069565_3B946808 
X-CRM114-Status: GOOD (  15.66  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, Mark Brown <broonie@kernel.org>, catalin.marinas@arm.com, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
> From: Mark Brown <broonie@kernel.org>
> 
> Since NMI handling is in some fairly hot paths we provide a Kconfig
> option which allows support to be compiled out when not needed.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/Kconfig | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index e36dc4831200..968a9d97549a 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2195,6 +2195,24 @@ endmenu # "ARMv8.7 architectural features"
>  config AS_HAS_MOPS
>  	def_bool $(as-instr,.arch_extension mops)
>  
> +menu "ARMv8.8 architectural features"
> +
> +config ARM64_NMI
> +	bool "Enable support for Non-maskable Interrupts (NMI)"

We should depends on ARM_GIC_V3 as FEAT_NMI is only valid when
FEAT_GICv3_NMI implemented.


> +	default y
> +	help
> +	  Non-maskable interrupts are an architecture and GIC feature
> +	  which allow the system to configure some interrupts to be
> +	  configured to have superpriority, allowing them to be handled
> +	  before other interrupts and masked for shorter periods of time.
> +
> +	  The feature is detected at runtime, and will remain disabled
> +	  if the cpu does not implement the feature. It will also be
> +	  disabled if pseudo NMIs are enabled at runtime.
> +
> +endmenu # "ARMv8.8 architectural features"
> +
> +
>  menu "ARMv8.9 architectural features"
>  
>  config ARM64_POE


