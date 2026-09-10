Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498EDC79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 16:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abN892M86SWlDHDkn1guF+xG2c2z24Du1nGa9KhofNc=; b=nW+/+qcg8BbgtU4aJf0IUjr+XK
	zKyVBtOv5YXPQo9smiw8ZInSUR12qyn0pDpDfGBwatx+PWLVXi+nVbV/dipuFRsfb3tg9y1Qpxo3x
	JFsuAblMnuLkEmKhnbEcE4UFlnGIWo2dS/MC3Tzr/wDmXvW97xIUKzyPtzO098YL6QDGlfzVNgDf6
	b9iIx4GNg7OhWMvGxC1HnR23FXGVJNH7XYoZIIto4OrOP/qzQCZGKeFtOVYHG/1aJLBCrS/3QO9rx
	+WClndG84DuO7aXEvRzOFGl1iU8Tw1wXq/xrMgZH6tplgP8+9NPQnGv+ZfFd9MmJqwioa+xjXVzfh
	fAwaIFww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4hSi-0000000EvA4-3CCI;
	Thu, 10 Sep 2026 16:17:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4hSh-0000000Ev9q-4B2f;
	Thu, 10 Sep 2026 16:17:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 797EF406B1;
	Thu, 10 Sep 2026 16:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE8161F000FF;
	Thu, 10 Sep 2026 16:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789057039;
	bh=abN892M86SWlDHDkn1guF+xG2c2z24Du1nGa9KhofNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LBfDH8lquxDvIIKt4ERMRSWgHONZ44EYryKs83s2LrSoVgO4ZZV7AA0rxYNqDhBZE
	 4CdhaXYUaOLJs4scG43ilsudG06LfMgizl4wszJz3OSfZUMpmOdy+baDHh9SByPVC3
	 SEgPnVjGbAJhhkDX9DFrMDNzQQt6OKQk19LbFS9XY/MJAksHn9Tp0l2ttWw75W8DjH
	 KN5wb+WF96fbJd7ZMZOmRXJEzIdgIkV/pz1qbRWl5pj2pOiFY9rsvDlNohef4tAnXo
	 sAGeS+oIM0A0q7CQQflFi/BMruDSuozXaUay5MLYEdxSiR+LZY4S37HQTm/iivuKf0
	 0SuWr/9xnp8EA==
Date: Thu, 10 Sep 2026 17:17:11 +0100
From: Lee Jones <lee@kernel.org>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	mfd@lists.linux.dev
Subject: Re: [PATCH v11 05/12] mfd: zx297520v3: Add a clock and reset MFD
 driver
Message-ID: <20260910161711.GK1051768@google.com>
References: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
 <20260826-zx29clk-v11-5-f8ad59c6426c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260826-zx29clk-v11-5-f8ad59c6426c@gmail.com>
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

On Wed, 26 Aug 2026, Stefan Dösinger wrote:

> This driver registers child devices for the zx297520v3 clock and reset
> controllers. The clk-zx297520v3 and reset-zte-zx297520v3 submitted in
> the next patches will drive the respective functionalities.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
> 
> ---
> 
> Changes v10 (All Lee Jones):
> *) drop "select REGMAP_MMIO"
> *) Drop comment about unimplemented hwlocks
> *) Use MFD_CELL_[NAME|OF]
> *) Renamed the device type enum and its values
> *) Use device_get_match_data instead of the of_ variant
> *) Improved debug messages
> 
> Changes v9:
> Deassert the LSP reset and enable the LSP pclk here. In practice the
> boot rom needs to do that because it prints to an LSP-connected UART and
> reads the boot policy from the LSP connected flash chip.
> 
> In doing so, I migrated the match data to an enum as mfd.md suggests.
> 
> Changes v8:
> *) Remove .of_compatible from PHY mfd child
> 
> *) Move to drivers/mfd (Sashiko)
> 
> For me either soc/zte or mfd/ is fine. Note though that this MFD parent
> is very specific to the zx297520v3 SoC. I don't expect this to be reused
> anywhere else. There are two more MFD-ish devices in there: soc_sys at
> 0x140000, which I plan to handle in the same driver, and an i2c PMIC,
> which would get its own host driver.

If you use of_platform_populate() there is no issue with this living in soc/.

You cannot use the MFD API outside of drivers/mfd though.

> *) Use PLATFORM_DEVID_AUTO (Sashiko). NONE was intentional as I only
> ever expect one instance, but I don't see any harm in doing the standard
> thing and use AUTO
> 
> *) On the suggestion not to put the link to mfd_cells[] into match data:
> I see that it is spelled out in Sashiko's mfd.md, written by Lee Jones,
> the MFD maintainer. I would appreciate some education on the rationale
> behind it: Putting a pointer into the void *data is a common pattern in
> the kernel. I don't understand in which situation this can possibly
> break?

It's not about things breaking.  This is related to the hackery that
follows.  It was easier to make a rule that says "no interrelationships
between initialisation APIs; ACPI, DT, MFD, etc" than to deal with the
fallout.  Keep DT and MFD out of each other's structures please.

> Both structs are static const in the same compilation unit. data is a
> const void *, not a uintptr_t or kernel_ulong_t, so it seems passing a
> pointer is the intended use. What am I missing?
> 
> Changes v7:
> Add phy MFD child
> 
> Changes v6: Make the ZTE SoC driver section depend on HAS_IOMEM
> (Sashiko). The entire MFD section, which contains MFD_CORE, depends on
> HAS_IOMEM even with COMPILE_TEST.
> 
> Add a NULL ptr check for of_device_get_match_data (Sashiko). While not
> uniform, rave-sp, rohm-bd9576, atc260x, da9052-i2c protect against
> incorrect manual attachment that way.
> 
> Add lspclk here as well in an attempt to satisfy both Conor Dooley, who
> asks for MFD for top and matrix, and Philipp Zabel, who prefers aux but
> at least wants the reset driver limited to one driver type.
> 
> Changes v5: Use MFD instead of Aux bus for top and matrix crm because of
> extra functionality: Reboot in top, hwlock in Matrix.
> 
> LSP clocks stay with the aux bus and are thus not handled in this
> driver. The clk driver will bind directly to the lspcrm node.
> ---
>  MAINTAINERS                      |   1 +
>  drivers/mfd/Kconfig              |  12 +++++
>  drivers/mfd/Makefile             |   2 +
>  drivers/mfd/zte-zx297520v3-crm.c | 101 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 116 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index acec8c1e0fc9..717ed9439d91 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3906,6 +3906,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
>  F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
>  F:	arch/arm/boot/dts/zte/
>  F:	arch/arm/mach-zte/
> +F:	drivers/mfd/zte-zx297520v3-crm.c
>  F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
>  F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
>  F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index e4fd4572472f..ef9d96484bc5 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2578,5 +2578,17 @@ config MFD_MAX7360
>  	  additional drivers must be enabled in order to use the functionality
>  	  of the device.
>  
> +config MFD_ZTE_ZX297520V3_CRM
> +	tristate "ZTE zx297520v3 Clock and Reset Manager"
> +	depends on ARCH_ZTE || COMPILE_TEST
> +	select MFD_CORE
> +	default SOC_ZX297520V3
> +	help
> +	  Say yes here to enable the driver for the ZTE zx297520v3 clock and
> +	  reset manager MFD driver. This driver provides the host device for
> +	  the clock and reset drivers and is required to boot the SoC. You
> +	  will also need to enable CLK_ZTE_ZX297520V3 and RESET_ZTE_ZX297520V3
> +	  to build the actual clock and reset child drivers.
> +
>  endmenu
>  endif
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 72d3944b0ad8..ab0cba2042a2 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -304,3 +304,5 @@ obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu_spi.o rsmu_core.o
>  obj-$(CONFIG_MFD_UPBOARD_FPGA)	+= upboard-fpga.o
>  
>  obj-$(CONFIG_MFD_LOONGSON_SE)	+= loongson-se.o
> +
> +obj-$(CONFIG_MFD_ZTE_ZX297520V3_CRM)	+= zte-zx297520v3-crm.o
> diff --git a/drivers/mfd/zte-zx297520v3-crm.c b/drivers/mfd/zte-zx297520v3-crm.c
> new file mode 100644
> index 000000000000..b098def47e7b
> --- /dev/null
> +++ b/drivers/mfd/zte-zx297520v3-crm.c
> @@ -0,0 +1,101 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*

What is this thing?  Description please.

> + * Copyright (C) 2026 Stefan Dösinger

Are you sure ZTE are okay with you Copywriting a driver for their IP?

> + */
> +
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/reset.h>
> +
> +enum zx_device_type {
> +	TYPE_INVALID = 0,
> +	TYPE_TOPCRM,
> +	TYPE_MATRIXCRM,
> +	TYPE_LSPCRM,
> +};

What do each of these mean?

Is the nomenclature taken from the datasheet?

If not, can we improve it to make them easier to read for humans?

Failing that, more comments would be helpful.

> +
> +static const struct mfd_cell zx297520v3_topcrm_cells[] = {
> +	MFD_CELL_NAME("zx297520v3-topclk"),
> +	MFD_CELL_NAME("zx297520v3-topreset"),

Why are these works concatenated together like this?

Same with zx_device_type above?

> +	MFD_CELL_OF("reboot", NULL, NULL, 0, 0, "syscon-reboot"),
> +	MFD_CELL_NAME("zx297520v3-usb-phy"),
> +};
> +
> +static const struct mfd_cell zx297520v3_matrixcrm_cells[] = {
> +	MFD_CELL_NAME("zx297520v3-matrixclk"),
> +	MFD_CELL_NAME("zx297520v3-matrixreset"),
> +};
> +
> +static const struct mfd_cell zx297520v3_lspcrm_cells[] = {
> +	MFD_CELL_NAME("zx297520v3-lspclk"),
> +	MFD_CELL_NAME("zx297520v3-lspreset"),
> +};
> +
> +static int zx297520v3_crm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	const struct mfd_cell *cells;
> +	struct reset_control *reset;
> +	enum zx_device_type type;
> +	unsigned int num_cells;
> +	struct clk *pclk;
> +
> +	type = (enum zx_device_type)(kernel_ulong_t)device_get_match_data(dev);
> +	switch (type) {
> +	case TYPE_TOPCRM:
> +		cells = zx297520v3_topcrm_cells;
> +		num_cells = ARRAY_SIZE(zx297520v3_topcrm_cells);
> +		break;
> +
> +	case TYPE_MATRIXCRM:
> +		cells = zx297520v3_matrixcrm_cells;
> +		num_cells = ARRAY_SIZE(zx297520v3_matrixcrm_cells);
> +		break;
> +
> +	case TYPE_LSPCRM:
> +		cells = zx297520v3_lspcrm_cells;
> +		num_cells = ARRAY_SIZE(zx297520v3_lspcrm_cells);
> +
> +		pclk = devm_clk_get_enabled(dev, "pclk");
> +		if (IS_ERR(pclk))
> +			return dev_err_probe(dev, PTR_ERR(pclk), "Could not get 'pclk'\n");
> +
> +		reset = devm_reset_control_get_exclusive_deasserted(dev, NULL);
> +		if (IS_ERR(reset))
> +			return dev_err_probe(dev, PTR_ERR(reset),
> +					     "Failed to deassert reset control\n");
> +		break;
> +
> +	default:
> +		return -ENODEV;
> +	}
> +
> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, cells, num_cells, NULL, 0, NULL);
> +}
> +
> +static const struct of_device_id of_match_zx297520v3_crm[] = {
> +	{ .compatible = "zte,zx297520v3-topcrm", .data = (void *)TYPE_TOPCRM },
> +	{ .compatible = "zte,zx297520v3-matrixcrm", .data = (void *)TYPE_MATRIXCRM },
> +	{ .compatible = "zte,zx297520v3-lspcrm", .data = (void *)TYPE_LSPCRM },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, of_match_zx297520v3_crm);
> +
> +static struct platform_driver zx297520v3_crm = {
> +	.probe = zx297520v3_crm_probe,
> +	.driver = {
> +		.name = "zx297520v3-crm",
> +		.of_match_table = of_match_zx297520v3_crm,
> +	},
> +};
> +module_platform_driver(zx297520v3_crm);
> +
> +MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
> +MODULE_DESCRIPTION("ZTE zx297520v3 CRM host driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.54.0
> 

-- 
Lee Jones

