Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B67C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 10:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExmDqCUkQR6jZtfP5vYSrhMYk2o6MDN1u7yT91N+/Bg=; b=HfPE/Qb0uJ6rQm9VtxOjJVxNlw
	VDxoLupOBxbKEmV3csCSjebDfWORADmRb5d9vZnVxNVpNn7xO6WN53m25Maakriwc7sc9BKEPCXb9
	4vofs93ZsWPrSMEvICco9QLbv1C4kXU0smsCwYyPWzOLIx00x0v/xmgLWQ0S9MqqTlRQDbBa7z2Hk
	goa8ZTwi4QAAhE/6UCJVXeuGvhpk1iY/MpWnveOgfMgx/JpLFDIsI43swCClnvIOLiJxB2af6XsRW
	uwR0O2XFh30dPBLQxmDZ5/avO0Z2XYlf0PdSHPVXVqkqvz3sE2TD/Xz2z+xdaPnifwjPfld00AuWd
	EbsIKahw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeVQ-00000002MvQ-2iP7;
	Mon, 23 Jun 2025 10:34:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdvG-00000002G9Z-23mF;
	Mon, 23 Jun 2025 09:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750672625;
	bh=vgWm7jmOVVRzfgaQT6LeLtOXW+FZMqRHHMx2jmBo6ZY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kuQvgV4f27X0GiIFF3oN6c1a29VlG0nyTqYg4HX+X5nM39c37k3yTYvkFscLNKWal
	 qZLN9xAVvAmFe/unOSmD+iIFfNwa5yluAxHKn714f60zmAG5NMr7i7viMNuvmk8Zsh
	 qKpGDDTIsXqIpInG49O3KyUJR04Y+XScPaJzj2RGk4/ciUvMQfcAv9tdHc7SS2/fsH
	 OQGG16DGVo+7CyqII2f0s1cdYhprjKKprUKfgv/eLkT/ZZUL2gadhL1mSwjqsH05To
	 civyUR9lW6+POo4xRngFh38QrSL14xbhHaJ32Rinti8bOmSSqhfzKOHwJjAUIDEzhE
	 V6YJnJvglbxUw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8AE2A17E0CF9;
	Mon, 23 Jun 2025 11:57:04 +0200 (CEST)
Message-ID: <64451537-86e1-4c5f-bbbd-c9164d0c2dd3@collabora.com>
Date: Mon, 23 Jun 2025 11:57:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mmc: mtk-sd: use default PATCH_BIT register values
 for mt7620
To: Shiji Yang <yangshiji66@outlook.com>, linux-mmc@vger.kernel.org
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <OSBPR01MB16708176FE57F691359D0943BC7DA@OSBPR01MB1670.jpnprd01.prod.outlook.com>
 <OSBPR01MB1670CE92711CE9EF6601122EBC7DA@OSBPR01MB1670.jpnprd01.prod.outlook.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <OSBPR01MB1670CE92711CE9EF6601122EBC7DA@OSBPR01MB1670.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_025706_681331_60EBD911 
X-CRM114-Status: GOOD (  15.07  )
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

Il 19/06/25 07:35, Shiji Yang ha scritto:
> The register map definitions of these PATCH_BIT registers seem to be
> slightly different from other variants. Use their default values to
> respect the vendor SDK driver behaviors.
> 

Just read the values that do work from the registers on your board and on
the downstream kernel, after which, map the resulting value to the patch
bits that you can find here in this driver.

If there's any difference, add the relevant definitions.

Cheers,
Angelo

> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
> ---
>   drivers/mmc/host/mtk-sd.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 276d4e324..8933cd089 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1939,7 +1939,8 @@ static void msdc_init_hw(struct msdc_host *host)
>   	val |= FIELD_PREP(MSDC_CKGEN_MSDC_DLY_SEL, 1);
>   
>   	/* First MSDC_PATCH_BIT setup is done: pull the trigger! */
> -	writel(val, host->base + MSDC_PATCH_BIT);
> +	if (!host->dev_comp->mips_mt762x)
> +		writel(val, host->base + MSDC_PATCH_BIT);
>   
>   	/* Set wr data, crc status, cmd response turnaround period for UHS104 */
>   	pb1_val = FIELD_PREP(MSDC_PB1_WRDAT_CRC_TACNTR, 1);
> @@ -2002,8 +2003,10 @@ static void msdc_init_hw(struct msdc_host *host)
>   		pb2_val |= MSDC_PB2_SUPPORT_64G;
>   
>   	/* Patch Bit 1/2 setup is done: pull the trigger! */
> -	writel(pb1_val, host->base + MSDC_PATCH_BIT1);
> -	writel(pb2_val, host->base + MSDC_PATCH_BIT2);
> +	if (!host->dev_comp->mips_mt762x) {
> +		writel(pb1_val, host->base + MSDC_PATCH_BIT1);
> +		writel(pb2_val, host->base + MSDC_PATCH_BIT2);
> +	}
>   	sdr_set_bits(host->base + EMMC50_CFG0, EMMC50_CFG_CFCSTS_SEL);
>   
>   	if (host->dev_comp->data_tune) {



