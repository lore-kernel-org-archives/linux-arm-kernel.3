Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E5CC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 11:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PiVPoZqxXQzLSRnTyxJY0LUsG2EsVds3etvNlaImVXs=; b=ZHxMmNTGCZV1qSYYv2iN7gCz3U
	PNpG3PlOqkJEu4pBvs6pACVy11rfL74dheXy9O/tFV4+hBBciqZS7UIgAUIFZExQZfKyO/ihauFuk
	ilsypWcqHlJC9S8pkfarg9ZBtJV03cpUFpT1ycFp1K0Zsu0Kup6zyNwOQ5eXGMbxGcSHvyit+BBAL
	3yu7O/E+RE+RKCOVqenkmdkI6X4LQRDhMhcJxFMjQVbngVoltD/NYze00Dx1csVkNggM+klv3x4Rx
	ibPAN7oVE3Gfoxxv3GHFm9KEHhGAmL+7aH3xWiWa/QEnX3kylOh8lWaFEGrZhQsghmkQiNmqKpbs7
	IPMbq4AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cVX-0000000E7zA-1qNL;
	Thu, 10 Sep 2026 10:59:55 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cVU-0000000E7yP-1gd5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 10:59:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C94B14E415BD;
	Thu, 10 Sep 2026 10:59:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8764F602B8;
	Thu, 10 Sep 2026 10:59:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C298211C78279;
	Thu, 10 Sep 2026 12:59:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789037987; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=PiVPoZqxXQzLSRnTyxJY0LUsG2EsVds3etvNlaImVXs=;
	b=MyKQSv9qy+ede1HK7HqbuXAUK7XqNhdafo5puwBvBNW5aeh0/tXviCEzLnnfor378UQg5p
	m4mN7KciSm6fhsKKUzhpiUcwf3efVd8QrepBSI+Kjyc6gj7yyzge1Yq5ghMACgVZ49GVjQ
	3QIjLBajCgtFqs4oHzyZkcx1X5HNhQdUho0sRSXTfFYWlARolRHSYAy6Hwh4qxgQAOyxLG
	A/Nh1wXO4WaXuIqnYXIoK+EBu4aAWRsLBYQ9HP+stBv970OTB/N2/jE2MZHuY/7LVEKZOM
	vzekn7UQdE/lQi/BQ2Pk2LLO4Ms1RCTsjouURhrT5P0dFgc/ta+2ICbS/giMHQ==
Message-ID: <44d7840d-0cde-4022-937c-4c630398c45d@bootlin.com>
Date: Thu, 10 Sep 2026 12:59:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: Add support for Allwinner
 A733 GMAC210
To: Jerome Brunet <jbrunet@baylibre.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andre Przywara <andre.przywara@arm.com>
References: <20260910-allwinner-a733-gmac-support-v2-0-4f4a1e520c23@baylibre.com>
 <20260910-allwinner-a733-gmac-support-v2-2-4f4a1e520c23@baylibre.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260910-allwinner-a733-gmac-support-v2-2-4f4a1e520c23@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_035952_580972_A277E5D2 
X-CRM114-Status: GOOD (  23.53  )
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

Hi Jerome,

On 9/10/26 12:25, Jerome Brunet wrote:
> The A733 GMAC210 is a DesignWare MAC 5.20 using an Allwinner glue close to
> the A523 GMAC200 already supported by this driver, with the following
> differences to handle:
> 
> * The glue configuration registers are a dedicated MMIO region of the
>   controller instead of a syscon register. This new register region
>   appears to be in the reset domain of stmmac's main reset. This requires
>   the glue driver to handle the reset rather than letting stmmac deal with
>   it.
> * The TX clock delay value is 5 bits wide, split over 2 register fields,
>   allowing delays up to 3100ps.
> * The DMA channels have their own interrupt lines, so the per-DMA-channel
>   interrupt mode is enabled, as the vendor SDK does.
> * TX LPI clock gating is supported, as the vendor SDK indicates. Follow
>   the PHY capability with STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP rather than
>   forcing it on with the deprecated 'snps,en-tx-lpi-clockgating' DT
>   property.
> 
> Unlike the A523, both GMAC instances are supported by the same driver.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

[...]

> +
> +static struct regmap *sun60i_gmac210_get_regmap(struct platform_device *pdev,
> +						struct plat_stmmacenet_data *plat)
> +{
> +	struct device *dev = &pdev->dev;
> +	void __iomem *base;
> +	int ret;
> +
> +	base = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(base)) {
> +		dev_err_probe(dev, PTR_ERR(base), "unable to get glue memory region\n");
> +		return ERR_CAST(base);
> +	}
> +
> +	if (!plat->stmmac_rst || !plat->stmmac_ahb_rst) {

Why check stmmac_ahb_rst, but not do anything with it ?

> +		dev_err(dev, "missing required reset controls\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	/*
> +	 * The configuration registers are inside the controller
> +	 * reset domain, so the reset must happen before any write to them
> +	 * and should not be done again by stmmac or the configuration will
> +	 * be lost.
> +	 */
> +	ret = reset_control_assert(plat->stmmac_rst);
> +	if (!ret)
> +		ret = reset_control_deassert(plat->stmmac_rst);
> +
> +	if (ret) {
> +		dev_err_probe(dev, ret, "device reset failed\n");
> +		return ERR_PTR(ret);
> +	}
> +
> +	ret = devm_add_action_or_reset(dev, sun60i_gmac210_reset_assert,
> +				       plat->stmmac_rst);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	plat->stmmac_rst = NULL;
> +
> +	return devm_regmap_init_mmio(&pdev->dev, base, &sun60i_a733_regmap_cfg);

I wonder if this is the first glue to face this...

If you need further setup to be done after reset has been deasserted, I suggest
adding a dedicated callback in plat_stmmacenet_data, instead of doing this behind
the generic code's back.

maybe something like "post_reset_init()", something like that ?

the ->mac_setup already runs after reset, but isn't really for this type of usecase.

For readability of the patch, maybe you should split this patch to first do the
a523 rework, then add a733 support.

Thanks !

Maxime

