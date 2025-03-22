Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8E6C36008
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 21:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1jP1iD/XB5t52+KeZ1FsE4W0vWyW8Ips9m8Lf+NGpwE=; b=YoOwslEH7dCOwj7Mv+A/jxo2eN
	43sLZGHXDYKTUQpNEc2lekpzFGFcSNPV68lyS2qnc3NPrRj2ilqQOkk1QxFWdfgD3j23yXl5h+UXw
	6iz8zIS7WaZblNClW0S3pVZmpgYzS2m1vaFo92P4tL3jlYtvsYrWO9iHMcaqvDj2d78wxJ9U6lUbi
	xSDSb0BHD7RIW4zICfZIy1L3UbTAzpLj+FNOZISVNmMCYKm6cye+v81sCYb/D10aGVHW+aGvk4XRg
	WzrNgCM3QJnoAhYNNJBB6AGFftmq8+uyG1a+Ftbu3BTxSDAfd/Pr9eoN1lQYS9uS871diuG5uu4hQ
	4I1Vyqag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tw6ZJ-00000000M8q-3scK;
	Sat, 22 Mar 2025 21:39:49 +0000
Received: from smtp-28.smtpout.orange.fr ([80.12.242.28] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tw6Xd-00000000M3Q-34nG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Mar 2025 21:38:07 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id w6XTtGGb67I4cw6XWtwDSM; Sat, 22 Mar 2025 22:38:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1742679482;
	bh=1jP1iD/XB5t52+KeZ1FsE4W0vWyW8Ips9m8Lf+NGpwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=jmU14P3aY7umyeNggwmyo3m3SSEPB7x7iI9RakbnjWSc7xkOvb1vVF4ih0Mw0PHwJ
	 jCRI/cSo9UCOV8YFL4MGU01vkq2IA63Vo7PXpMRBlJq3uPNc94NJfhYu9vtSvQeVDS
	 3bz0TDBvtHn+2m3Di7r/BMKo2lI30qENa+N/v2ST4GUUJ5GVjQ1X0KA2NKiDXdOcfN
	 A2Q+AjZNvVfPqheMeUWb/Q7z2wQIdUVDPX2us8iLwNRjVfn8Y2SRPExz2Oh1+SfX03
	 UqufGvWPz4SHYI1PCpPXfAgEPMOHGpf3TN19VQTsNmw8p2C+FqDX1DxbQCnu2ILpmd
	 y4YU0IykOxLTw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 22 Mar 2025 22:38:02 +0100
X-ME-IP: 90.11.132.44
Message-ID: <071b4cf6-df18-4232-b2ae-6b8bee48899d@wanadoo.fr>
Date: Sat, 22 Mar 2025 22:37:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] dma-engine: sun4i: Use devm functions in probe()
To: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <csokas.bence@prolan.hu>,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Markus Elfring <Markus.Elfring@web.de>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Vinod Koul <vkoul@kernel.org>, Samuel Holland <samuel@sholland.org>
References: <20250322193640.246382-2-csokas.bence@prolan.hu>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250322193640.246382-2-csokas.bence@prolan.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_143806_326458_576B94C0 
X-CRM114-Status: GOOD (  20.51  )
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

Le 22/03/2025 à 20:36, Bence Csókás a écrit :
> Clean up error handling by using devm functions and dev_err_probe(). This
> should make it easier to add new code, as we can eliminate the "goto
> ladder" in probe().
> 
> Suggested-by: Chen-Yu Tsai <wens@kernel.org>
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Acked-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
> ---
> 
> Notes:
>      Changes in v2:
>      * rebase on current next
>      Changes in v3:
>      * rebase on current next
>      * collect Jernej's tag
>      Changes in v4:
>      * rebase on current next
>      * collect Chen-Yu's tag
>      Changes in v5:
>      * reformat msg to 75 cols
>      * keep `\n`s in error messages
> 
>   drivers/dma/sun4i-dma.c | 31 ++++++-------------------------
>   1 file changed, 6 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
> index 24796aaaddfa..59ecebfc8eed 100644
> --- a/drivers/dma/sun4i-dma.c
> +++ b/drivers/dma/sun4i-dma.c
> @@ -1249,10 +1249,9 @@ static int sun4i_dma_probe(struct platform_device *pdev)
>   	if (priv->irq < 0)
>   		return priv->irq;
>   
> -	priv->clk = devm_clk_get(&pdev->dev, NULL);
> +	priv->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>   	if (IS_ERR(priv->clk)) {
> -		dev_err(&pdev->dev, "No clock specified\n");
> -		return PTR_ERR(priv->clk);
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk), "Couldn't start the clock\n");

I think that it would be better to keep the message on another line, to 
avoid too long lines.

>   	}

In several places, now {} around a single statement looks unneeded.

CJ

>   
>   	if (priv->cfg->has_reset) {
> @@ -1328,12 +1327,6 @@ static int sun4i_dma_probe(struct platform_device *pdev)
>   		vchan_init(&vchan->vc, &priv->slave);
>   	}
>   
> -	ret = clk_prepare_enable(priv->clk);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Couldn't enable the clock\n");
> -		return ret;
> -	}
> -
>   	/*
>   	 * Make sure the IRQs are all disabled and accounted for. The bootloader
>   	 * likes to leave these dirty
> @@ -1344,32 +1337,23 @@ static int sun4i_dma_probe(struct platform_device *pdev)
>   	ret = devm_request_irq(&pdev->dev, priv->irq, sun4i_dma_interrupt,
>   			       0, dev_name(&pdev->dev), priv);
>   	if (ret) {
> -		dev_err(&pdev->dev, "Cannot request IRQ\n");
> -		goto err_clk_disable;
> +		return dev_err_probe(&pdev->dev, ret, "Cannot request IRQ\n");
>   	}
>   
> -	ret = dma_async_device_register(&priv->slave);
> +	ret = dmaenginem_async_device_register(&priv->slave);
>   	if (ret) {
> -		dev_warn(&pdev->dev, "Failed to register DMA engine device\n");
> -		goto err_clk_disable;
> +		return dev_err_probe(&pdev->dev, ret, "Failed to register DMA engine device\n");
>   	}
>   
>   	ret = of_dma_controller_register(pdev->dev.of_node, sun4i_dma_of_xlate,
>   					 priv);
>   	if (ret) {
> -		dev_err(&pdev->dev, "of_dma_controller_register failed\n");
> -		goto err_dma_unregister;
> +		return dev_err_probe(&pdev->dev, ret, "Failed to register translation function\n");
>   	}
>   
>   	dev_dbg(&pdev->dev, "Successfully probed SUN4I_DMA\n");
>   
>   	return 0;
> -
> -err_dma_unregister:
> -	dma_async_device_unregister(&priv->slave);
> -err_clk_disable:
> -	clk_disable_unprepare(priv->clk);
> -	return ret;
>   }
>   
>   static void sun4i_dma_remove(struct platform_device *pdev)
> @@ -1380,9 +1364,6 @@ static void sun4i_dma_remove(struct platform_device *pdev)
>   	disable_irq(priv->irq);
>   
>   	of_dma_controller_free(pdev->dev.of_node);
> -	dma_async_device_unregister(&priv->slave);
> -
> -	clk_disable_unprepare(priv->clk);
>   }
>   
>   static struct sun4i_dma_config sun4i_a10_dma_cfg = {


