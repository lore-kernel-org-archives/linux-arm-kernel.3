Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B354FEEF47
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 13:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whNRTuKkEMpwTe6Iz7VPrxDCJNblXLKKtLR2ojQ2mcs=; b=r1GKY22sxObqVaxfy3jq92pCP/
	+B2rP9YFdnRPDVLYOvsMsCH+Od+1b4BgRZuuBND1rtaINO20QhgA1ygqj6Fdep/eKDpn+uGbrsN8G
	aIflqXFoGsBuIrPZPaR7AQejIAU7vtw7WLDoSzOCVZUCuS7hf5QeLuj92fPij1CP0Ov3WelHo73eI
	6fYeKavLrDj37J0C/JSby7ADLy0zR6yh7g+gCRlkccAOmmKV/fFp48W5r6bdLMEnEkNduKdwm3PLH
	9A/52nsB4ik1s/JynWOwH48Us8AcuFCBlJc4jKODx/MN+R4ML+APMqfTH7XmOlflx4NLgUkXeF/sJ
	bhFZ1QEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6kv-00000006XOU-1kPv;
	Tue, 07 Apr 2026 13:46:13 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6kt-00000006XOD-15z1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 13:46:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1775569567; bh=6GRFt8L4mbLAx7fvx09zE9b6UjgeSYAlR8JyuWvN858=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WiB9wYMOfCCsVvTYgFlvB0MHL/KB09+t7CS4MYPR84J+EEm3ZLn1m2H7zgc7wuJ2r
	 /OeIWbfnZtCfF+bYxzuYQvdYj1RfGuZU58Z6nZhTbCWp5pwB9d7NERzwvr1U0qAtl6
	 2Ofpq2zUjMyc70bOFROhhzyCJp90PlPCkwxSRLTHCLHTBxzXqgLMBi8TMk7et/ngDW
	 0ZTSQ5sP4RgRKRQwyE8ONBmwbCe6x6S1EIwtsXvRkE/5KCfw8dicShg6HXmf5XXhVq
	 D+XF0PWr0AEmj8H/lRzY27kvII1Btw8AjXom+OWL9ZT/BRAbTADu5DaaRjPL8wLdbA
	 46/KVgZLeKxug==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 3BF5E3827F0;
	Tue,  7 Apr 2026 13:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1775569567; bh=6GRFt8L4mbLAx7fvx09zE9b6UjgeSYAlR8JyuWvN858=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WiB9wYMOfCCsVvTYgFlvB0MHL/KB09+t7CS4MYPR84J+EEm3ZLn1m2H7zgc7wuJ2r
	 /OeIWbfnZtCfF+bYxzuYQvdYj1RfGuZU58Z6nZhTbCWp5pwB9d7NERzwvr1U0qAtl6
	 2Ofpq2zUjMyc70bOFROhhzyCJp90PlPCkwxSRLTHCLHTBxzXqgLMBi8TMk7et/ngDW
	 0ZTSQ5sP4RgRKRQwyE8ONBmwbCe6x6S1EIwtsXvRkE/5KCfw8dicShg6HXmf5XXhVq
	 D+XF0PWr0AEmj8H/lRzY27kvII1Btw8AjXom+OWL9ZT/BRAbTADu5DaaRjPL8wLdbA
	 46/KVgZLeKxug==
Message-ID: <a8918d4f-282d-4b14-905b-b637d2708e24@mleia.com>
Date: Tue, 7 Apr 2026 16:46:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: lpc18xx-dmamux: simplify allocation
To: Rosen Penev <rosenp@gmail.com>, dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "moderated list:ARM/LPC18XX ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260407035132.99037-1-rosenp@gmail.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20260407035132.99037-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260407_134607_263802_D44D80CC 
X-CRM114-Status: GOOD (  17.33  )
/bin/ln: failed to access 'reaver_cache/texts/20260407_134607_263802_D44D80CC': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_134607_263802_D44D80CC 
X-CRM114-Status: GOOD (  17.10  )
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

On 4/7/26 06:51, Rosen Penev wrote:
> Use a flexible array member to combine allocations. Requires
> preparation, aka reshuffling before the actual allocation to get the
> proper size.
> 
> Add __counted_by for extra runtime analysis.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   drivers/dma/lpc18xx-dmamux.c | 42 +++++++++++++++++-------------------
>   1 file changed, 20 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/dma/lpc18xx-dmamux.c b/drivers/dma/lpc18xx-dmamux.c
> index d3ff521951b8..5dfefbc496da 100644
> --- a/drivers/dma/lpc18xx-dmamux.c
> +++ b/drivers/dma/lpc18xx-dmamux.c
> @@ -32,11 +32,11 @@ struct lpc18xx_dmamux {
>   
>   struct lpc18xx_dmamux_data {
>   	struct dma_router dmarouter;
> -	struct lpc18xx_dmamux *muxes;
>   	u32 dma_master_requests;
>   	u32 dma_mux_requests;
>   	struct regmap *reg;
>   	spinlock_t lock;
> +	struct lpc18xx_dmamux muxes[] __counted_by(dma_master_requests);
>   };
>   
>   static void lpc18xx_dmamux_free(struct device *dev, void *route_data)
> @@ -122,12 +122,30 @@ static int lpc18xx_dmamux_probe(struct platform_device *pdev)
>   {
>   	struct device_node *dma_np, *np = pdev->dev.of_node;
>   	struct lpc18xx_dmamux_data *dmamux;
> +	u32 dma_master_requests;
>   	int ret;
>   
> -	dmamux = devm_kzalloc(&pdev->dev, sizeof(*dmamux), GFP_KERNEL);
> +	dma_np = of_parse_phandle(np, "dma-masters", 0);
> +	if (!dma_np) {
> +		dev_err(&pdev->dev, "can't get dma master\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = of_property_read_u32(dma_np, "dma-requests",
> +				   &dma_master_requests);
> +	of_node_put(dma_np);
> +	if (ret) {
> +		dev_err(&pdev->dev, "missing master dma-requests property\n");
> +		return ret;
> +	}
> +
> +	dmamux = devm_kzalloc(&pdev->dev, struct_size(dmamux, muxes, dma_master_requests),
> +			GFP_KERNEL);
>   	if (!dmamux)
>   		return -ENOMEM;
>   
> +	dmamux->dma_master_requests = dma_master_requests;
> +
>   	dmamux->reg = syscon_regmap_lookup_by_compatible("nxp,lpc1850-creg");
>   	if (IS_ERR(dmamux->reg)) {
>   		dev_err(&pdev->dev, "syscon lookup failed\n");
> @@ -141,26 +159,6 @@ static int lpc18xx_dmamux_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> -	dma_np = of_parse_phandle(np, "dma-masters", 0);
> -	if (!dma_np) {
> -		dev_err(&pdev->dev, "can't get dma master\n");
> -		return -ENODEV;
> -	}
> -
> -	ret = of_property_read_u32(dma_np, "dma-requests",
> -				   &dmamux->dma_master_requests);
> -	of_node_put(dma_np);
> -	if (ret) {
> -		dev_err(&pdev->dev, "missing master dma-requests property\n");
> -		return ret;
> -	}
> -
> -	dmamux->muxes = devm_kcalloc(&pdev->dev, dmamux->dma_master_requests,
> -				     sizeof(struct lpc18xx_dmamux),
> -				     GFP_KERNEL);
> -	if (!dmamux->muxes)
> -		return -ENOMEM;
> -
>   	spin_lock_init(&dmamux->lock);
>   	platform_set_drvdata(pdev, dmamux);
>   	dmamux->dmarouter.dev = &pdev->dev;

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir

