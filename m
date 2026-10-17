Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00A9CCF2C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 17:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSDpwvN0yoSV1vrqdzCv4HHzV9QnxibI1Q5Gk8f/Jl8=; b=HyprVPezeotZQ4UlskrS+dAzKR
	MS6BVwQAtr3IU2MUGhnbXF42JIP+tRji5uHN/7JBHPQaoj9GxfKBVNXgWxozf2RUAR87kBWeoPk/Q
	nQTxPJyBzR557+SbxEdPc8Z7bZCLbOwL4LnoM+QRICAPCMtuL35I8q+TV6AbgCl70PcZjyN1OvLQb
	om6R2QhcWkYlyXORl0fxDu9bb+cE+UQ3yQyyCGcJBlNB4qm7rknT4Arl1o0UeeeqNGgicTwM71uU6
	nLvlTkcIRrwN7Kpghl64xnrnJD0AItCllb30BBluBFQ5+YenvzcsCUid6EjqxrdCLgCvBGz2UT/5G
	QhfesQBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI893-00000004zb5-2cOz;
	Sat, 17 Oct 2026 17:24:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI893-00000004zas-0AQq;
	Sat, 17 Oct 2026 17:24:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C6B2842DB0;
	Sat, 17 Oct 2026 17:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 003A71F000C4;
	Sat, 17 Oct 2026 17:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792257872;
	bh=sSDpwvN0yoSV1vrqdzCv4HHzV9QnxibI1Q5Gk8f/Jl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ORf3IN3ieNKp3nEkixkDrUvQWzbomLdlA+SRHSLCDzLpC4Rtb1fcX3rH05tjOQrea
	 V5MuOw96wMT3IuIfmeNXHE4HiSAWtXzadA5sMzr6ZTBlsFrphODQuB5NUJyb+Vf6sO
	 sBoi3OLggVRyEqXPI5HfD3nJJ1dgs8ZL4DmS4RTamSqnh925mREQWlrW2RxflvFRA3
	 Ihq674RpOyfvXBN+UOIptJ5btQplfQ2vNX2gd5+DE9VI9SiAPIw7kPKcKBSB2tbi8s
	 nTjTpCOIzWE8MErPWpgUMl2s2Gof3Xoys2+9mOAQ1dm4EoEf9ZA7EHkONvZoFOkZD+
	 2idtfG4elTVHg==
Date: Sat, 17 Oct 2026 19:24:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jason Yang <jason98166@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Guochun Huang <hero.huang@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Michael Riesch <michael.riesch@collabora.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/8] phy: rockchip-samsung-dcphy: Add a second PHY for
 the receiver
Message-ID: <20261017-merry-crystal-crow-d2a4c9@quoll>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-5-e63b49eabe2d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016-dcphy-rx-v1-v5-5-e63b49eabe2d@gmail.com>
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

On Fri, Oct 16, 2026 at 04:56:39PM +0800, Jason Yang wrote:
  static const struct phy_ops samsung_mipi_dcphy_tx_ops = {
>  	.configure = samsung_mipi_dcphy_tx_configure,
>  	.power_on  = samsung_mipi_dcphy_tx_power_on,
> @@ -1520,6 +1538,15 @@ static const struct phy_ops samsung_mipi_dcphy_tx_ops = {
>  	.owner	   = THIS_MODULE,
>  };
>  
> +static const struct phy_ops samsung_mipi_dcphy_rx_ops = {
> +	.configure = samsung_mipi_dcphy_rx_configure,
> +	.power_on  = samsung_mipi_dcphy_rx_power_on,
> +	.power_off = samsung_mipi_dcphy_rx_power_off,
> +	.init = samsung_mipi_dcphy_init,
> +	.exit = samsung_mipi_dcphy_exit,
> +	.owner	   = THIS_MODULE,
> +};
> +
>  static const struct regmap_config samsung_mipi_dcphy_regmap_config = {
>  	.name = "dcphy",
>  	.reg_bits = 32,
> @@ -1532,19 +1559,42 @@ static struct phy *samsung_mipi_dcphy_xlate(struct device *dev,
>  					    const struct of_phandle_args *args)
>  {
>  	struct samsung_mipi_dcphy *samsung = dev_get_drvdata(dev);
> +	/* Device trees without the second cell describe the transmitter. */
> +	u32 direction = PHY_DIRECTION_TX;
> +	u32 type;
>  
> -	if (args->args_count != 1) {

So this is the part which prevents change in the ABI (see Rob's comment).

Why was the driver coded that way?

> +	if (args->args_count < 1 || args->args_count > 2) {

And you repeat the pattern, so if third argument is added, DTS does not
work with existing kernel.

Why?

Best regards,
Krzysztof


