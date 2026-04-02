Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3798FCC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 09:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Uok65dj69bcAmKA1QWCQXVXLBUk/1sPHSRfi/XnxpY=; b=YCPHHoj7yquDz5DOwvfPyNgGAx
	yYe13TqW6uqXmjFRN94x3ZjOijphDQXdVXqdRWzj0+COw4OuAHxyBqXvY83tYrra9ySs2bZUO8PgN
	OMZXqjVwN4lE4yXAoqAKqM/iVObV/9znyIKwZmS7lINRiN9X0c4Rgv02gTDhVHB5lughTwcoMUAtx
	VXXDKTkT3XSK8xR/YNKgSTwCF4xi2Mqush/FdDEOSg5OOsscKA8GuJZw9G3gCNLEDfgm4PQZG+Oob
	Qy8V9uo7oSQw0Z+t7nDpbU5V5kt8XEyx8k5yhU5YZFOM5Yhu5NALW4re9qTklRf7JLhx6rJXEjaIr
	N6tIsahQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EA3-0000000HEXJ-33Eh;
	Thu, 02 Apr 2026 09:16:23 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EA0-0000000HEWE-3b4k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 09:16:22 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w8E9W-0006Tm-4L; Thu, 02 Apr 2026 11:15:50 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w8E9V-003Lnm-1y;
	Thu, 02 Apr 2026 11:15:49 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w8E9V-000000004T7-2DNj;
	Thu, 02 Apr 2026 11:15:49 +0200
Message-ID: <5dd7ddb50b71de737aae6ad4d11bd28fa52443a9.camel@pengutronix.de>
Subject: Re: [PATCH v6 02/10] reset: Add Realtek basic reset support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yu-Chun Lin <eleanor.lin@realtek.com>, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
	cy.huang@realtek.com, stanley_chang@realtek.com
Date: Thu, 02 Apr 2026 11:15:49 +0200
In-Reply-To: <20260402073957.2742459-3-eleanor.lin@realtek.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
	 <20260402073957.2742459-3-eleanor.lin@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_021621_052403_A269F6BC 
X-CRM114-Status: GOOD (  25.80  )
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

On Do, 2026-04-02 at 15:39 +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
>=20
> Define the reset operations backed by a regmap-based register interface
> and prepare the reset controller to be registered through the reset
> framework.
>=20
> Since the reset controllers on Realtek SoCs often share the same register
> space with the clock controllers, this common framework is designed to
> extract the regmap and device tree node from the parent device
> (e.g., an auxiliary device parent).
>=20
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v6:
> - Remove the global header include/linux/reset/realtek.h and use a local =
common.h
> instead.
> - Extract regmap and of_node directly from the parent device.
> - Remove struct rtk_reset_initdata. Now, pass struct rtk_reset_data direc=
tly when
> calling rtk_reset_controller_add().
> ---
>  MAINTAINERS                    |  1 +
>  drivers/reset/Kconfig          |  1 +
>  drivers/reset/Makefile         |  1 +
>  drivers/reset/realtek/Kconfig  |  3 ++
>  drivers/reset/realtek/Makefile |  2 +
>  drivers/reset/realtek/common.c | 85 ++++++++++++++++++++++++++++++++++
>  drivers/reset/realtek/common.h | 29 ++++++++++++
>  7 files changed, 122 insertions(+)
>  create mode 100644 drivers/reset/realtek/Kconfig
>  create mode 100644 drivers/reset/realtek/Makefile
>  create mode 100644 drivers/reset/realtek/common.c
>  create mode 100644 drivers/reset/realtek/common.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 07e73bf621b0..8f355896583b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22240,6 +22240,7 @@ L:	devicetree@vger.kernel.org
>  L:	linux-clk@vger.kernel.org
>  S:	Supported
>  F:	Documentation/devicetree/bindings/clock/realtek*
> +F:	drivers/reset/realtek/*
>  F:	include/dt-bindings/clock/realtek*
>  F:	include/dt-bindings/reset/realtek*
> =20
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 7ce151f6a7e4..03be1931f264 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -398,6 +398,7 @@ config RESET_ZYNQMP
> =20
>  source "drivers/reset/amlogic/Kconfig"
>  source "drivers/reset/hisilicon/Kconfig"
> +source "drivers/reset/realtek/Kconfig"
>  source "drivers/reset/spacemit/Kconfig"
>  source "drivers/reset/starfive/Kconfig"
>  source "drivers/reset/sti/Kconfig"
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index fc0cc99f8514..4407d1630070 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -2,6 +2,7 @@
>  obj-y +=3D core.o
>  obj-y +=3D amlogic/
>  obj-y +=3D hisilicon/
> +obj-y +=3D realtek/
>  obj-y +=3D spacemit/
>  obj-y +=3D starfive/
>  obj-y +=3D sti/
> diff --git a/drivers/reset/realtek/Kconfig b/drivers/reset/realtek/Kconfi=
g
> new file mode 100644
> index 000000000000..99a14d355803
> --- /dev/null
> +++ b/drivers/reset/realtek/Kconfig
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config RESET_RTK_COMMON
> +	bool

Please make this build-testable with COMPILE_TEST.

> diff --git a/drivers/reset/realtek/Makefile b/drivers/reset/realtek/Makef=
ile
> new file mode 100644
> index 000000000000..b59a3f7f2453
> --- /dev/null
> +++ b/drivers/reset/realtek/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_RESET_RTK_COMMON) +=3D common.o
> diff --git a/drivers/reset/realtek/common.c b/drivers/reset/realtek/commo=
n.c
> new file mode 100644
> index 000000000000..ea7ff27117e7
> --- /dev/null
> +++ b/drivers/reset/realtek/common.c
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2019 Realtek Semiconductor Corporation
> + */
> +
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include "common.h"
> +
> +static inline struct rtk_reset_data *to_rtk_reset_controller(struct rese=
t_controller_dev *r)
> +{
> +	return container_of(r, struct rtk_reset_data, rcdev);
> +}
> +
> +static inline struct rtk_reset_desc *rtk_reset_get_desc(struct rtk_reset=
_data *data,
> +							unsigned long idx)
> +{
> +	return &data->descs[idx];
> +}
> +
> +static int rtk_reset_assert(struct reset_controller_dev *rcdev,
> +			    unsigned long idx)
> +{
> +	struct rtk_reset_data *data =3D to_rtk_reset_controller(rcdev);
> +	struct rtk_reset_desc *desc =3D rtk_reset_get_desc(data, idx);
> +	u32 mask =3D desc->write_en ? (0x3 << desc->bit) : BIT(desc->bit);
> +	u32 val  =3D desc->write_en ? (0x2 << desc->bit) : 0;
> +
> +	return regmap_update_bits(data->regmap, desc->ofs, mask, val);
> +}
> +
> +static int rtk_reset_deassert(struct reset_controller_dev *rcdev,
> +			      unsigned long idx)
> +{
> +	struct rtk_reset_data *data =3D to_rtk_reset_controller(rcdev);
> +	struct rtk_reset_desc *desc =3D rtk_reset_get_desc(data, idx);
> +	u32 mask =3D desc->write_en ? (0x3 << desc->bit) : BIT(desc->bit);
> +	u32 val  =3D mask;
> +
> +	return regmap_update_bits(data->regmap, desc->ofs, mask, val);
> +}
> +
> +static int rtk_reset_status(struct reset_controller_dev *rcdev,
> +			    unsigned long idx)
> +{
> +	struct rtk_reset_data *data =3D to_rtk_reset_controller(rcdev);
> +	struct rtk_reset_desc *desc =3D rtk_reset_get_desc(data, idx);
> +	u32 val;
> +	int ret;
> +
> +	ret =3D regmap_read(data->regmap, desc->ofs, &val);
> +	if (ret)
> +		return ret;
> +
> +	return !((val >> desc->bit) & 1);
> +}
> +
> +static const struct reset_control_ops rtk_reset_ops =3D {
> +	.assert   =3D rtk_reset_assert,
> +	.deassert =3D rtk_reset_deassert,
> +	.status   =3D rtk_reset_status,
> +};
> +
> +/* The caller must initialize data->rcdev.nr_resets and data->descs befo=
re
> + * calling rtk_reset_controller_add().
> + */
> +int rtk_reset_controller_add(struct device *dev,
> +			     struct rtk_reset_data *data)
> +{
> +	struct device *parent =3D dev->parent;
> +
> +	data->regmap =3D dev_get_regmap(parent, NULL);
> +	if (!data->regmap)
> +		return -ENODEV;
> +
> +	data->rcdev.owner     =3D THIS_MODULE;

The rtk_reset_desc arrays used by this code live in the calling module,
so it would be better to let the caller initialize .owner as well.

It doesn't make a difference in practice, since CONFIG_RESET_RTK_COMMON
isn't tristate (right now).


regards
Philipp

