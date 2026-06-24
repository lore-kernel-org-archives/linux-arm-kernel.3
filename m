Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01823CDB481
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 13:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wvGrticL+14eaoXUIsDMUBu/59dncMbQJKT5O+QSdk=; b=qZGUbCStalcYFrZSdZawUniGBt
	d3tTB0/cfWsTNDo6onPY6LUQoK1l/TUqfdXqQ2TwGZl6n7fQxCu61UIAE5mk6hgdeq2RES+heN0dk
	e1LFNWI67U7MTEv+NGUvs9eENBWrSbdTgGuJipQzdS/0qXcl0Nc7mRb/N9dbkLGgPIGFUr1cNr8ar
	kWAvt3BBG/hg2qZ918j5eBVOfWSM6tG3N6zO3/VA97PGgL3aKCOSyC1rNB4+0SjoUNhzVC5bB9xH/
	HE4alcbUuY3h+/wztSM9I2fNKQyNt4AJ8Bi/za+6xjoDIPUApNJFMztxh5OOxUy8zAcpkyIeJikxV
	LfrERB0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNGV-00000007nE0-3DKr;
	Wed, 24 Jun 2026 13:03:39 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNGT-00000007nCy-2HjE;
	Wed, 24 Jun 2026 13:03:39 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 830D12007B6;
	Wed, 24 Jun 2026 15:03:35 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wcNGR-004QbC-1S;
	Wed, 24 Jun 2026 15:03:35 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wcNGR-00000000B6d-1TPc;
	Wed, 24 Jun 2026 15:03:35 +0200
Message-ID: <9db83aa615f43ff6eac090626b43915fcd593a25.camel@pengutronix.de>
Subject: Re: [PATCH v9 04/12] reset: realtek: Add RTD1625-ISO reset
 controller driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yu-Chun Lin <eleanor.lin@realtek.com>, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
 bmasney@redhat.com
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
	cy.huang@realtek.com, stanley_chang@realtek.com
Date: Wed, 24 Jun 2026 15:03:35 +0200
In-Reply-To: <20260624112940.3475605-5-eleanor.lin@realtek.com>
References: <20260624112940.3475605-1-eleanor.lin@realtek.com>
	 <20260624112940.3475605-5-eleanor.lin@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_060337_886031_FA8315BF 
X-CRM114-Status: GOOD (  23.38  )
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

On Mi, 2026-06-24 at 19:29 +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
>=20
> Add support for the ISO (Isolation) domain reset controller on the Realte=
k
> RTD1625 SoC.
>=20
> The reset controller shares the same register space with the ISO clock
> controller. To handle this shared register space, the reset driver is
> implemented as an auxiliary driver. It will be instantiated and probed vi=
a
> the auxiliary bus by the RTD1625-ISO clock controller driver.
>=20
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v9:
> - Extract reset-related code from the previous clock driver patch
> (formerly patch 9 in v8).
> ---
>  drivers/reset/realtek/Makefile            |  2 +-
>  drivers/reset/realtek/reset-rtd1625-iso.c | 99 +++++++++++++++++++++++
>  2 files changed, 100 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/reset/realtek/reset-rtd1625-iso.c
>=20
> diff --git a/drivers/reset/realtek/Makefile b/drivers/reset/realtek/Makef=
ile
> index c3f605ffb11c..9007c9d5683b 100644
> --- a/drivers/reset/realtek/Makefile
> +++ b/drivers/reset/realtek/Makefile
> @@ -1,3 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_RESET_RTK_COMMON) +=3D reset-rtk-common.o
> -obj-$(CONFIG_RESET_RTD1625) +=3D reset-rtd1625-crt.o
> +obj-$(CONFIG_RESET_RTD1625) +=3D reset-rtd1625-crt.o reset-rtd1625-iso.o

Is there any benefit to these two being separate modules?
I suggest you merge them into one: reset-rtd1625.o

> diff --git a/drivers/reset/realtek/reset-rtd1625-iso.c b/drivers/reset/re=
altek/reset-rtd1625-iso.c
> new file mode 100644
> index 000000000000..78eaabb408f0
> --- /dev/null
> +++ b/drivers/reset/realtek/reset-rtd1625-iso.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Realtek Semiconductor Corporation
> + */
> +
> +#include <dt-bindings/reset/realtek,rtd1625.h>
> +#include <linux/auxiliary_bus.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/of.h>
> +#include <linux/slab.h>
> +#include "reset-rtk-common.h"
> +
> +#define RTD1625_ISO_RSTN_MAX	29
> +#define RTD1625_ISO_S_RSTN_MAX	5

These are not necessary, just use ARRAY_SIZE() for nr_resets.

> +
> +static const struct rtk_reset_desc rtd1625_iso_reset_descs[] =3D {
> +	[RTD1625_ISO_RSTN_VFD]                 =3D { .ofs =3D 0x88, .bit =3D 0 =
},
> +	[RTD1625_ISO_RSTN_CEC0]                =3D { .ofs =3D 0x88, .bit =3D 2 =
},
> +	[RTD1625_ISO_RSTN_CEC1]                =3D { .ofs =3D 0x88, .bit =3D 3 =
},
> +	[RTD1625_ISO_RSTN_CBUSTX]              =3D { .ofs =3D 0x88, .bit =3D 5 =
},
> +	[RTD1625_ISO_RSTN_CBUSRX]              =3D { .ofs =3D 0x88, .bit =3D 6 =
},
> +	[RTD1625_ISO_RSTN_USB3_PHY2_XTAL_POW]  =3D { .ofs =3D 0x88, .bit =3D 7 =
},
> +	[RTD1625_ISO_RSTN_UR0]                 =3D { .ofs =3D 0x88, .bit =3D 8 =
},
> +	[RTD1625_ISO_RSTN_GMAC]                =3D { .ofs =3D 0x88, .bit =3D 9 =
},
> +	[RTD1625_ISO_RSTN_GPHY]                =3D { .ofs =3D 0x88, .bit =3D 10=
 },
> +	[RTD1625_ISO_RSTN_I2C_0]               =3D { .ofs =3D 0x88, .bit =3D 11=
 },
> +	[RTD1625_ISO_RSTN_I2C_1]               =3D { .ofs =3D 0x88, .bit =3D 12=
 },
> +	[RTD1625_ISO_RSTN_CBUS]                =3D { .ofs =3D 0x88, .bit =3D 13=
 },
> +	[RTD1625_ISO_RSTN_USB_DRD]             =3D { .ofs =3D 0x88, .bit =3D 14=
 },
> +	[RTD1625_ISO_RSTN_USB_HOST]            =3D { .ofs =3D 0x88, .bit =3D 15=
 },
> +	[RTD1625_ISO_RSTN_USB_PHY_0]           =3D { .ofs =3D 0x88, .bit =3D 16=
 },
> +	[RTD1625_ISO_RSTN_USB_PHY_1]           =3D { .ofs =3D 0x88, .bit =3D 17=
 },
> +	[RTD1625_ISO_RSTN_USB_PHY_2]           =3D { .ofs =3D 0x88, .bit =3D 18=
 },
> +	[RTD1625_ISO_RSTN_USB]                 =3D { .ofs =3D 0x88, .bit =3D 19=
 },
> +	[RTD1625_ISO_RSTN_TYPE_C]              =3D { .ofs =3D 0x88, .bit =3D 20=
 },
> +	[RTD1625_ISO_RSTN_USB_U3_HOST]         =3D { .ofs =3D 0x88, .bit =3D 21=
 },
> +	[RTD1625_ISO_RSTN_USB3_PHY0_POW]       =3D { .ofs =3D 0x88, .bit =3D 22=
 },
> +	[RTD1625_ISO_RSTN_USB3_P0_MDIO]        =3D { .ofs =3D 0x88, .bit =3D 23=
 },
> +	[RTD1625_ISO_RSTN_USB3_PHY1_POW]       =3D { .ofs =3D 0x88, .bit =3D 24=
 },
> +	[RTD1625_ISO_RSTN_USB3_P1_MDIO]        =3D { .ofs =3D 0x88, .bit =3D 25=
 },
> +	[RTD1625_ISO_RSTN_VTC]                 =3D { .ofs =3D 0x88, .bit =3D 26=
 },
> +	[RTD1625_ISO_RSTN_USB3_PHY2_POW]       =3D { .ofs =3D 0x88, .bit =3D 27=
 },
> +	[RTD1625_ISO_RSTN_USB3_P2_MDIO]        =3D { .ofs =3D 0x88, .bit =3D 28=
 },
> +	[RTD1625_ISO_RSTN_USB_PHY_3]           =3D { .ofs =3D 0x88, .bit =3D 29=
 },
> +	[RTD1625_ISO_RSTN_USB_PHY_4]           =3D { .ofs =3D 0x88, .bit =3D 30=
 },
> +};
> +
> +static const struct rtk_reset_desc rtd1625_iso_s_reset_descs[] =3D {
> +	[RTD1625_ISO_S_RSTN_ISOM_MIS] =3D { .ofs =3D 0x310, .bit =3D 0, .write_=
en =3D 1 },
> +	[RTD1625_ISO_S_RSTN_GPIOM]    =3D { .ofs =3D 0x310, .bit =3D 2, .write_=
en =3D 1 },
> +	[RTD1625_ISO_S_RSTN_TIMER7]   =3D { .ofs =3D 0x310, .bit =3D 4, .write_=
en =3D 1 },
> +	[RTD1625_ISO_S_RSTN_IRDA]     =3D { .ofs =3D 0x310, .bit =3D 6, .write_=
en =3D 1 },
> +	[RTD1625_ISO_S_RSTN_UR10]     =3D { .ofs =3D 0x310, .bit =3D 8, .write_=
en =3D 1 },
> +};
> +
> +static int rtd1625_iso_reset_probe(struct auxiliary_device *adev,
> +				   const struct auxiliary_device_id *id)
> +{
> +	struct device *dev =3D &adev->dev;
> +	struct device *parent =3D dev->parent;
> +	struct rtk_reset_data *data;
> +
> +	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	if (of_device_is_compatible(parent->of_node, "realtek,rtd1625-iso-s-clk=
")) {
> +		data->descs           =3D rtd1625_iso_s_reset_descs;
> +		data->rcdev.nr_resets =3D RTD1625_ISO_S_RSTN_MAX;
> +	} else {
> +		data->descs           =3D rtd1625_iso_reset_descs;
> +		data->rcdev.nr_resets =3D RTD1625_ISO_RSTN_MAX;
> +	}

No need to parse OF compatible again. Store these in a struct, point
auxiliary_device_id::driver_data to it, and use that here.


regards
Philipp

