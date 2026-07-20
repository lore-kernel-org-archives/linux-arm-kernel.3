Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CF4C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8IQWFPTDyWZ4kNoQyTe6sDb3NgN065lh8scCPG9LCO0=; b=mGu9V9jIu6L+Ol0Be8LBoRcmhi
	LZ/m++aPlD3aarx/u98xsrH7yfydUyGNQOzr/3srfNyE4q5aslYF3tGKlcXv0NQTS5cWjvWJ7Knih
	LCFcN3f91wBl+sMT8liNZO6B8y2qGOeTol3kfsmTs8ll+VFjYlxBUQTdLISHGevL6s3r33zdvOdyX
	gnvXT2R8o6I2Y1aYNy4xMI9/Se/utVK1Xzh+G77Tcukvmt9JLGBNDf+voZNHO7d7QM0PXSHgjR1VW
	ixzx//5IDaaFG0a0ufVXQ371JXkSZEgNv7ReR3hMdBnoc99NKu+vD/2TD3BwuS8dcDrA9H4rxPj8Z
	NANk+CtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliIe-00000006348-1VPe;
	Mon, 20 Jul 2026 07:20:28 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliIb-0000000633k-2vxr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:20:27 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 194F0201E75;
	Mon, 20 Jul 2026 09:20:21 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wliIX-000MrJ-04;
	Mon, 20 Jul 2026 09:20:21 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wliIW-0000000049o-3wO4;
	Mon, 20 Jul 2026 09:20:20 +0200
Message-ID: <0d0c7befafd2e60b8887245f4e60a504704014dc.camel@pengutronix.de>
Subject: Re: [PATCH v10 3/4] reset: cix: add sky1 audss auxiliary reset
 driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: joakim.zhang@cixtech.com, mturquette@baylibre.com, sboyd@kernel.org, 
	bmasney@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Mon, 20 Jul 2026 09:20:20 +0200
In-Reply-To: <20260720051505.1252774-4-joakim.zhang@cixtech.com>
References: <20260720051505.1252774-1-joakim.zhang@cixtech.com>
	 <20260720051505.1252774-4-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_002025_891302_7D89F057 
X-CRM114-Status: GOOD (  27.96  )
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

On Mo, 2026-07-20 at 13:15 +0800, joakim.zhang@cixtech.com wrote:
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
>  drivers/reset/Kconfig            |  13 +++
>  drivers/reset/Makefile           |   1 +
>  drivers/reset/reset-sky1-audss.c | 137 +++++++++++++++++++++++++++++++
>  3 files changed, 151 insertions(+)
>  create mode 100644 drivers/reset/reset-sky1-audss.c
>=20
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index d009eb0849a3..b19e719f2abe 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -300,6 +300,19 @@ config RESET_SKY1
>  	help
>  	  This enables the reset controller for Cix Sky1.
> =20
> +config RESET_SKY1_AUDSS
> +	tristate "Cix Sky1 Audio Subsystem reset controller"
> +	depends on ARCH_CIX || COMPILE_TEST
> +	select AUXILIARY_BUS
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
> index 000000000000..d31d80e1251a
> --- /dev/null
> +++ b/drivers/reset/reset-sky1-audss.c
> @@ -0,0 +1,137 @@
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
> +#include <linux/module.h>
> +#include <linux/of.h>

What is this used for?

> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> +
> +#define SKY1_RESET_SLEEP_MIN_US		50
> +#define SKY1_RESET_SLEEP_MAX_US		100

Is this delay compatible with all possible modules being reset?

Are min and max from a spec or is this just some safe value?
Maybe you could only define the _MIN_US and use fsleep() below.

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

Consider using regmap_assign_bits() instead.

> +}
> +
> +static int sky1_audss_reset_assert(struct reset_controller_dev *rcdev,
> +				   unsigned long id)
> +{
> +	int ret;
> +
> +	ret =3D sky1_audss_reset_set(rcdev, id, true);
> +	if (ret)
> +		return ret;
> +
> +	usleep_range(SKY1_RESET_SLEEP_MIN_US, SKY1_RESET_SLEEP_MAX_US);
> +	return 0;
> +}
> +
> +static int sky1_audss_reset_deassert(struct reset_controller_dev *rcdev,
> +				     unsigned long id)
> +{
> +	int ret;
> +
> +	ret =3D sky1_audss_reset_set(rcdev, id, false);
> +	if (ret)
> +		return ret;
> +
> +	usleep_range(SKY1_RESET_SLEEP_MIN_US, SKY1_RESET_SLEEP_MAX_US);

This is the same in both assert and deassert. You could move it into
the helper function.

regards
Philipp

