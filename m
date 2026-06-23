Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A60CDB47C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 08:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7X4nosi8hgJdn6rn+Z4ZHcOUo1kxZv8E9Yj83tJZkM=; b=uDl56MUn5eeKIIS5xLlmuWpaZL
	xfIVzfaSnIoophGnYmQ0Co0ejUYe0TcT/pevuaG8Yyb2VwQevhRaljPtn8jPcCMIJpMXHLNc40fKm
	7pKbNJEw8eqBGeo6aFNQnAVw9Joi+PR6jFGDepepaXEU2U4wLOwa5ZJHowKL8P2ZLUU2NLAeskS3a
	W7q5dTLMjIPqzj4NQDNcgE/3pq1RvWJkcAA0rKUwt8ABPlSYrO6Cn69zgwkd84WYw0b/UTaIVaoTb
	31xUcLS4k1jkB7frtGtM1YhRmAiC+5BJHqebN9fNps4bTfmxM+gCaoJ0NvzIZzci7KWGlWNNkSwzV
	EAPn1J4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwAF-00000005sn7-0eSs;
	Tue, 23 Jun 2026 08:07:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbw9b-00000005sZr-2cVm;
	Tue, 23 Jun 2026 08:06:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782202001;
	bh=05sDxDxhH+7UoIrgdabJtlXr867z5VKROPNR6f1UT4I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=owfJ3Ygz4Dlx/2o5TREY+3za/AJzA8mphrSFgVyPQoi9HTGiZZrHV2+/ej3XnEFZh
	 +CTa6YjU6GHZzR4dtdFA1ZoPuNObDNh8ZH7kFeGjvHwsW4vGaG5sFY/a1caDLRQ5Z4
	 og32giKwkqQ7CGZ3AxAgTzH3TCaZHGyCMWCc0FHZIJFpOog4tLPexsrCY7Oz3R1NQr
	 e98SP4UH8O55uMFya5lLafWNDUqpmF2Jkv3T+33QmFXN0fDKAdFTn8ocZ0Wfrw2eH9
	 Cy0hSS++zxNj8eVk8OHFsJzuWlpTEO0iB58eEfYeID8Yc6YWP/MfDFrPuRQhHlHJvo
	 cM3ElXnOyX75Q==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 324C117E10FC;
	Tue, 23 Jun 2026 10:06:41 +0200 (CEST)
Message-ID: <24670280-508d-4794-b5f4-1dda825d9289@collabora.com>
Date: Tue, 23 Jun 2026 10:06:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl: mediatek: Restore PINCTRL_MT8189 to tristate
To: Justin Yeh <justin.yeh@mediatek.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260529100308.51271-1-justin.yeh@mediatek.com>
 <20260529100308.51271-2-justin.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260529100308.51271-2-justin.yeh@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_010643_839764_7F2617C9 
X-CRM114-Status: GOOD (  16.52  )
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

On 5/29/26 12:02, Justin Yeh wrote:
> Under the GKI + vendor_dlkm model, vendor-specific pinctrl cannot be
> built into the GKI vmlinux. Upstream's recent switch of PINCTRL_MT8189
> to bool prevents building as a loadable module, which breaks DDK module
> usage. Restore tristate so MT8189 pinctrl can be packaged as a kernel
> module in vendor_dlkm.
> 
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>

The MODULE_LICENSE change shall come before this one.

Besides - since there's no problem in having the pinctrl drivers as module for
MT8189, I imagine that this is analogously true for all (or most of) the others.

Looks like getting those to build as modules is trivial, too - so, can you at
this point please do the same for all of the MediaTek pinctrl drivers that are
trivial to enable as tristate?

P.S.: After reordering the commits, this one is
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Thanks,
Angelo

> ---
>   drivers/pinctrl/mediatek/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> index 4819617d9368..a75434e7e989 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -270,7 +270,7 @@ config PINCTRL_MT8188
>   	  map specific eint which doesn't have real gpio pin.
>   
>   config PINCTRL_MT8189
> -        bool "MediaTek MT8189 pin control"
> +        tristate "MediaTek MT8189 pin control"
>           depends on OF
>           depends on ARM64 || COMPILE_TEST
>           default ARM64 && ARCH_MEDIATEK



