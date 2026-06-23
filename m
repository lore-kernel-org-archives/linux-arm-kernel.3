Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDCCCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 08:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dw5fW7mPp1mZa6nLnYAvn5e0kvkO1A/ra0LkKGeobuU=; b=VD74/hJ/9r9/Axidl1DGJxWlA6
	lDOVVepQE37Coul8Wr4EW8BSIWS/N3NV9q9zoPEfcE35ii5KmhGDXo1m2gZf+lLUW7eUsOCIVDlo2
	dc2x2vv86zbc06T/IZ7ZQOcJDgG0g1KZlk5QntpsSfJhHoiwkmpdqKP+f0n3/GPkHownrgOROOJ6O
	+PAbAAE36InYb31xkrcz3kqurbRC81djA9IFN7cDW9BKlceY56GxK2J2R5x4WYBAKZOkY/4Fz2gib
	xJk6S8DPcUA6+/kAdVRsKqy5KNgpNbv0oFLBcLB3PAL/TeklpD8QKbkk69Dwe7JYPjNDaH2pobSYZ
	KCIIaMEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbw9b-00000005saX-2bSa;
	Tue, 23 Jun 2026 08:06:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbw9Z-00000005sZ6-1EZ2;
	Tue, 23 Jun 2026 08:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782201998;
	bh=2ModYSRenKENVNmwQIj/emlMitTe1H/N34OtBHiupCw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DMNcKRebgTvdvGNXIb4BUldrfwuq9bfEaX3+xBZ/8/IIdOXYhMgdriWi/BPF0EBym
	 s/iFQsUsyLwkwPgjMSJPdcUYMNx/E+J/CNcPQopJvfqcn80J8fDBShN9U2xvvo33tK
	 ACE3yMrIyZCopEKVkAEbjqAZ18EuKM45KLOZu7hxm+8B1o+GWDO/Ks57CM4TdopDdP
	 tj24t/J6WdHg4Axc8i7b3HBjHEVZzTo7fqtHlzpS2m9qjDTc3ECR1LhQLGut3n/d11
	 Bn05pJt5IWODSUrNVQnh39TJV78cWXHUiIqCdE790xUoamf6z5ph0FJi4vydC1Sqsp
	 iL9Oe1JTagVzQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8A3D317E0E64;
	Tue, 23 Jun 2026 10:06:38 +0200 (CEST)
Message-ID: <719d4716-8123-43cd-a646-118684565c6e@collabora.com>
Date: Tue, 23 Jun 2026 10:06:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: mediatek: mtk-infracfg: Export symbols for DDK
 modules
To: Justin Yeh <justin.yeh@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260529101613.55697-1-justin.yeh@mediatek.com>
 <20260529101613.55697-3-justin.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260529101613.55697-3-justin.yeh@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_010641_489397_EF9CDFC4 
X-CRM114-Status: GOOD (  19.90  )
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

On 5/29/26 12:16, Justin Yeh wrote:
> Export mtk_infracfg functions to allow other DDK modules (like
> mtk-scpsys) to use bus protection APIs.
> 
> Changes:
> - Add EXPORT_SYMBOL_GPL for set/clear bus_protection and init functions
> - Remove static and __init qualifiers from mtk_infracfg_init
> - Add mtk_infracfg_init() declaration to header
> - Remove postcore_initcall, let dependent modules call init explicitly
> - Add #include <linux/module.h> for export macros
> - Add MODULE_LICENSE("GPL") metadata
> 
> This allows mtk-infracfg to be built as a DDK module (.ko) and its
> functions to be used by other modules like mtk-scpsys for power domain
> management.
> 
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-infracfg.c   | 9 +++++++--
>   include/linux/soc/mediatek/infracfg.h | 1 +
>   2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-infracfg.c b/drivers/soc/mediatek/mtk-infracfg.c
> index 2acf19676af2..8a88805468cc 100644
> --- a/drivers/soc/mediatek/mtk-infracfg.c
> +++ b/drivers/soc/mediatek/mtk-infracfg.c
> @@ -7,6 +7,7 @@
>   #include <linux/jiffies.h>
>   #include <linux/regmap.h>
>   #include <linux/mfd/syscon.h>
> +#include <linux/module.h>
>   #include <linux/soc/mediatek/infracfg.h>
>   #include <asm/processor.h>
>   
> @@ -43,6 +44,7 @@ int mtk_infracfg_set_bus_protection(struct regmap *infracfg, u32 mask,
>   
>   	return ret;
>   }
> +EXPORT_SYMBOL_GPL(mtk_infracfg_set_bus_protection);
>   
>   /**
>    * mtk_infracfg_clear_bus_protection - disable bus protection
> @@ -73,8 +75,9 @@ int mtk_infracfg_clear_bus_protection(struct regmap *infracfg, u32 mask,
>   
>   	return ret;
>   }
> +EXPORT_SYMBOL_GPL(mtk_infracfg_clear_bus_protection);

Those two are ok, but I'd prefer to use namespaces (EXPORT_SYMBOL_NS_GPL) and to
import the namespace in the relevant drivers.

>   
> -static int __init mtk_infracfg_init(void)
> +int mtk_infracfg_init(void)
>   {
>   	struct regmap *infracfg;
>   
> @@ -90,4 +93,6 @@ static int __init mtk_infracfg_init(void)
>   				MT8192_INFRA_CTRL_DISABLE_MFG2ACP);
>   	return 0;
>   }
> -postcore_initcall(mtk_infracfg_init);
> +EXPORT_SYMBOL_GPL(mtk_infracfg_init);

Sorry, but that makes little sense.

Check the mtk_infracfg_init() function: if you avoid the postcore_initcall() there,
what's going to happen with MT8192?! :-)

Cheers,
Angelo

> +
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
> index 9956e18c5ffa..847431a7b967 100644
> --- a/include/linux/soc/mediatek/infracfg.h
> +++ b/include/linux/soc/mediatek/infracfg.h
> @@ -454,4 +454,5 @@ int mtk_infracfg_set_bus_protection(struct regmap *infracfg, u32 mask,
>   		bool reg_update);
>   int mtk_infracfg_clear_bus_protection(struct regmap *infracfg, u32 mask,
>   		bool reg_update);
> +int mtk_infracfg_init(void);
>   #endif /* __SOC_MEDIATEK_INFRACFG_H */


