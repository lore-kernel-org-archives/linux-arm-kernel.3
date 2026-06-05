Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89138CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 07:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zXMiBMuQcMjTnraf2zd8LpCdPk7LLrmTooCxUL6h+/8=; b=tbs7kRQR1+8+Eg6EejYnfj/zlY
	czgLvpzUK3e6qvqj/1rmFZbVKF3sQg5fTagyRzuli+7vZQ0e3E1KXECQ0Bb8LpJ6odz4/dTBaYDKP
	c8WInu5HdtfhQPjw50i/LKdjxcJC/W5YBMq51oP/1qqdXYb/bWIJV2xclxFyc9daV6lVZyRxpZA25
	bDeVfFusiM+vxABvwQlQ1zJkTURmej8+MGb0H3/5M7hStJOAqyZwjoL1YxTU5cH8Wf6tS+ThCArzy
	rN6Bpwrgv6UVU8upzySBhVZoO2yfgGmo56/HkUNvB3lMIylPvsgF9hQMzLvuT7cR0pn96NoaHu4+8
	8PUHY4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPCI-00000000FWZ-1wZQ;
	Fri, 05 Jun 2026 07:42:30 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPCF-00000000FW4-3EvQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 07:42:29 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wVPBx-0001an-EM; Fri, 05 Jun 2026 09:42:09 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wVPBw-001Cpv-25;
	Fri, 05 Jun 2026 09:42:08 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wVPBw-000000002rx-2NXJ;
	Fri, 05 Jun 2026 09:42:08 +0200
Message-ID: <78e26b2459b89b107b24bf9f86d251ba16be3848.camel@pengutronix.de>
Subject: Re: [PATCH v2 4/5] clk: cix: add sky1 audss clock controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: joakim.zhang@cixtech.com, mturquette@baylibre.com, sboyd@kernel.org, 
	bmasney@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	gary.yang@cixtech.com
Cc: cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Fri, 05 Jun 2026 09:42:08 +0200
In-Reply-To: <20260605032225.523669-5-joakim.zhang@cixtech.com>
References: <20260605032225.523669-1-joakim.zhang@cixtech.com>
	 <20260605032225.523669-5-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_004227_812190_D04A4EFD 
X-CRM114-Status: GOOD (  22.61  )
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

On Fr, 2026-06-05 at 11:22 +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
>=20
> Add a platform driver for the Cix Sky1 Audio Subsystem (AUDSS) internal
> clock controller. The driver binds to a cix,sky1-audss-clock device tree
> node under the AUDSS syscon, obtains the parent regmap via
> syscon_node_to_regmap(), and registers mux/divider/gate composite clocks
> for DSP, SRAM, HDA, DMAC, watchdog, timer, mailbox and I2S outputs. Six
> SoC-level audio reference clocks are brought up as inputs to the tree.
>=20
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  drivers/clk/Kconfig              |    1 +
>  drivers/clk/Makefile             |    1 +
>  drivers/clk/cix/Kconfig          |   16 +
>  drivers/clk/cix/Makefile         |    3 +
>  drivers/clk/cix/clk-sky1-audss.c | 1129 ++++++++++++++++++++++++++++++
>  5 files changed, 1150 insertions(+)
>  create mode 100644 drivers/clk/cix/Kconfig
>  create mode 100644 drivers/clk/cix/Makefile
>  create mode 100644 drivers/clk/cix/clk-sky1-audss.c
>=20
[...]
> diff --git a/drivers/clk/cix/clk-sky1-audss.c b/drivers/clk/cix/clk-sky1-=
audss.c
> new file mode 100644
> index 000000000000..899452d5ed14
> --- /dev/null
> +++ b/drivers/clk/cix/clk-sky1-audss.c
> @@ -0,0 +1,1129 @@
[...]
> +/* register sky1 audio subsystem clocks */
> +static int sky1_audss_clk_probe(struct platform_device *pdev)
> +{
> +	const struct sky1_audss_clks_devtype_data *devtype_data;
> +	struct sky1_audss_clks_priv *priv;
> +	struct device_node *parent_np;
> +	struct device *dev =3D &pdev->dev;
> +	struct reset_control *rst_noc;
> +	struct clk_hw **clk_table;
> +	struct regmap *regmap_cru;
> +	int i, ret;
> +
> +	parent_np =3D of_get_parent(pdev->dev.of_node);
> +	regmap_cru =3D syscon_node_to_regmap(parent_np);
> +	of_node_put(parent_np);
> +	if (IS_ERR(regmap_cru))
> +		return dev_err_probe(dev, PTR_ERR(regmap_cru),
> +				     "unable to get audss cru regmap");
> +
> +	devtype_data =3D device_get_match_data(dev);
> +	if (!devtype_data)
> +		return -ENODEV;
> +
> +	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&priv->lock);
> +
> +	priv->clk_data =3D devm_kzalloc(&pdev->dev,
> +				      struct_size(priv->clk_data, hws, AUDSS_MAX_CLKS),
> +				      GFP_KERNEL);
> +	if (!priv->clk_data)
> +		return -ENOMEM;
> +
> +	priv->clk_data->num =3D AUDSS_MAX_CLKS;
> +	clk_table =3D priv->clk_data->hws;
> +
> +	priv->dev =3D dev;
> +	priv->regmap_cru =3D regmap_cru;
> +	priv->devtype_data =3D devtype_data;
> +
> +	ret =3D sky1_audss_clks_get(priv);
> +	if (ret)
> +		return ret;
> +
> +	rst_noc =3D devm_reset_control_get(dev, NULL);

Please use devm_reset_control_get_exclusive() directly.

[...]
> +static int __maybe_unused sky1_audss_clk_runtime_suspend(struct device *=
dev)
> +{
> +	struct sky1_audss_clks_priv *priv =3D dev_get_drvdata(dev);
> +	const struct sky1_audss_clks_devtype_data *devtype_data =3D priv->devty=
pe_data;
> +	unsigned long flags;
> +	int i;
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +	for (i =3D 0; i < devtype_data->reg_save_size; i++)
> +		regmap_read(priv->regmap_cru,
> +			    devtype_data->reg_save[i][0], &devtype_data->reg_save[i][1]);
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	sky1_audss_clks_disable(priv);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused sky1_audss_clk_runtime_resume(struct device *d=
ev)
> +{
> +	struct sky1_audss_clks_priv *priv =3D dev_get_drvdata(dev);
> +	const struct sky1_audss_clks_devtype_data *devtype_data =3D priv->devty=
pe_data;
> +	unsigned long flags;
> +	int i, ret;
> +
> +	ret =3D sky1_audss_clks_enable(priv);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks\n");
> +		return ret;
> +	}
> +
> +	reset_control_deassert(priv->rst_noc);

Deasserted on resume but not asserted on suspend, is this on purpose?

regards
Philipp

