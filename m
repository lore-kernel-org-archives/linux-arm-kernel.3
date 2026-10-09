Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C66CA601D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 15:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ooYYuk1Cy4x+W8huu6O7UYsT7otaLLBYI4dQg9LYTtk=; b=gr5AlqHtBIBBfn6ppxJ8HSK1TN
	nZ2fk6dQbqX5seX7WZJEsceJcsNAYpcBW0yyQs8L6OX5f8HFWjyOPQSjN8aNFTlATsBJ+KFJrTp8L
	qqlNQEqWRbrR5aMf8el/qK9ScDJHeVq3GElDen0PHXhyaJ1Fqv6aQigMXeo85N71sJJUZEgBgsqYZ
	luA2VqoiGQJxBl6VEsXgKbr8LB9u/jvjld/Iz4+XHlQnz1LolEovy4Vezk6Ed9xXdgXINwDpFV+Fc
	jtGSV6BV8EGWoHYq5H8UoWZT9pCpE0fRySYbWha6c2lJ1tKYFJL0G9kbIQECWmlfvxaiptyJvNjFm
	ZjCYN4Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFCXw-00000006Wy9-1nPA;
	Fri, 09 Oct 2026 15:30:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFCXu-00000006Wxd-3BoW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 15:30:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DEC0A60098;
	Fri,  9 Oct 2026 15:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286931F00893;
	Fri,  9 Oct 2026 15:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791559805;
	bh=ooYYuk1Cy4x+W8huu6O7UYsT7otaLLBYI4dQg9LYTtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O/fhp2PoLqu3C4wVKPpP56enw6aXaDmI5AT+evyiXKdFAbbW0QMTn2RBwiFX+H++h
	 fPVx1+XxoW4xvcfLXjNEcMIOrVvvVrKkxRhPG1hb0Po0SnDnVNc3BoyIYrXmNTPpKW
	 0DQrrkTWowVk0MwnfI3B95jchRgX+hOgbW/dIGRe1FYcLEs4qfVBK4jzKwnBXi/sXA
	 iamxUMLjrvR9jifPvR49+DTthL2LerWNTdGR449AqHKURTyjOub7I0H20gWN6jWd5o
	 gBsfKfxJvt2Caof0aItD68krwlclaY/O5FZi7j0dW6AzKgt8sIBwMm5KaoiawJnmZq
	 nAkOEf2+tVMKw==
Date: Fri, 9 Oct 2026 16:29:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] dmaengine: arm-dma350: Add CIX Sky1 integration
 support
Message-ID: <20261009-9c6b706f0d1a46183205dd08@squawk>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-6-Jelly.Jia@cixtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VwPst8/3K+MyQlA1"
Content-Disposition: inline
In-Reply-To: <20261009051846.1115962-6-Jelly.Jia@cixtech.com>
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

--VwPst8/3K+MyQlA1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 09, 2026 at 01:18:45PM +0800, Jelly Jia wrote:
> The CIX Sky1 SoC integrates DMA-350 controllers whose DMA masters see
> peripheral resources at different addresses than the CPU, and whose
> channel interrupts are gated by a subsystem register block before they
> reach the AP interrupt controller.
>=20
> Add match data for the "cix,sky1-dma350" compatible, describing the
> interrupt routing register, and use it to bring the controller up:
> enable the clock, reset the controller, and route the channel
> interrupts through the register block. Routing is redone after system
> resume because that block may lose its state.
>=20
> The address translation is described in the device tree, not in the
> driver: a bus node wrapping the controller carries the dma-ranges of
> the integration, the OF core builds dev->dma_range_map from them, and
> the DMA API applies the translation to both buffers and resources, so
> slave resources are mapped with dma_map_resource() like on any other
> device. Integrations without such a bus node keep the identity mapping.
>=20
> The controller may also be attached to a reserved memory region, for
> integrations whose DMA master cannot reach all of system memory.
>=20
> Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---
> v1 -> v2:
> - Merged the Sky1 integration into arm-dma350.c: the SoC resources are
>   managed by the DMA-350 driver itself, matched through the
>   "cix,sky1-dma350" compatible.
> - Slave resources are mapped with dma_map_resource() and translated by
>   the standard DMA API through the dma-ranges of the parent bus node.
> - Dropped drivers/dma/cix-sky1-dma350.c and its MAINTAINERS entry.
> - ARM_DMA350 now selects MFD_SYSCON for the interrupt router syscon.
>  drivers/dma/Kconfig      |  4 ++
>  drivers/dma/arm-dma350.c | 92 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 96 insertions(+)
>=20
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index ae6a682c9f76..efa6d280bb36 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -97,9 +97,13 @@ config ARM_DMA350
>  	depends on ARM || ARM64 || COMPILE_TEST
>  	select DMA_ENGINE
>  	select DMA_VIRTUAL_CHANNELS
> +	select MFD_SYSCON
>  	help
>  	  Enable support for the Arm DMA-350 controller.
> =20
> +	  Some integrations need to poke a syscon to route the channel
> +	  interrupts, so MFD_SYSCON is selected here.
> +
>  config AT_HDMAC
>  	tristate "Atmel AHB DMA support"
>  	depends on ARCH_AT91 || COMPILE_TEST
> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> index e3fbfcce66e8..e443a9c3189b 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c
> @@ -4,14 +4,21 @@
> =20
>  #include <linux/bitfield.h>
>  #include <linux/bitops.h>
> +#include <linux/clk.h>
>  #include <linux/dmaengine.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/of.h>
>  #include <linux/of_dma.h>
> +#include <linux/of_reserved_mem.h>
>  #include <linux/module.h>
>  #include <linux/overflow.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
> =20
> @@ -158,6 +165,9 @@
> =20
>  #define D350_SLAVE_CMD_WORDS	14
> =20
> +#define SKY1_DMA350_CRU_DMAC_AP_IRQ	0x54
> +#define SKY1_DMA350_IRQ_ROUTE_MASK	0xff
> +
>  enum ch_ctrl_donetype {
>  	CH_CTRL_DONETYPE_NONE =3D 0,
>  	CH_CTRL_DONETYPE_CMD =3D 1,
> @@ -222,6 +232,13 @@ struct d350_chan_map {
>  	bool needs_unmap;
>  };
> =20
> +struct d350;
> +
> +struct d350_data {
> +	u32 irq_route_reg;
> +	u32 irq_route_mask;

Since this is a fixed value, there's little point having it as part of
your match data. Ditto the reg value, for the same reason. The user is
called directly from your probe code, so you can use the defines
directly.

That said, should you actually be doing this from here? It feels like
a bit of a problem with abstractions where you're fiddling with another
device. Syscon stuff is okay when you're changing something internal to
your device's functionality or something "downstream" of your device -
between you and the output pins. But this is something "upstream" of our
device and I dunno if this is the right way to do it. If you need to set
some sort of interrupt routing, should you actually do something like
microchip,mpfs-irqmux or renesas,rzn1-gpioirqmux and preserve the
abstraction/separation between devices?

Cheers,
Conor.

> +};
> +
>  struct d350_chan {
>  	struct virt_dma_chan vc;
>  	struct d350_desc *desc;
> @@ -241,6 +258,8 @@ struct d350_chan {
> =20
>  struct d350 {
>  	struct dma_device dma;
> +	const struct d350_data *data;
> +	struct regmap *irq_router;
>  	int nchan;
>  	int nreq;
>  	struct d350_chan channels[] __counted_by(nchan);
> @@ -256,6 +275,16 @@ static inline struct d350_desc *to_d350_desc(struct =
virt_dma_desc *vd)
>  	return container_of(vd, struct d350_desc, vd);
>  }
> =20
> +static int d350_route_irqs(struct d350 *dmac)
> +{
> +	if (!dmac->irq_router)
> +		return 0;
> +
> +	return regmap_update_bits(dmac->irq_router, dmac->data->irq_route_reg,
> +				  dmac->data->irq_route_mask,
> +				  dmac->data->irq_route_mask);
> +}
> +
>  static void d350_free_cmds(struct device *dev, struct d350_desc *desc)
>  {
>  	if (desc->cmds) {
> @@ -1089,12 +1118,40 @@ static void d350_free_chan_resources(struct dma_c=
han *chan)
>  static int d350_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> +	const struct d350_data *data =3D device_get_match_data(dev);
> +	struct reset_control *reset;
> +	struct regmap *irq_router =3D NULL;
> +	struct clk *clk;
>  	struct d350 *dmac;
>  	void __iomem *base;
>  	u32 reg;
>  	int ret, nchan, dw, aw, r, p;
>  	bool coherent, memset;
> =20
> +	clk =3D devm_clk_get_optional_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "failed to enable clock\n");
> +
> +	reset =3D devm_reset_control_get_optional_exclusive(dev, NULL);
> +	if (IS_ERR(reset))
> +		return dev_err_probe(dev, PTR_ERR(reset),
> +				     "failed to get reset\n");
> +
> +	if (data && data->irq_route_mask &&
> +	    of_property_present(dev->of_node, "cix,irq-router")) {
> +		irq_router =3D
> +			syscon_regmap_lookup_by_phandle(dev->of_node,
> +							"cix,irq-router");
> +		if (IS_ERR(irq_router))
> +			return dev_err_probe(dev, PTR_ERR(irq_router),
> +					     "failed to get IRQ router\n");
> +	}
> +
> +	ret =3D reset_control_reset(reset);
> +	if (ret)
> +		return ret;
> +
>  	base =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
> @@ -1118,8 +1175,14 @@ static int d350_probe(struct platform_device *pdev)
>  	if (!dmac)
>  		return -ENOMEM;
> =20
> +	dmac->data =3D data;
> +	dmac->irq_router =3D irq_router;
>  	dmac->nchan =3D nchan;
> =20
> +	ret =3D d350_route_irqs(dmac);
> +	if (ret)
> +		return ret;
> +
>  	reg =3D readl_relaxed(base + DMAINFO + DMA_BUILDCFG1);
>  	dmac->nreq =3D FIELD_GET(DMA_CFG_NUM_TRIGGER_IN, reg);
> =20
> @@ -1201,6 +1264,13 @@ static int d350_probe(struct platform_device *pdev)
>  		dmac->dma.device_prep_dma_memset =3D d350_prep_memset;
>  	}
> =20
> +	if (of_property_present(dev->of_node, "memory-region")) {
> +		ret =3D of_reserved_mem_device_init(dev);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to attach reserved memory\n");
> +	}
> +
>  	platform_set_drvdata(pdev, dmac);
> =20
>  	ret =3D dma_async_device_register(&dmac->dma);
> @@ -1223,9 +1293,30 @@ static void d350_remove(struct platform_device *pd=
ev)
> =20
>  	of_dma_controller_free(pdev->dev.of_node);
>  	dma_async_device_unregister(&dmac->dma);
> +	of_reserved_mem_device_release(&pdev->dev);
> +}
> +
> +static int __maybe_unused d350_resume_noirq(struct device *dev)
> +{
> +	struct d350 *dmac =3D dev_get_drvdata(dev);
> +
> +	if (!dmac)
> +		return 0;
> +
> +	return d350_route_irqs(dmac);
>  }
> =20
> +static const struct dev_pm_ops d350_pm =3D {
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(NULL, d350_resume_noirq)
> +};
> +
> +static const struct d350_data d350_sky1_data =3D {
> +	.irq_route_reg =3D SKY1_DMA350_CRU_DMAC_AP_IRQ,
> +	.irq_route_mask =3D SKY1_DMA350_IRQ_ROUTE_MASK,
> +};
> +
>  static const struct of_device_id d350_of_match[] __maybe_unused =3D {
> +	{ .compatible =3D "cix,sky1-dma350", .data =3D &d350_sky1_data },
>  	{ .compatible =3D "arm,dma-350" },
>  	{}
>  };
> @@ -1235,6 +1326,7 @@ static struct platform_driver d350_driver =3D {
>  	.driver =3D {
>  		.name =3D "arm-dma350",
>  		.of_match_table =3D of_match_ptr(d350_of_match),
> +		.pm =3D pm_sleep_ptr(&d350_pm),
>  	},
>  	.probe =3D d350_probe,
>  	.remove =3D d350_remove,
> --=20
> 2.54.0
>=20

--VwPst8/3K+MyQlA1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaskIdQAKCRB4tDGHoIJi
0r7sAP9M+VO4g4x2/yu88IbmEjE4Ju1MtashQbBxdSJRuiN4UQD9FGJTCm0kEyWZ
a5TyZPXwo5ZRmeg0TbpLWTOCR5claA0=
=dSs+
-----END PGP SIGNATURE-----

--VwPst8/3K+MyQlA1--

