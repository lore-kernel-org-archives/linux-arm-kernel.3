Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD7AC369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 15:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RtU5Zjo1XDHI0E92ehgSzdN2gbNG+8MMfQ6wSnWdlaA=; b=K79l5lVICAqD247M+6TNpDkPZP
	QQKM9dJPEe+PKvpPuBWP5Xa1uqdD4KW1+mETZ5dt8ChIWeS9YgMG1s7KSojdqebOj1DVLshBEglKC
	VIVaInvb3kRXQQut6IRRSyUxxNYGNEh0on72ptWEcllm1VNpghp6hKowX0dwOTI0rI8trvdmtGkbp
	LqWKdMgycf4lQbzYFDt8ccC9uJQZLLurm2TRWXc8GnJkBhojXzVas9Kp4FiyVtNcOpfCrJVHHb1Sr
	V+Pqc2179Ikc76g4TFrvg2KlXuYjCDQABwckKeROYGfRX28ZyVCKSmRHeTB0I5EcHmukcVH9W6AkY
	m8p9iIAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54ms-0000000A67r-0ECF;
	Wed, 16 Apr 2025 15:34:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54Fq-00000009zFy-2ziF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 15:00:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE0EE1595;
	Wed, 16 Apr 2025 08:00:43 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D0273F66E;
	Wed, 16 Apr 2025 08:00:42 -0700 (PDT)
Date: Wed, 16 Apr 2025 16:00:40 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland
 <samuel@sholland.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Boris Brezillon <boris.brezillon@collabora.com>, Steven
 Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/5] pmdomain: sunxi: add H6 PRCM PPU driver
Message-ID: <20250416160040.67d80a76@donnerap.manchester.arm.com>
In-Reply-To: <4987742.31r3eYUQgx@jernej-laptop>
References: <20250221005802.11001-1-andre.przywara@arm.com>
	<20250221005802.11001-3-andre.przywara@arm.com>
	<4987742.31r3eYUQgx@jernej-laptop>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_080046_848714_B3BE0977 
X-CRM114-Status: GOOD (  43.50  )
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

On Fri, 21 Feb 2025 19:10:33 +0100
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

> Dne petek, 21. februar 2025 ob 01:57:59 Srednjeevropski standardni =C4=8D=
as je Andre Przywara napisal(a):
> > The Allwinner Power Reset Clock Management (RPCM) block contains a few
> > bits that control some power domains. The most prominent one is the one
> > for the Mali GPU. On the Allwinner H6 this domain is enabled at reset, =
so
> > we didn't care about it so far, but the H616 defaults to it being disab=
led.
> >=20
> > Add a power domain driver for those bits. Some BSP code snippets and
> > some spare documentation describe three bits, slightly different between
> > the H6 and H616, so add three power domains for each SoC, connected to
> > their compatible string.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  drivers/pmdomain/sunxi/Kconfig              |  10 +
> >  drivers/pmdomain/sunxi/Makefile             |   1 +
> >  drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c | 191 ++++++++++++++++++++
> >  3 files changed, 202 insertions(+)
> >  create mode 100644 drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c
> >=20
> > diff --git a/drivers/pmdomain/sunxi/Kconfig b/drivers/pmdomain/sunxi/Kc=
onfig
> > index 17781bf8d86d7..43eecb3ea9819 100644
> > --- a/drivers/pmdomain/sunxi/Kconfig
> > +++ b/drivers/pmdomain/sunxi/Kconfig
> > @@ -8,3 +8,13 @@ config SUN20I_PPU
> >  	help
> >  	  Say y to enable the PPU power domain driver. This saves power
> >  	  when certain peripherals, such as the video engine, are idle.
> > +
> > +config SUN50I_H6_PRCM_PPU
> > +	tristate "Allwinner H6 PRCM power domain driver"
> > +	depends on ARCH_SUNXI || COMPILE_TEST
> > +	depends on PM
> > +	select PM_GENERIC_DOMAINS
> > +	help
> > +	  Say y to enable the Allwinner H6/H616 PRCM power domain driver.
> > +	  This is required to enable the Mali GPU in the H616 SoC, it is
> > +	  optional for the H6.
> > diff --git a/drivers/pmdomain/sunxi/Makefile b/drivers/pmdomain/sunxi/M=
akefile
> > index ec1d7a2fb21db..c1343e1237599 100644
> > --- a/drivers/pmdomain/sunxi/Makefile
> > +++ b/drivers/pmdomain/sunxi/Makefile
> > @@ -1,2 +1,3 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  obj-$(CONFIG_SUN20I_PPU)		+=3D sun20i-ppu.o
> > +obj-$(CONFIG_SUN50I_H6_PRCM_PPU)	+=3D sun50i-h6-prcm-ppu.o
> > diff --git a/drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c b/drivers/pmdo=
main/sunxi/sun50i-h6-prcm-ppu.c
> > new file mode 100644
> > index 0000000000000..1c6b0c78b222d
> > --- /dev/null
> > +++ b/drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c
> > @@ -0,0 +1,191 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) Arm Ltd. 2024
> > + *
> > + * Allwinner H6/H616 PRCM power domain driver.
> > + * This covers a few registers inside the PRCM (Power Reset Clock Mana=
gement)
> > + * block that control some power rails, most prominently for the Mali =
GPU.
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/clk.h>
> > +#include <linux/io.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_domain.h>
> > +#include <linux/reset.h>
> > +
> > +/*
> > + * The PRCM block covers multiple devices, starting with some clocks,
> > + * then followed by the power rails.
> > + * The clocks are covered by a different driver, so this driver's MMIO=
 range
> > + * starts later in the PRCM MMIO frame, not at the beginning of it.
> > + * To keep the register offsets consistent with other PRCM documentati=
on,
> > + * express the registers relative to the beginning of the whole PRCM, =
and
> > + * subtract the PPU offset this driver is bound to.
> > + */
> > +#define PD_H6_PPU_OFFSET		0x250
> > +#define PD_H6_VDD_SYS_REG		0x250
> > +#define PD_H616_ANA_VDD_GATE			BIT(4)
> > +#define PD_H6_CPUS_VDD_GATE			BIT(3)
> > +#define PD_H6_AVCC_VDD_GATE			BIT(2)
> > +#define PD_H6_GPU_REG			0x254
> > +#define PD_H6_GPU_GATE				BIT(0)
> > +
> > +struct sun50i_h6_ppu_pd {
> > +	struct generic_pm_domain	genpd;
> > +	void __iomem			*reg;
> > +	u32				gate_mask;
> > +	bool				negated;
> > +};
> > +
> > +#define FLAG_PPU_ALWAYS_ON	BIT(0)
> > +#define FLAG_PPU_NEGATED	BIT(1)
> > +
> > +struct sun50i_h6_ppu_desc {
> > +	const char *name;
> > +	u32 offset;
> > +	u32 mask;
> > +	unsigned int flags;
> > +};
> > +
> > +struct sun50i_h6_ppu_desc sun50i_h6_ppus[] =3D {
> > +	{ "AVCC", PD_H6_VDD_SYS_REG, PD_H6_AVCC_VDD_GATE },
> > +	{ "CPUS", PD_H6_VDD_SYS_REG, PD_H6_CPUS_VDD_GATE },
> > +	{ "GPU", PD_H6_GPU_REG, PD_H6_GPU_GATE },
> > +	{}
> > +};
> > +
> > +struct sun50i_h6_ppu_desc sun50i_h616_ppus[] =3D {
> > +	{ "PLL", PD_H6_VDD_SYS_REG, PD_H6_AVCC_VDD_GATE,
> > +		FLAG_PPU_ALWAYS_ON | FLAG_PPU_NEGATED },
> > +	{ "ANA", PD_H6_VDD_SYS_REG, PD_H616_ANA_VDD_GATE, FLAG_PPU_ALWAYS_ON =
},
> > +	{ "GPU", PD_H6_GPU_REG, PD_H6_GPU_GATE, FLAG_PPU_NEGATED },
> > +	{}
> > +};
> > +#define to_sun50i_h6_ppu_pd(_genpd) \
> > +	container_of(_genpd, struct sun50i_h6_ppu_pd, genpd)
> > +
> > +static bool sun50i_h6_ppu_power_status(const struct sun50i_h6_ppu_pd *=
pd)
> > +{
> > +	bool bit =3D readl(pd->reg) & pd->gate_mask;
> > +
> > +	return bit ^ pd->negated;
> > +}
> > +
> > +static int sun50i_h6_ppu_pd_set_power(const struct sun50i_h6_ppu_pd *p=
d,
> > +				      bool set_bit)
> > +{
> > +	u32 reg =3D readl(pd->reg);
> > +
> > +	if (set_bit)
> > +		writel(reg | pd->gate_mask, pd->reg);
> > +	else
> > +		writel(reg & ~pd->gate_mask, pd->reg);
> > +
> > +	return 0;
> > +}
> > +
> > +static int sun50i_h6_ppu_pd_power_on(struct generic_pm_domain *genpd)
> > +{
> > +	const struct sun50i_h6_ppu_pd *pd =3D to_sun50i_h6_ppu_pd(genpd);
> > +
> > +	return sun50i_h6_ppu_pd_set_power(pd, !pd->negated);
> > +}
> > +
> > +static int sun50i_h6_ppu_pd_power_off(struct generic_pm_domain *genpd)
> > +{
> > +	const struct sun50i_h6_ppu_pd *pd =3D to_sun50i_h6_ppu_pd(genpd);
> > +
> > +	return sun50i_h6_ppu_pd_set_power(pd, pd->negated);
> > +}
> > +
> > +static int sun50i_h6_ppu_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev =3D &pdev->dev;
> > +	struct genpd_onecell_data *ppu;
> > +	struct sun50i_h6_ppu_pd *pds;
> > +	const struct sun50i_h6_ppu_desc *desc;
> > +	void __iomem *base;
> > +	int ret, i, count;
> > +
> > +	desc =3D of_device_get_match_data(dev);
> > +	if (!desc)
> > +		return -EINVAL;
> > +
> > +	for (count =3D 0; desc[count].name; count++)
> > +		;
> > +
> > +	pds =3D devm_kcalloc(dev, count, sizeof(*pds), GFP_KERNEL);
> > +	if (!pds)
> > +		return -ENOMEM;
> > +
> > +	ppu =3D devm_kzalloc(dev, sizeof(*ppu), GFP_KERNEL);
> > +	if (!ppu)
> > +		return -ENOMEM;
> > +
> > +	ppu->num_domains =3D count;
> > +	ppu->domains =3D devm_kcalloc(dev, count, sizeof(*ppu->domains),
> > +				    GFP_KERNEL);
> > +	if (!ppu->domains)
> > +		return -ENOMEM;
> > +
> > +	platform_set_drvdata(pdev, ppu);
> > +
> > +	base =3D devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(base))
> > +		return PTR_ERR(base);
> > +
> > +	for (i =3D 0; i < count; i++) {
> > +		struct sun50i_h6_ppu_pd *pd =3D &pds[i];
> > +
> > +		pd->genpd.name		=3D desc[i].name;
> > +		pd->genpd.power_off	=3D sun50i_h6_ppu_pd_power_off;
> > +		pd->genpd.power_on	=3D sun50i_h6_ppu_pd_power_on;
> > +		if (desc[i].flags & FLAG_PPU_ALWAYS_ON)
> > +			pd->genpd.flags =3D GENPD_FLAG_ALWAYS_ON;
> > +		pd->negated		=3D !!(desc[i].flags & FLAG_PPU_NEGATED);
> > +		pd->reg			=3D base + desc[i].offset - PD_H6_PPU_OFFSET;
> > +		pd->gate_mask		=3D desc[i].mask;
> > +
> > +		ret =3D pm_genpd_init(&pd->genpd, NULL,
> > +				    !sun50i_h6_ppu_power_status(pd));
> > +		if (ret) {
> > +			dev_warn(dev, "Failed to add GPU power domain: %d\n", ret); =20
>=20
> I suppose you want to replace "GPU" with desc[i].name.

Ah yeah, good point, fixed that.

> Otherwise it looks good to me, but I'd like to hear a comment from genpd =
maintainers.

Thanks!

Cheers,
Andre

> Best regards,
> Jernej
>=20
> > +			return ret;
> > +		}
> > +		ppu->domains[i] =3D &pd->genpd;
> > +	}
> > +
> > +	ret =3D of_genpd_add_provider_onecell(dev->of_node, ppu);
> > +	if (ret)
> > +		dev_warn(dev, "Failed to add provider: %d\n", ret);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id sun50i_h6_ppu_of_match[] =3D {
> > +	{ .compatible	=3D "allwinner,sun50i-h6-prcm-ppu",
> > +	  .data		=3D &sun50i_h6_ppus },
> > +	{ .compatible	=3D "allwinner,sun50i-h616-prcm-ppu",
> > +	  .data		=3D &sun50i_h616_ppus },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, sun50i_h6_ppu_of_match);
> > +
> > +static struct platform_driver sun50i_h6_ppu_driver =3D {
> > +	.probe	=3D sun50i_h6_ppu_probe,
> > +	.driver	=3D {
> > +		.name			=3D "sun50i-h6-prcm-ppu",
> > +		.of_match_table		=3D sun50i_h6_ppu_of_match,
> > +		/* Power domains cannot be removed while they are in use. */
> > +		.suppress_bind_attrs	=3D true,
> > +	},
> > +};
> > +module_platform_driver(sun50i_h6_ppu_driver);
> > +
> > +MODULE_AUTHOR("Andre Przywara <andre.przywara@arm.com>");
> > +MODULE_DESCRIPTION("Allwinner H6 PRCM power domain driver");
> > +MODULE_LICENSE("GPL");
> >  =20
>=20
>=20
>=20
>=20


