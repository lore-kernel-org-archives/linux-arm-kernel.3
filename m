Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50401FCE08C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 14:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsK6/huAOPbvPqoPhHVEXz6tX984Z3AcmbyoQA1JEhY=; b=PR3g0GkrofWkCWjDEpIpvSvhBb
	KVvQQ3hJWC96bH0aDUKHu72mx++t6Re7xC36oiPE6FfBXgtIke5ArM+mNNIYojBXFRl7BSz/urdQg
	2zy4e8NZ2+aBZZAPQSTPxRRpH+YhSOOGwHIFJPbrufdLWXKpnzO146S16RkRASkGzWsAw1XZp9XME
	Hf02CypxL2NrJV0B09UeAYohbJcrSoZKYno2J+k0FB+ZCP3bhtHFcEYebPFgIn9vjpL75eiMpGRil
	GM9CB90sXJaoRgDzYhxQO2DPcchmZ5Gn1U8T4je7vQkT2ThWhR8YOyQwIoGwG6roAzbRIz7fJ8dZa
	5p36ZVgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvc6b-00000006I9o-2YQQ;
	Thu, 26 Feb 2026 14:12:41 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvc6Y-00000006I9N-105G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 14:12:39 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vvc6F-00033P-AO; Thu, 26 Feb 2026 15:12:19 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vvc6C-002kDY-1c;
	Thu, 26 Feb 2026 15:12:17 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vvc6D-00000000DNK-3A7z;
	Thu, 26 Feb 2026 15:12:17 +0100
Message-ID: <2938bcbbb46fdec1fd2629e11c28ce9cf09eee27.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/4] pwm: sun50i: Add H616 PWM support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Richard Genoud <richard.genoud@bootlin.com>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?=	 <u.kleine-koenig@baylibre.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Cc: Paul Kocialkowski <paulk@sys-base.io>, Thomas Petazzoni
	 <thomas.petazzoni@bootlin.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Thu, 26 Feb 2026 15:12:17 +0100
In-Reply-To: <20260123093322.1327389-3-richard.genoud@bootlin.com>
References: <20260123093322.1327389-1-richard.genoud@bootlin.com>
	 <20260123093322.1327389-3-richard.genoud@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_061238_454505_6C8A0B67 
X-CRM114-Status: GOOD (  31.20  )
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

On Fr, 2026-01-23 at 10:33 +0100, Richard Genoud wrote:
> Add driver for Allwinner H616 PWM controller, supporting up to 6
> channels.
> Those channels output can be either a PWM signal output or a clock
> output, thanks to the bypass.
>=20
> The channels are paired (0/1, 2/3 and 4/5) and each pair has a
> prescaler/mux/gate.
> Moreover, each channel has its own prescaler and bypass.
>=20
> The clock provider part of this driver is needed not only because the
> H616 PWM controller provides also clocks when bypass is enabled, but
> really because pwm-clock isn't fit to handle all cases here.
> pwm-clock would work if the 100MHz clock is requested, but if a lower
> clock is requested (like 24MHz), it will request a 42ns period to the
> PWM driver which will happily serve, with the 100MHz clock as input a
> 25MHz frequency and a duty cycle adjustable in the range [0-4]/4,
> because that is a sane thing to do for a PWM.
> The information missing is that a real clock is resquested, not a PWM.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---
>  drivers/pwm/Kconfig           |  12 +
>  drivers/pwm/Makefile          |   1 +
>  drivers/pwm/pwm-sun50i-h616.c | 959 ++++++++++++++++++++++++++++++++++
>  3 files changed, 972 insertions(+)
>  create mode 100644 drivers/pwm/pwm-sun50i-h616.c
>=20
[...]
> diff --git a/drivers/pwm/pwm-sun50i-h616.c b/drivers/pwm/pwm-sun50i-h616.=
c
> new file mode 100644
> index 000000000000..02a8e2d39f86
> --- /dev/null
> +++ b/drivers/pwm/pwm-sun50i-h616.c
> @@ -0,0 +1,959 @@
[...]
> +static int h616_pwm_init_clocks(struct platform_device *pdev,
> +				struct h616_pwm_chip *h616chip)
> +{
> +	struct clk_pwm_pdata *pdata;
> +	struct device *dev =3D &pdev->dev;
> +	int num_clocks =3D 0;
> +	int ret;
> +
> +	pdata =3D devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata)
> +		return dev_err_probe(dev, -ENOMEM,
> +				     "Failed to allocate clk_pwm_pdata\n");
> +
> +	while (pwmcc_data[num_clocks].name)
> +		num_clocks++;
> +
> +	pdata->hw_data =3D devm_kzalloc(dev, struct_size(pdata->hw_data, hws, n=
um_clocks),
> +				      GFP_KERNEL);
> +	if (!pdata->hw_data)
> +		return dev_err_probe(dev, -ENOMEM,
> +				     "Failed to allocate hw clocks\n");
> +
> +	pdata->hw_data->num =3D num_clocks;
> +	pdata->reg =3D h616chip->base;
> +
> +	spin_lock_init(&pdata->lock);
> +
> +	for (int i =3D 0; i < num_clocks; i++) {
> +		struct clk_hw **hw =3D &pdata->hw_data->hws[i];
> +
> +		ret =3D h616_add_composite_clk(&pwmcc_data[i], pdata->reg,
> +					     &pdata->lock, dev, hw);
> +		if (ret) {
> +			dev_err_probe(dev, ret,
> +				      "Failed to register hw clock %s\n",
> +				      pwmcc_data[i].name);
> +			for (i--; i >=3D 0; i--)
> +				clk_hw_unregister_composite(pdata->hw_data->hws[i]);
> +			return ret;
> +		}
> +	}
> +
> +	h616chip->clk_pdata =3D pdata;
> +
> +	return 0;
> +}
> +
> +static int h616_pwm_probe(struct platform_device *pdev)
> +{
> +	const struct h616_pwm_data *data;
> +	struct device *dev =3D &pdev->dev;
> +	struct h616_pwm_chip *h616chip;
> +	struct pwm_chip *chip;
> +	int ret;
> +
> +	data =3D of_device_get_match_data(dev);
> +	if (!data)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "Missing specific data structure\n");
> +
> +	chip =3D devm_pwmchip_alloc(dev, data->npwm, sizeof(*h616chip));
> +	if (IS_ERR(chip))
> +		return dev_err_probe(dev, PTR_ERR(chip),
> +				     "Failed to allocate pwmchip\n");
> +
> +	h616chip =3D h616_pwm_from_chip(chip);
> +	h616chip->data =3D data;
> +	h616chip->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(h616chip->base))
> +		return dev_err_probe(dev, PTR_ERR(h616chip->base),
> +				     "Failed to get PWM base address\n");
> +
> +	h616chip->bus_clk =3D devm_clk_get_enabled(dev, "bus");
> +	if (IS_ERR(h616chip->bus_clk))
> +		return dev_err_probe(dev, PTR_ERR(h616chip->bus_clk),
> +				     "Failed to get bus clock\n");
> +
> +	h616chip->channels =3D devm_kmalloc_array(dev, data->npwm,
> +						sizeof(*(h616chip->channels)),
> +						GFP_KERNEL);
> +	if (!h616chip->channels)
> +		return dev_err_probe(dev, -ENOMEM,
> +				     "Failed to allocate %d channels array\n",
> +				     data->npwm);
> +
> +	h616chip->rst =3D devm_reset_control_get_shared(dev, NULL);
> +	if (IS_ERR(h616chip->rst))
> +		return dev_err_probe(dev, PTR_ERR(h616chip->rst),
> +				     "Failed to get reset control\n");
> +
> +	chip->ops =3D &h616_pwm_ops;
> +
> +	ret =3D h616_pwm_init_clocks(pdev, h616chip);
> +	if (ret)
> +		return ret;
> +
> +	for (unsigned int i =3D 0; i < data->npwm; i++) {
> +		struct h616_pwm_channel *chan =3D &h616chip->channels[i];
> +		struct clk_hw **hw =3D &h616chip->clk_pdata->hw_data->hws[i];
> +
> +		chan->pwm_clk =3D devm_clk_hw_get_clk(dev, *hw, NULL);
> +		if (IS_ERR(chan->pwm_clk)) {
> +			ret =3D dev_err_probe(dev, PTR_ERR(chan->pwm_clk),
> +					    "Failed to register PWM clock %d\n", i);
> +			goto err_get_clk;
> +		}
> +		chan->mode =3D H616_PWM_MODE_NONE;
> +	}
> +
> +	ret =3D devm_of_clk_add_hw_provider(dev, h616_pwm_of_clk_get, h616chip)=
;
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to add HW clock provider\n");
> +		goto err_add_clk_provider;
> +	}
> +
> +	/* Deassert reset */
> +	ret =3D reset_control_deassert(h616chip->rst);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Cannot deassert reset control\n");
> +		goto err_ctrl_deassert;
> +	}
> +
> +	ret =3D pwmchip_add(chip);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "Failed to add PWM chip\n");
> +		goto err_pwm_add;
> +	}
> +
> +	platform_set_drvdata(pdev, chip);
> +
> +	return 0;
> +
> +err_pwm_add:
> +	reset_control_assert(h616chip->rst);
> +
> +err_ctrl_deassert:
> +err_add_clk_provider:
> +err_get_clk:
> +	for (unsigned int i =3D 0; i < h616chip->clk_pdata->hw_data->num; i++)
> +		clk_hw_unregister_composite(h616chip->clk_pdata->hw_data->hws[i]);

Won't this try to unregister the clk_hw before the pwm_clk derived from
it? You could place this in a devres action to correct the cleanup
order and get rid of the duplicated cleanup in h616_pwm_remove().

I think you could even use devm_pwmchip_add() and
devm_reset_control_get_shared_deasserted() and remove h616_pwm_remove
entirely.

regards
Philipp

