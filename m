Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB670C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 08:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFtGXWe5rCtKPMNXJD0T5wrsZbPy4TJNnz3o7BrNjIY=; b=uClWJRiuXLsRdMLJkgr5GcDonC
	zEtm+HHTlHw4xsFSq4s8FLq8p+FzmbAWW9FV2cj9TTp9xGT1za2aBbDXmb5kLSAIzPI1Rv+suMkHf
	iS4RoYHRGWgD9ZQF0lERxZedWNy4kYFvyi03aEtVedzVh41H4DabxSK8OF3yx046m3CFGIQe12qxH
	9nz2mkBBdJVwruWag6Z1HI1phQPrNF/7eN1JtP7oSUdWMbODo1h+J8ES518/eM194bT4nYa5+0onj
	K2Z1adhMv+r440anTwJ7AKomvqoZS9GAXo6fP9mqKM0BQ4mmeGPqiCELosCia2IqUXkIqAjHS70TG
	8lJJYkqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSE6-0000000BEQZ-2sgi;
	Wed, 22 Jul 2026 08:22:51 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSE3-0000000BEPQ-2LRY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 08:22:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rFtGXWe5rCtKPMNXJD0T5wrsZbPy4TJNnz3o7BrNjIY=;
	b=3ja0wqkE5BD3A/Cjxz2wZTPtL5S3Z3NmdvVdnxZztFTAIG9K+ZXyzYZE9fe9gaNTi7NioudPC
	/EpZNXRySFm/8lX8LonphevmsENKsBH7orxYlloJXm4XVAQvos+dy5Zl5GzOebR15qSGgCvmL7n
	xt4lza3AzAc6z0eWEAv55uI=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4h4n7h1R6Yz1T4GP;
	Wed, 22 Jul 2026 16:13:20 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id B476A40537;
	Wed, 22 Jul 2026 16:22:40 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Jul 2026 16:22:40 +0800
Message-ID: <8b5110b5-2b3a-431a-a897-347ff400af24@huawei.com>
Date: Wed, 22 Jul 2026 16:22:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 21/36] arm64: Kconfig: Remove
 CONFIG_ARM64_DEBUG_PRIORITY_MASKING
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-22-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-22-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_012248_217058_2ED65B98 
X-CRM114-Status: GOOD (  11.48  )
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



On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
> Last users of CONFIG_ARM64_DEBUG_PRIORITY_MASKING have gone, so remove
> it.
> 
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/Kconfig | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b3afe0688919..e36dc4831200 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2334,17 +2334,6 @@ config ARM64_PSEUDO_NMI
>  
>  	  If unsure, say N
>  
> -if ARM64_PSEUDO_NMI
> -config ARM64_DEBUG_PRIORITY_MASKING
> -	bool "Debug interrupt priority masking"
> -	help
> -	  This adds runtime checks to functions enabling/disabling
> -	  interrupts when using priority masking. The additional checks verify
> -	  the validity of ICC_PMR_EL1 when calling concerned functions.
> -
> -	  If unsure, say N
> -endif # ARM64_PSEUDO_NMI
> -

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  config RELOCATABLE
>  	bool "Build a relocatable kernel image" if EXPERT
>  	select ARCH_HAS_RELR


