Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A75C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 12:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wz4mCSitBFP+RnOKOqgz5gk2SFQSHQ3nrjDSKRkJtBI=; b=a2HUmIV9V8BIvkDP75Avq+FRn5
	ENUj0RZ/5+cxNLubOZUc9khBY3FRLR+FMkb0xPcyJED2/BtnWQVhveOFs4JM86ttcGM/EWdzTfelC
	PrVaE8MTew//TYbs0hMMol8W7f4Xr5wBzZ6YyVmhL1Q5XwJP+0/l+3syiC5SW+p9OIvXfaJC7dOmX
	rOGPNjJr1ShPdVFDem4RVtYDeVL0F6pls8gjIeyNLczUPpvJCoXD5mjO9YFW2AwFUtkpTKMiUMZeA
	k75chW2/R38nDy6ys6QcaSpY3KUnbYTBMlMkPGZUdlDttHmFyguuzlkqElo0vZy65R6AWiPhj1CIv
	IaOZCb7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnQF-00000006jRG-3nkE;
	Mon, 20 Jul 2026 12:48:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnQD-00000006jPv-3lkH;
	Mon, 20 Jul 2026 12:48:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784551714;
	bh=2hDfOrYJlktV5w2l5biEDgpe6XsMNDJBGUXjbbiQxFM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ESIDM0rvHDDcwAxDcCbpsXoPCq0+/q0wjWcJXYsQ4KL443DgtNGZNEWxL6h7AOFtt
	 7cmaNaaImDhIvTuZTalqlUE1zebrSYgZVw8exdYkiEIOz2p243HzVQb/7j/4EBAtAR
	 wpdBNJRPDPlcg1U4HGsGGiaB7fVYH+60xmsO4Ih6+JVUNRi5NVlVYsz0CTGkZ8hmO+
	 zTXDLoEmpLHViO5KZPkdflzESneuJrQ2wIuT0vMB5mmE7QbFKyxX382woxYygYZhvn
	 zJxO0INrk+R5zzfY8qoBlfjs3UAUbrvg3TylnNorvqoLixjG/pDrXj4kCS5bXtSrkq
	 x+a5xE3Y/RNPA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3BD2617E0D53;
	Mon, 20 Jul 2026 14:48:34 +0200 (CEST)
Message-ID: <2aa16ed7-5d36-4e78-929e-84b9d6befe77@collabora.com>
Date: Mon, 20 Jul 2026 14:48:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] nvmem: mtk-efuse: add mt6572 support
To: rva333@protonmail.com, Srinivas Kandagatla <srini@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com>
 <20260715-6572-nvmem-v1-3-9c13be99d077@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260715-6572-nvmem-v1-3-9c13be99d077@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_054838_098712_4F8228CD 
X-CRM114-Status: GOOD (  16.28  )
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

On 7/15/26 16:27, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add a platform data struct for the efuse controller.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>   drivers/nvmem/mtk-efuse.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> index 1462f2760818..a79434608465 100644
> --- a/drivers/nvmem/mtk-efuse.c
> +++ b/drivers/nvmem/mtk-efuse.c
> @@ -124,6 +124,11 @@ static int mtk_efuse_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static const struct mtk_efuse_pdata mtk_mt6572_efuse_pdata = {
> +	.uses_post_processing = false,

Are you sure this SoC (or any other compatible with it) doesn't have any GPU speed
binning?

If you're really sure

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +	.needs_aligned_read = true,
> +};
> +
>   static const struct mtk_efuse_pdata mtk_mt8186_efuse_pdata = {
>   	.uses_post_processing = true,
>   	.needs_aligned_read = false,
> @@ -135,6 +140,7 @@ static const struct mtk_efuse_pdata mtk_efuse_pdata = {
>   };
>   
>   static const struct of_device_id mtk_efuse_of_match[] = {
> +	{ .compatible = "mediatek,mt6572-efuse", .data = &mtk_mt6572_efuse_pdata },
>   	{ .compatible = "mediatek,mt8173-efuse", .data = &mtk_efuse_pdata },
>   	{ .compatible = "mediatek,mt8186-efuse", .data = &mtk_mt8186_efuse_pdata },
>   	{ .compatible = "mediatek,efuse", .data = &mtk_efuse_pdata },
> 

