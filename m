Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED58C71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 17:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WvvyqjF+a0/2/PxBVrWV5GFfIaKYznnmPBrtlcNM1us=; b=LFmCgs3zsvyuwSOWC+Y0YD4QVt
	jHeq9Oa5lMmAtvHAXzfh9l4A7pRbrQ/SLKYEtbe6YHsGifWICVu73B0XVUvZ19XilSysxn3KR8r74
	v5ph08bnWvXDA55d8rv9rMR05qKC8Ayb/h1+RAUW5VJzfyq+arIw4ulZ0BRSip0h0q2j7glTYC3qj
	YemcgQfsWkmuhdtPJAhRic6P+TOn/clQ7xFi8PNezVwUdo9Y3dfYYHQZx6oysB7dB/xsrXrAPqcUs
	u1RuGybPWlfPTA5RgoR8ZrG5XUa8e4YtcsuLWj6qEjb+rOOv0wPtV+rHFL/21SliEBd2Ywo5fy+JX
	2P2VPVoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDLt-000000055hS-1MLe;
	Mon, 16 Jun 2025 17:10:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBhN-00000004okT-3kTd
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Jun 2025 15:24:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WvvyqjF+a0/2/PxBVrWV5GFfIaKYznnmPBrtlcNM1us=; b=NaEVfohpKI6lwx6Nley0Ve1Fas
	oecP6hcjKpBkbUdCwN+5nSLtqerJv7KvaE2Ws3Xv8hBbxP6u3fUUPgq7/X/zqoRC1Ds2OrC9uplkF
	9JoGv2v+CjxhepdJoUkAqI8Zhd0slijwVqdseP2izpc3N3bNQ+l52eDR0+gz8K1DmI3gSRUdwHonX
	ly+gHgF5FBlhY2dPJ0rgeo8fdEe0GLpxRhKJ1MgGsARPmPoJOy0n8HUwvWiZ0Sr6SfUfWMOx5jXWC
	rRSE7SfbwZO3Priu91Fea71kgmKaDXzOluIiwUMVevqjAaDgx/ISptLYUU1L0q/u2KF1guWxe6ZCk
	C5pUbL+g==;
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBhK-00000003cZi-43af
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 15:24:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1750087439; bh=L36apx6YOkPsOESPZl+PN5JV6EhSIQk7MGDOTD2LIn0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AKLj9123NMxLszeoYR6I6PlazpsTSs7ZuytuhKzTYO9PmXqJ8qPY5w9foRHVqdyg9
	 rc/zvKVsGus8EPwITYAuMrq/3S08T7A2Ly27QJhEzOXyUYGfI8LrhMPdaVH2w+T1FN
	 fqvCybkYPZHEJvkP2nUNdQ9ktqDBoCmhZeyW7OjfEpC0QNpLYohTlvIF103EiGDirP
	 r6agla+tn0FhwKJPIl6BU2kuqkapWiVVCzGdJWguj+QOEvgYOeAreIqqnxiZmOyiRQ
	 lasGynJtjeDMMbENbqtKmdY8t/v84iwdtBXtH4AgpbWy9zUwkM4CeU3TWQuY72Ordw
	 wXpoURDNrRPqw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 76B103C2957;
	Mon, 16 Jun 2025 15:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1750087439; bh=L36apx6YOkPsOESPZl+PN5JV6EhSIQk7MGDOTD2LIn0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AKLj9123NMxLszeoYR6I6PlazpsTSs7ZuytuhKzTYO9PmXqJ8qPY5w9foRHVqdyg9
	 rc/zvKVsGus8EPwITYAuMrq/3S08T7A2Ly27QJhEzOXyUYGfI8LrhMPdaVH2w+T1FN
	 fqvCybkYPZHEJvkP2nUNdQ9ktqDBoCmhZeyW7OjfEpC0QNpLYohTlvIF103EiGDirP
	 r6agla+tn0FhwKJPIl6BU2kuqkapWiVVCzGdJWguj+QOEvgYOeAreIqqnxiZmOyiRQ
	 lasGynJtjeDMMbENbqtKmdY8t/v84iwdtBXtH4AgpbWy9zUwkM4CeU3TWQuY72Ordw
	 wXpoURDNrRPqw==
Message-ID: <3ed9f3bc-60f5-4c40-97b5-53d6af4d78c9@mleia.com>
Date: Mon, 16 Jun 2025 18:23:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] dmaengine: Add NULL check in lpc18xx_dmamux_reserve()
Content-Language: ru-RU
To: Charles Han <hanchunchao@inspur.com>, eugen.hristev@linaro.org,
 vkoul@kernel.org, manabian@gmail.com
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250616104420.1720-1-hanchunchao@inspur.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250616104420.1720-1-hanchunchao@inspur.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250616_152359_501906_5283B328 
X-CRM114-Status: GOOD (  21.31  )
/bin/ln: failed to access 'reaver_cache/texts/20250616_152359_501906_5283B328': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_152359_501906_5283B328 
X-CRM114-Status: GOOD (  22.34  )
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

On 6/16/25 13:44, Charles Han wrote:
> The function of_find_device_by_node() may return NULL if the device
> node is not found or CONFIG_OF not defined.

DMA_OF depends on OF, and the driver depends on OF as it's stated
in the drivers/dma/Kconfig, so this is not an issue.

Next, is it possible here to get of_find_device_by_node() returning
NULL? I don't think so, and then it's unclear which problem is supposed
to be fixed by this change, and therefore the change should be dropped.

> Add  check whether the return value is NULL and set the error code
> to be returned as -ENODEV.
> 
> Fixes: e5f4ae84be74 ("dmaengine: add driver for lpc18xx dmamux")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>   drivers/dma/lpc18xx-dmamux.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/lpc18xx-dmamux.c b/drivers/dma/lpc18xx-dmamux.c
> index 2b6436f4b193..f61183a1d0ba 100644
> --- a/drivers/dma/lpc18xx-dmamux.c
> +++ b/drivers/dma/lpc18xx-dmamux.c
> @@ -53,11 +53,17 @@ static void lpc18xx_dmamux_free(struct device *dev, void *route_data)
>   static void *lpc18xx_dmamux_reserve(struct of_phandle_args *dma_spec,
>   				    struct of_dma *ofdma)
>   {
> -	struct platform_device *pdev = of_find_device_by_node(ofdma->of_node);
> -	struct lpc18xx_dmamux_data *dmamux = platform_get_drvdata(pdev);
> +	struct platform_device *pdev;
> +	struct lpc18xx_dmamux_data *dmamux;

The list of declared/initialized local variables is deliberately sorted
in so called reverse Christmas tree order, please keep the sorting order.

>   	unsigned long flags;
>   	unsigned mux;
>   
> +	pdev = of_find_device_by_node(ofdma->of_node);
> +	if (!pdev)
> +		return ERR_PTR(-ENODEV);
> +
> +	dmamux = platform_get_drvdata(pdev);
> +
>   	if (dma_spec->args_count != 3) {
>   		dev_err(&pdev->dev, "invalid number of dma mux args\n");
>   		return ERR_PTR(-EINVAL);

--
Best wishes,
Vladimir

