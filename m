Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F6AC43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 08:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+PZGB57ahz3sODbypiApN0HEPYwZYKH8OdF45jRLoA=; b=Wn7RoO02pdXt+91f+eFNBdZwHc
	snR7TmHXh/F0s1br3WMZWqZx4APz7IX031oSeNGhPMVuvSYV2QxksIPtAKy2m+dd+zsHBmI21OT1z
	+x+NK/6PgCFKEWbNqaXMhbfEcmqLaYemVMOa2WqVppeyJQBNcOP0G+1Sg2oZwZROyX+ajqhLwn+UN
	3QXFqCGtctkcZH1f8wOiqvMi4x5ZqKHWX4PCyTDXlb5/dC7YtXt7oI40sG5RW+qbmbdvvxhOoq0Nn
	7pwyd+DAgrsajoEUL7dVEekpl4i0+VVhRZEp0I/dvrnanJfv60Z4pD4gxVAd6IjJc4u6+jgPlJ7ag
	7YkW8xhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weU5f-0000000GICH-3a6h;
	Tue, 30 Jun 2026 08:45:11 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weU5c-0000000GIBS-3ryi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 08:45:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id CEB042006B4;
	Tue, 30 Jun 2026 10:45:06 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1weU5a-005Ns1-2Q;
	Tue, 30 Jun 2026 10:45:06 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1weU5a-000000004al-2ntK;
	Tue, 30 Jun 2026 10:45:06 +0200
Message-ID: <d2a9a7b75795650728e7467c4904bfdabd00b0c8.camel@pengutronix.de>
Subject: Re: [PATCH RFC v5 11/12] reset: zte: Add a zx297520v3 reset driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stefan =?ISO-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>,  Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Brian Masney	 <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Tue, 30 Jun 2026 10:45:06 +0200
In-Reply-To: <20260628-zx29clk-v5-11-79ff044e4192@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
	 <20260628-zx29clk-v5-11-79ff044e4192@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_014509_121028_58FEB0D1 
X-CRM114-Status: GOOD (  28.26  )
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

On So, 2026-06-28 at 22:59 +0300, Stefan D=C3=B6singer wrote:
> This drives the MFD child devices created by the zx297520v3-crm driver
> as well as the aux device created by the zx297520v3-lspclk driver.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>=20
> ---
>=20
> v5:
> Make top and matrix MFD children instead of aux devices

Why? What is the difference between top/matrix and lsp here?

Couldn't you just keep all three as aux devices and remove the
platform_device boilerplate half of the driver?


[...]
> diff --git a/drivers/reset/reset-zte-zx297520v3.c b/drivers/reset/reset-z=
te-zx297520v3.c
> new file mode 100644
> index 000000000000..8ef434904230
> --- /dev/null
> +++ b/drivers/reset/reset-zte-zx297520v3.c
> @@ -0,0 +1,274 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Stefan D=C3=B6singer
> + */
> +#include <dt-bindings/reset/zte,zx297520v3-reset.h>
> +#include <linux/reset-controller.h>
> +#include <linux/platform_device.h>
> +#include <linux/auxiliary_bus.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
> +#include <linux/iopoll.h>

Looks like this is not needed anymore.

> +/* Most devices on the zx297520v3 SoC have one reset bit per clock line.=
 As a rule of thumb, the
> + * lower bit disconnects the device from the bus, similarly to turning o=
ff PCLK - registers read 0
> + * or hang indefinitely. Unlike PCLK, this reset may have a lingering ef=
fect after deasserting.
> + * E.g. timers will be disabled, but retain their counter value.
> + *
> + * The other bit resets the actual device registers.
> + *
> + * For some devices, e.g. GMAC, the reset bits behave in the same way: T=
hey disconnect the device
> + * and registers will have their default state after deasserting. For de=
vices that have both reset
> + * bits, both need to be deasserted for the device to function.
> + */
> +struct zte_reset_reg {
> +	u32 mask;
> +	u16 reg;
> +};
> +
> +struct zte_reset_info {
> +	const struct zte_reset_reg *resets;
> +	unsigned int num;
> +};
> +
> +struct zte_reset {
> +	struct reset_controller_dev rcdev;
> +	struct regmap *map;
> +	const struct zte_reset_reg *resets;
> +};
> +
> +static inline struct zte_reset *to_zte_reset(struct reset_controller_dev=
 *rcdev)
> +{
> +	return container_of(rcdev, struct zte_reset, rcdev);
> +}
> +
> +static int zx29_rst_assert(struct reset_controller_dev *rcdev, unsigned =
long id)
> +{
> +	struct zte_reset *rst =3D to_zte_reset(rcdev);
> +
> +	return regmap_clear_bits(rst->map, rst->resets[id].reg, rst->resets[id]=
.mask);
> +}
> +
> +static int zx29_rst_deassert(struct reset_controller_dev *rcdev, unsigne=
d long id)
> +{
> +	struct zte_reset *rst =3D to_zte_reset(rcdev);
> +
> +	return regmap_set_bits(rst->map, rst->resets[id].reg, rst->resets[id].m=
ask);
> +}
> +
> +static int zx29_rst_status(struct reset_controller_dev *rcdev, unsigned =
long id)
> +{
> +	struct zte_reset *rst =3D to_zte_reset(rcdev);
> +	int res;
> +
> +	res =3D regmap_test_bits(rst->map, rst->resets[id].reg, rst->resets[id]=
.mask);

The correct thing to do here would be to only check the reset bit.

This happens to work anyway because we always set reset and isolation
bits together, but maybe this warrants a comment.

I assume the registers just read back the value that was set.

> +	if (res < 0)
> +		return res;
> +
> +	return !res;
> +}
> +
[...]
> +static int reset_zx297520v3_common_probe(struct device *dev,
> +					 struct device_node *of_node,
> +					 const struct zte_reset_info *drv_info)
> +{
> +	struct zte_reset *rst;
> +
> +	rst =3D devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
> +	if (!rst)
> +		return -ENOMEM;
> +
> +	rst->resets =3D drv_info->resets;
> +	rst->rcdev.owner =3D THIS_MODULE;
> +	rst->rcdev.nr_resets =3D drv_info->num;
> +	rst->rcdev.ops =3D &zx29_rst_ops;
> +	rst->rcdev.of_node =3D of_node;
> +	rst->rcdev.dev =3D dev;
> +
> +	rst->map =3D device_node_to_regmap(of_node);
> +	if (IS_ERR(rst->map))
> +		return dev_err_probe(dev, PTR_ERR(rst->map), "Cannot get parent syscon=
 regmap\n");
> +
> +	return devm_reset_controller_register(dev, &rst->rcdev);
> +

Unnecessary blank line.

> +}
> +
> +static int reset_zx297520v3_aux_probe(struct auxiliary_device *adev,
> +				      const struct auxiliary_device_id *id)
> +{
> +	return reset_zx297520v3_common_probe(&adev->dev, adev->dev.of_node,
> +					     (const struct zte_reset_info *)id->driver_data);
> +}
> +
> +static int reset_zx297520v3_top_probe(struct platform_device *pdev)
> +{
> +	return reset_zx297520v3_common_probe(&pdev->dev, pdev->dev.parent->of_n=
ode,
> +					     &zx297520v3_top_info);
> +}
> +
> +static struct platform_driver reset_zx297520v3_top =3D {
> +	.probe =3D reset_zx297520v3_top_probe,
> +	.driver =3D {
> +		.name =3D "zx297520v3-toprst",
> +	},
> +};
> +
> +static int reset_zx297520v3_matrix_probe(struct platform_device *pdev)
> +{
> +	return reset_zx297520v3_common_probe(&pdev->dev, pdev->dev.parent->of_n=
ode,
> +					     &zx297520v3_matrix_info);
> +}
> +
> +static struct platform_driver reset_zx297520v3_matrix =3D {
> +	.probe =3D reset_zx297520v3_matrix_probe,
> +	.driver =3D {
> +		.name =3D "zx297520v3-matrixrst",
> +	},
> +};
> +
> +static const struct auxiliary_device_id reset_zx297520v3_ids[] =3D {
> +	{
> +		.name =3D "clk_zte.zx297520v3_lsprst",
> +		.driver_data =3D (kernel_ulong_t)&zx297520v3_lsp_info,
> +	},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(auxiliary, reset_zx297520v3_ids);
> +
> +static struct auxiliary_driver reset_zx297520v3_auxdrv =3D {
> +	.name =3D "zx297520v3_lsp_reset",
> +	.id_table =3D reset_zx297520v3_ids,
> +	.probe =3D reset_zx297520v3_aux_probe,
> +};
> +
> +static struct platform_driver * const reset_zx297520v3_mfddrv[] =3D {
> +	&reset_zx297520v3_top,
> +	&reset_zx297520v3_matrix,
> +};
> +
> +static int __init reset_zx297520v3_init(void)
> +{
> +	int res;
> +
> +	res =3D auxiliary_driver_register(&reset_zx297520v3_auxdrv);
> +	if (res)
> +		return res;
> +
> +	res =3D platform_register_drivers(reset_zx297520v3_mfddrv,
> +					ARRAY_SIZE(reset_zx297520v3_mfddrv));
> +	if (res)
> +		auxiliary_driver_unregister(&reset_zx297520v3_auxdrv);
> +
> +	return res;
> +}
> +
> +static void __exit reset_zx297520v3_exit(void)
> +{
> +	platform_unregister_drivers(reset_zx297520v3_mfddrv,
> +				    ARRAY_SIZE(reset_zx297520v3_mfddrv));
> +	auxiliary_driver_unregister(&reset_zx297520v3_auxdrv);
> +}
> +
> +module_init(reset_zx297520v3_init);
> +module_exit(reset_zx297520v3_exit);

That's too much boilerplate given I don't understand the benefit of
using platform_device for top/matrix resets yet.

regards
Philipp

