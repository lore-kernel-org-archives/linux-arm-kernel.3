Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3131BCDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 08:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uo6NnJN2jX7vcV5RdZ2SceAtLALhlF1gSBqQZX2vAs=; b=BabVoqcuSjObA9Oq2e4lkepuZc
	N9SA4jWs2DMtqa2OQelCZWZdysFu7owIt7+2PXtBmfWhAnET+mlt7oZElLXi6AZoQtENngvjRAcMN
	qB1j+zK9F8kaJkH8Bz68c6m10ShzR+XP9nGEuHTcsjM1m8Vwwm/N88XrBSxK/XqN/xBDHwXOTVwsF
	BqjeQKubsKVUHNv3sIbkdJo6/v2UjRXnJFjVX5q9mmhAHFCuIlXMzraAEA4ekJoqQyqPCNOsg7FYU
	ivWykmPzm2+DoGUvN4yuEUtkXCRTfmdMeyUrtLG5cgxzgpM8HlYuH7eajc4BxlEgJg4cL5/Ht4XND
	gVcMQjqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIzx-00000007OfB-1TSp;
	Wed, 24 Jun 2026 08:30:17 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIzt-00000007OeT-0baE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 08:30:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 1BB7A200320;
	Wed, 24 Jun 2026 10:30:09 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wcIzp-004OaY-05;
	Wed, 24 Jun 2026 10:30:09 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wcIzo-000000003om-3yka;
	Wed, 24 Jun 2026 10:30:08 +0200
Message-ID: <0193c47ff4ca98b1a6cb56ed8f4d8876b54756d8.camel@pengutronix.de>
Subject: Re: [PATCH v6 3/4] reset: cix: add sky1 audss auxiliary reset driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: joakim.zhang@cixtech.com, mturquette@baylibre.com, sboyd@kernel.org, 
	bmasney@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	gary.yang@cixtech.com
Cc: cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Wed, 24 Jun 2026 10:30:08 +0200
In-Reply-To: <20260623070805.211019-4-joakim.zhang@cixtech.com>
References: <20260623070805.211019-1-joakim.zhang@cixtech.com>
	 <20260623070805.211019-4-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_013013_337822_292A2BE8 
X-CRM114-Status: GOOD (  30.93  )
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

On Di, 2026-06-23 at 15:08 +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
>=20
> Add an auxiliary reset controller driver for the AUDSS CRU. Sixteen
> software reset lines for audio subsystem peripherals are controlled
> through one register in the CRU register map.
>=20
> The driver is created by the AUDSS clock platform driver and registers
> the reset controller on the CRU device node.
>=20
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  drivers/reset/Kconfig            |  14 +++
>  drivers/reset/Makefile           |   1 +
>  drivers/reset/reset-sky1-audss.c | 192 +++++++++++++++++++++++++++++++
>  3 files changed, 207 insertions(+)
>  create mode 100644 drivers/reset/reset-sky1-audss.c
>=20
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index d009eb0849a3..f74859b292ae 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -300,6 +300,20 @@ config RESET_SKY1
>  	help
>  	  This enables the reset controller for Cix Sky1.
> =20
> +config RESET_SKY1_AUDSS
> +	tristate "Cix Sky1 Audio Subsystem reset controller"
> +	depends on ARCH_CIX || COMPILE_TEST
> +	select AUXILIARY_BUS
> +	select REGMAP_MMIO
> +	default CLK_SKY1_AUDSS
> +	help
> +	  Support for block-level software reset lines in the Cix Sky1
> +	  Audio Subsystem (AUDSS) Clock and Reset Unit. Sixteen reset
> +	  outputs for audio peripherals are controlled through the CRU
> +	  register map. The driver binds as an auxiliary device from
> +	  the AUDSS clock driver. Say M or Y here if you want to build
> +	  this driver.
> +
>  config RESET_SOCFPGA
>  	bool "SoCFPGA Reset Driver" if COMPILE_TEST && (!ARM || !ARCH_INTEL_SOC=
FPGA)
>  	default ARM && ARCH_INTEL_SOCFPGA
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 3e52569bd276..e81407ea3e29 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -39,6 +39,7 @@ obj-$(CONFIG_RESET_RZV2H_USB2PHY) +=3D reset-rzv2h-usb2=
phy.o
>  obj-$(CONFIG_RESET_SCMI) +=3D reset-scmi.o
>  obj-$(CONFIG_RESET_SIMPLE) +=3D reset-simple.o
>  obj-$(CONFIG_RESET_SKY1) +=3D reset-sky1.o
> +obj-$(CONFIG_RESET_SKY1_AUDSS) +=3D reset-sky1-audss.o
>  obj-$(CONFIG_RESET_SOCFPGA) +=3D reset-socfpga.o
>  obj-$(CONFIG_RESET_SUNPLUS) +=3D reset-sunplus.o
>  obj-$(CONFIG_RESET_SUNXI) +=3D reset-sunxi.o
> diff --git a/drivers/reset/reset-sky1-audss.c b/drivers/reset/reset-sky1-=
audss.c
> new file mode 100644
> index 000000000000..20870f37d7d7
> --- /dev/null
> +++ b/drivers/reset/reset-sky1-audss.c
> @@ -0,0 +1,192 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Cix Sky1 Audio Subsystem reset controller driver
> + *
> + * Copyright 2026 Cix Technology Group Co., Ltd.
> + */
> +
> +#include <dt-bindings/reset/cix,sky1-audss-cru.h>
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> +
> +#define SKY1_RESET_SLEEP_MIN_US		50
> +#define SKY1_RESET_SLEEP_MAX_US		100
> +
> +#define AUDSS_SW_RST			0x78
> +
> +struct sky1_audss_reset_map {
> +	unsigned int offset;
> +	unsigned int mask;
> +};
> +
> +struct sky1_audss_reset {
> +	struct reset_controller_dev rcdev;
> +	struct regmap *regmap;
> +	const struct sky1_audss_reset_map *map;
> +};
> +
> +static const struct sky1_audss_reset_map sky1_audss_reset_map[] =3D {
> +	[AUDSS_I2S0_SW_RST]   =3D { AUDSS_SW_RST, BIT(0) },
> +	[AUDSS_I2S1_SW_RST]   =3D { AUDSS_SW_RST, BIT(1) },
> +	[AUDSS_I2S2_SW_RST]   =3D { AUDSS_SW_RST, BIT(2) },
> +	[AUDSS_I2S3_SW_RST]   =3D { AUDSS_SW_RST, BIT(3) },
> +	[AUDSS_I2S4_SW_RST]   =3D { AUDSS_SW_RST, BIT(4) },
> +	[AUDSS_I2S5_SW_RST]   =3D { AUDSS_SW_RST, BIT(5) },
> +	[AUDSS_I2S6_SW_RST]   =3D { AUDSS_SW_RST, BIT(6) },
> +	[AUDSS_I2S7_SW_RST]   =3D { AUDSS_SW_RST, BIT(7) },
> +	[AUDSS_I2S8_SW_RST]   =3D { AUDSS_SW_RST, BIT(8) },
> +	[AUDSS_I2S9_SW_RST]   =3D { AUDSS_SW_RST, BIT(9) },
> +	[AUDSS_WDT_SW_RST]    =3D { AUDSS_SW_RST, BIT(10) },
> +	[AUDSS_TIMER_SW_RST]  =3D { AUDSS_SW_RST, BIT(11) },
> +	[AUDSS_MB0_SW_RST]    =3D { AUDSS_SW_RST, BIT(12) },
> +	[AUDSS_MB1_SW_RST]    =3D { AUDSS_SW_RST, BIT(13) },
> +	[AUDSS_HDA_SW_RST]    =3D { AUDSS_SW_RST, BIT(14) },
> +	[AUDSS_DMAC_SW_RST]   =3D { AUDSS_SW_RST, BIT(15) },
> +};
> +
> +static struct sky1_audss_reset *to_sky1_audss_reset(struct reset_control=
ler_dev *rcdev)
> +{
> +	return container_of(rcdev, struct sky1_audss_reset, rcdev);
> +}
> +
> +static int sky1_audss_reset_set(struct reset_controller_dev *rcdev,
> +				unsigned long id, bool assert)
> +{
> +	struct sky1_audss_reset *priv =3D to_sky1_audss_reset(rcdev);
> +	const struct sky1_audss_reset_map *signal =3D &priv->map[id];
> +	unsigned int value =3D assert ? 0 : signal->mask;
> +
> +	return regmap_update_bits(priv->regmap, signal->offset, signal->mask, v=
alue);

Why does this propagate the return value ...

> +}
> +
> +static int sky1_audss_reset_assert(struct reset_controller_dev *rcdev,
> +				   unsigned long id)
> +{
> +	sky1_audss_reset_set(rcdev, id, true);

... only to be ignored? It'd be better to pass it on.

> +	usleep_range(SKY1_RESET_SLEEP_MIN_US, SKY1_RESET_SLEEP_MAX_US);
> +	return 0;
> +}
> +
> +static int sky1_audss_reset_deassert(struct reset_controller_dev *rcdev,
> +				     unsigned long id)
> +{
> +	sky1_audss_reset_set(rcdev, id, false);
> +	usleep_range(SKY1_RESET_SLEEP_MIN_US, SKY1_RESET_SLEEP_MAX_US);
> +	return 0;
> +}
> +
> +static int sky1_audss_reset(struct reset_controller_dev *rcdev,
> +			    unsigned long id)
> +{
> +	sky1_audss_reset_assert(rcdev, id);
> +	sky1_audss_reset_deassert(rcdev, id);
> +	return 0;
> +}

Will any AUDSS reset consumer use the reset_control_reset() API?
If not, no need to implement this.

> +
> +static int sky1_audss_reset_status(struct reset_controller_dev *rcdev,
> +				   unsigned long id)
> +{
> +	struct sky1_audss_reset *priv =3D to_sky1_audss_reset(rcdev);
> +	const struct sky1_audss_reset_map *signal =3D &priv->map[id];
> +	unsigned int value;
> +
> +	regmap_read(priv->regmap, signal->offset, &value);
> +	return !!(value & signal->mask);
> +}
> +
> +static const struct reset_control_ops sky1_audss_reset_ops =3D {
> +	.reset    =3D sky1_audss_reset,
> +	.assert   =3D sky1_audss_reset_assert,
> +	.deassert =3D sky1_audss_reset_deassert,
> +	.status   =3D sky1_audss_reset_status,
> +};
> +
> +static const struct regmap_config sky1_audss_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.reg_stride =3D 4,
> +};
> +
> +static void sky1_audss_reset_iounmap(void *data)
> +{
> +	iounmap(data);
> +}
> +
> +static int sky1_audss_reset_get_regmap(struct sky1_audss_reset *priv)
> +{
> +	struct device *dev =3D priv->rcdev.dev;
> +	void __iomem *base;
> +	int ret;
> +
> +	priv->regmap =3D dev_get_regmap(dev->parent, NULL);
> +	if (priv->regmap)
> +		return 0;
> +
> +	base =3D of_iomap(dev->parent->of_node, 0);
> +	if (!base)
> +		return dev_err_probe(dev, -ENOMEM, "failed to iomap address space\n");
> +
> +	ret =3D devm_add_action_or_reset(dev, sky1_audss_reset_iounmap, base);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register iounmap action\n");
> +
> +	priv->regmap =3D devm_regmap_init_mmio(dev, base, &sky1_audss_regmap_co=
nfig);
> +	if (IS_ERR(priv->regmap))
> +		return dev_err_probe(dev, PTR_ERR(priv->regmap),
> +				     "failed to initialize regmap\n");

Why is there a fallback path? The clock driver creates the regmap
before creating the reset aux device, so dev_get_regmap() can never
fail.

> +
> +	return 0;
> +}
> +
> +static int sky1_audss_reset_probe(struct auxiliary_device *adev,
> +				  const struct auxiliary_device_id *id)
> +{
> +	struct sky1_audss_reset *priv;
> +	struct device *dev =3D &adev->dev;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->map =3D sky1_audss_reset_map;
> +	priv->rcdev.owner =3D THIS_MODULE;
> +	priv->rcdev.nr_resets =3D ARRAY_SIZE(sky1_audss_reset_map);
> +	priv->rcdev.ops =3D &sky1_audss_reset_ops;
> +	priv->rcdev.of_node =3D dev->parent->of_node;

auxiliary_device_create() uses device_set_of_node_from_dev() to inherit
the parent of_node, so you can use dev->of_node here.

> +	priv->rcdev.dev =3D dev;
> +	priv->rcdev.of_reset_n_cells =3D 1;

No need to set of_reset_n_cells.

> +
> +	dev_set_drvdata(dev, priv);

This seems unnecessary as well.

> +
> +	ret =3D sky1_audss_reset_get_regmap(priv);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get regmap\n");
> +
> +	return devm_reset_controller_register(dev, &priv->rcdev);
> +}
> +
> +static const struct auxiliary_device_id sky1_audss_reset_ids[] =3D {
> +	{ .name =3D "clk_sky1_audss.reset" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(auxiliary, sky1_audss_reset_ids);
> +
> +static struct auxiliary_driver sky1_audss_reset_driver =3D {
> +	.probe =3D sky1_audss_reset_probe,
> +	.id_table =3D sky1_audss_reset_ids,
> +};
> +

Drop this empty line.

> +module_auxiliary_driver(sky1_audss_reset_driver);
> +
> +MODULE_AUTHOR("Joakim Zhang <joakim.zhang@cixtech.com>");
> +MODULE_DESCRIPTION("Cix Sky1 Audio Subsystem reset driver");
> +MODULE_LICENSE("GPL");

regards
Philipp

