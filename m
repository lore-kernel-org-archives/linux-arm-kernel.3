Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B42C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 08:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xwi/bkIqLnnpNJQyXSVHrPIqCZU19aAPHszWTzl+j84=; b=xeAnH870OxBjc0Pfx2ivqGaJkJ
	p0y9vFTM1+V3nW/qaBo4CRsQ+3wyEX/arJ7+WSPC6jN1ihT2p8PQMDg0lqxbZWdU+SFg+x6utDOvN
	plEuEyW0e+QVzATSYi8xRFXkxKDC7iFfCTV1foyTT0bBEusaLF/5o6+pXNECmdFvr0+fUGceJdBoW
	J9CG+FZxK5uhauco2HhsXplMRJ2EPBypW6/ScXsSSVlDJRtu9nKfZjm1q0F1vhFmeMi1t0kS1NVic
	m546oScY6fWhKo/3nQe4W0GKFqHKwCln1N7/kor9qbUdG6HVDGqbf+aCeiA17TqidKVQHlG1vWVce
	O2Y7Hm3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulO20-00000006s3B-0rwm;
	Mon, 11 Aug 2025 08:37:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNYO-00000006nuz-0q0D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 08:06:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D82CC41843;
	Mon, 11 Aug 2025 08:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D93C4CEED;
	Mon, 11 Aug 2025 08:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754899607;
	bh=99p1/Hcm7cvOf1qSQuU5BHYtUKVroVdIfTnJnDN3UHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J30ojhirgavjQuzhrbARZltg/1SE47SpS5zglLWvF2LyypjKcs2xk+skPrZugOM9e
	 Udkd3g/+P/CXqnMReqwmWBfOLfEXm+3dzzx4IHfDxdb5A5a4BVdj76L9BfsILqxl8A
	 L0U3mnMYXK18zrDinNrjqelxWo4lN/kztgdA7t+maFyccP69JobA9q17SCFn3mBAI+
	 O2qWU+b205esXb+X/A2fr/tEh3N9RD1UHyXYRrYxLPhWulD4HMdSrGHIEEtUfEdHJ7
	 htBtFM6/b08TQWbQuWTzSc+pyG/WjLPMEL5mFKWn4ISFSaA8OVsEXiOUaAydHNPwo6
	 o+S9W3ofzoCQw==
Date: Mon, 11 Aug 2025 10:06:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Will Whang <will@willwhang.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/4] media: i2c: imx585: Add Sony IMX585 image-sensor
 driver
Message-ID: <20250811-cinnamon-tapir-of-music-0bda96@kuoka>
References: <20250810220921.14307-1-will@willwhang.com>
 <20250810220921.14307-4-will@willwhang.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250810220921.14307-4-will@willwhang.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_010648_257620_4BC3AB3E 
X-CRM114-Status: GOOD (  13.25  )
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

On Sun, Aug 10, 2025 at 11:09:20PM +0100, Will Whang wrote:
> +
> +/* --------------------------------------------------------------------------
> + * Power / runtime PM
> + * --------------------------------------------------------------------------
> + */
> +
> +static int imx585_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct imx585 *imx585 = to_imx585(sd);
> +	int ret;
> +
> +	dev_dbg(imx585->clientdev, "power_on\n");
> +
> +	ret = regulator_bulk_enable(IMX585_NUM_SUPPLIES, imx585->supplies);
> +	if (ret) {
> +		dev_err(imx585->clientdev, "Failed to enable regulators\n");
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(imx585->xclk);
> +	if (ret) {
> +		dev_err(imx585->clientdev, "Failed to enable clock\n");
> +		goto reg_off;
> +	}
> +
> +	gpiod_set_value_cansleep(imx585->reset_gpio, 1);

You asserted reset gpio causing it to enter reset and you call this
"power on"?

> +	usleep_range(IMX585_XCLR_MIN_DELAY_US,
> +		     IMX585_XCLR_MIN_DELAY_US + IMX585_XCLR_DELAY_RANGE_US);
> +	return 0;
> +
> +reg_off:
> +	regulator_bulk_disable(IMX585_NUM_SUPPLIES, imx585->supplies);
> +	return ret;
> +}
> +
> +static int imx585_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct imx585 *imx585 = to_imx585(sd);
> +
> +	dev_dbg(imx585->clientdev, "power_off\n");
> +
> +	gpiod_set_value_cansleep(imx585->reset_gpio, 0);

And here device comes up, but you call it power off? Your functions or
reset gpio code are completely reversed/wrong.

Best regards,
Krzysztof


