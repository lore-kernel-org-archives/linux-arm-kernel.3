Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D091C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 08:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nkrn1gkI6oGI3zDKq3zJTXpkyPNHBfJXH5PfFJqL0A4=; b=sCCez0g67aX93xOyMzsIc+Booe
	kteFbNNxgFwecSqGUh7/ZNo7id78qJad18f2evr6/tqcD8JKfggeqSh8JLEPHGAg3b0GXL/r+Xkt8
	+51MXFODXYQpnTvMsPXi3T0VYx9x3tgA2NKkJce07dBLcgIsSmE1PTZoea28RsDUYwy+YXnV35UJs
	bTaSTuQqwctSLt+fwVrPkncYSZuXLhoa1V/VMSwegleLKCBw5QXpZWAbCiy4gkb84lHIY3sHfDx6v
	f5MDugyJ+/LUtM7+2NK2ULRYTm/+6M8C8LQ6PB082X390/Oy7x7pEvorbxRQQA9YnIOBfny4YC7Om
	owdaODaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9HG-00000007Cwn-1h79;
	Tue, 21 Jan 2025 08:06:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9AR-00000007C4I-3GCI;
	Tue, 21 Jan 2025 07:59:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 67A9FA40EB1;
	Tue, 21 Jan 2025 07:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0EDC4CEDF;
	Tue, 21 Jan 2025 07:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737446362;
	bh=1sW03D4JYjdR1oZ97WjKdWnJzzKwgUK7haavl1Dli8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uVo4NKhIrBKzg3cz0dISq6baOKDz6NV+zfrADVUA6dm7iRN+Kg72RITkx7MqXSLBx
	 +6fVMi8wRWU/ehdEjaKqMw6l3rzYouqA/YhL8yiRr9jqo3/RKpJo0NJdjPZUXAvGT5
	 mdxrwpYNPQ99YAlqd3h1JrzNWhx52Q1wcnmXoTvGL9PS9Kvke/REvje6aSoRIt60Zj
	 XKnH7V01rgbsdbMlk9r18ijQtA70a1HQUippzJluj35bzIXspZfNMwJLEmnqU+QHIc
	 5iscnX3VAEaQbj4fDZ3hXoCdY2yd7xTtlPbaKc96XIe/zmtUMp7fIZ37CxT1Urtaw4
	 KsenzX6hGoWuQ==
Date: Tue, 21 Jan 2025 08:59:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH v2 2/2] mmc: mtk-sd: add support for AN7581 MMC Host
Message-ID: <20250121-zippy-umber-fossa-abbfb0@krzk-bin>
References: <20250120184728.18325-1-ansuelsmth@gmail.com>
 <20250120184728.18325-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250120184728.18325-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_235923_877008_43CB4620 
X-CRM114-Status: GOOD (  12.63  )
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

On Mon, Jan 20, 2025 at 07:47:02PM +0100, Christian Marangi wrote:
> -			pinctrl_select_state(host->pinctrl, host->pins_uhs);
> +			/* Skip setting uhs pins if not supported */
> +			if (host->pins_uhs)
> +				pinctrl_select_state(host->pinctrl, host->pins_uhs);
>  		} else {
>  			dev_pm_clear_wake_irq(host->dev);
>  		}
> @@ -2816,9 +2835,12 @@ static int msdc_of_clock_parse(struct platform_device *pdev,
>  	if (IS_ERR(host->src_clk))
>  		return PTR_ERR(host->src_clk);
>  
> -	host->h_clk = devm_clk_get(&pdev->dev, "hclk");
> -	if (IS_ERR(host->h_clk))
> -		return PTR_ERR(host->h_clk);
> +	/* AN7581 SoC doesn't have hclk */
> +	if (!device_is_compatible(&pdev->dev, "airoha,an7581-mmc")) {

Please avoid coding compatible in multiple places. Not only because
above check is slow comparing to check on integer, but it just scales
poorly and leads to less readable further code. Use driver data with
model name or flags/quirks bitmask.

Best regards,
Krzysztof


