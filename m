Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9D4C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 13:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MDSrybxRiXLZo7xpuDMnJEHVcp0ujnYiamwQaTaTIs=; b=zREVkBhQZonosGX0q6fOEN50o0
	oxozOuabgAEEKSq9O7udxQNyh++0YROkibWK6hA1hyGdMm++JpJjBMDCHvO58bftqRn9DVCMFiImY
	cWignwHng9FFwZAHJtxOII/B7pWJkHc/wuIdG66JiAhDQsfHH3IK1x/JK8jkb273PRtzawwxcAwId
	0BiF1ZWY3t+XA+30uDWkimsAi0ZKoC61IxAwRXhf3c2GucqY3Y+JtSNfzSMERMeUodCG8jy9rkce3
	HGy9l+9iBjvQaev997qZlAUhy36O0yuOmZJQsjohaS5/saMRyineLQ4MxIP3ZbjZ1ym690Ffxo186
	CPLIKXwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8nX-0000000GG6M-2vI1;
	Wed, 12 Aug 2026 13:15:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8nW-0000000GG5w-1rw1;
	Wed, 12 Aug 2026 13:15:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CDD454050C;
	Wed, 12 Aug 2026 13:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9181F000E9;
	Wed, 12 Aug 2026 13:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786540509;
	bh=7MDSrybxRiXLZo7xpuDMnJEHVcp0ujnYiamwQaTaTIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hfxQh1zZx8aeCxAPv8Y2gC3HJw1t+tW+7Jdh48gx4HKMOF/2n2zpY7W7XT8uaEqZw
	 bV0u2rFKUhIad6Fd3QnVz13bpzLJFLE/SUvDXQcu2/CXtkf3HXBSXcxRcNfkAkAru1
	 YzoFj4g6R/0ThkBHFTKBi9OOOmbNM2HAZrP9dj+FRcV0fb/v1qEdYyBEZmekSAEqtL
	 MDRsQIlIv4IDdvAn3u0ft+34JfjBxeDDOEhP0Z6OcL2N9T6qTylbPqzjTNJkD6cXVm
	 KVQSRnL0oTtiMV5LFPcbCl5l/Zcfhk3Cthrw2+rG5pvHg8lFd3FijN9JSHGcqadMjg
	 i2ZUR8Ag9/wwg==
Date: Wed, 12 Aug 2026 14:15:03 +0100
From: Lee Jones <lee@kernel.org>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	mfd@lists.linux.dev
Subject: Re: [PATCH v10 04/12] mfd: zx297520v3: Add a clock and reset MFD
 driver
Message-ID: <20260812131503.GR1072730@google.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-4-63846490712c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260810-zx29clk-v10-4-63846490712c@gmail.com>
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

On Mon, 10 Aug 2026, Stefan Dösinger wrote:

> This driver registers child devices for the zx297520v3 clock and reset
> controllers. The clk-zx297520v3 and reset-zte-zx297520v3 submitted in
> the next patches will drive the respective functionalities.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
> 
> ---
> 
> What I am still unsure about: How much sense does it make to have this
> module-capable and able to unbind: In practice, the board doesn't work
> without this driver and its clock and reset children.
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
> 
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
> 
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
>  drivers/mfd/Kconfig              |  13 +++++
>  drivers/mfd/Makefile             |   2 +
>  drivers/mfd/zte-zx297520v3-crm.c | 117 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 133 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 61dbe959acf5..d50c03fd5a76 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3909,6 +3909,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
>  F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
>  F:	arch/arm/boot/dts/zte/
>  F:	arch/arm/mach-zte/
> +F:	drivers/mfd/zte-zx297520v3-crm.c
>  F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
>  F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
>  F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index e4fd4572472f..08138713dfc0 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2578,5 +2578,18 @@ config MFD_MAX7360
>  	  additional drivers must be enabled in order to use the functionality
>  	  of the device.
>  
> +config MFD_ZTE_ZX297520V3_CRM
> +	tristate "ZTE zx297520v3 Clock and Reset Manager"
> +	depends on ARCH_ZTE || COMPILE_TEST
> +	select MFD_CORE
> +	select REGMAP_MMIO

Is this used?

>  	default SOC_ZX297520V3
>  	help
>  	  Say yes here to enable the driver for the ZTE zx297520v3 clock and
>  	  reset manager MFD driver. This driver provides the host device for
>  	  the clock and reset drivers and is required to boot the SoC. You
>  	  will also need to enable CLK_ZTE_ZX297520V3 and RESET_ZTE_ZX297520V3
>  	  to build the actual clock and reset child drivers.
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
> index 000000000000..550ce4ad7ec5
> --- /dev/null
> +++ b/drivers/mfd/zte-zx297520v3-crm.c
> @@ -0,0 +1,117 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Stefan Dösinger

Personal copyright, are you sure?

Is that okay with ZTE?

> + */
> +
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +
> +enum zx297520v3_parent_type {
> +	ZX297520V3_INVALID = 0,
> +	ZX297520V3_TOPCRM,
> +	ZX297520V3_MATRIXCRM,
> +	ZX297520V3_LSPCRM,

None of these are readable.  I suggest you improve the nomenclature.

> +};
> +
> +static const struct mfd_cell zx297520v3_topcrm_cells[] = {
> +	{
> +		.name = "zx297520v3-topclk",
> +	},
> +	{
> +		.name = "zx297520v3-topreset",
> +	},
> +	{
> +		.name = "reboot",
> +		.of_compatible = "syscon-reboot",
> +	},
> +	{
> +		.name = "zx297520v3-usb-phy",
> +	},
> +};
> +
> +static const struct mfd_cell zx297520v3_matrixcrm_cells[] = {
> +	{
> +		.name = "zx297520v3-matrixclk",
> +	},
> +	{
> +		.name = "zx297520v3-matrixreset",
> +	},
> +	/* A set of hwlock controllers is found here as well, but no driver is implemented yet */

Drop this.

> +};
> +
> +static const struct mfd_cell zx297520v3_lspcrm_cells[] = {
> +	{
> +		.name = "zx297520v3-lspclk",
> +	},
> +	{
> +		.name = "zx297520v3-lspreset",
> +	},
> +};

Use MFD_CELL_*() in all of the above.

> +
> +static int zx297520v3_crm_probe(struct platform_device *pdev)
> +{
> +	enum zx297520v3_parent_type type;
> +	struct device *dev = &pdev->dev;
> +	const struct mfd_cell *cells;
> +	struct reset_control *rst;
> +	unsigned int num_cells;
> +	struct clk *pclk;
> +
> +	type = (enum zx297520v3_parent_type)(kernel_ulong_t)of_device_get_match_data(dev);

This should be firmware agnostic.

device_get*()

> +	switch (type) {
> +	case ZX297520V3_TOPCRM:
> +		cells = zx297520v3_topcrm_cells;
> +		num_cells = ARRAY_SIZE(zx297520v3_topcrm_cells);
> +		break;
> +
> +	case ZX297520V3_MATRIXCRM:
> +		cells = zx297520v3_matrixcrm_cells;
> +		num_cells = ARRAY_SIZE(zx297520v3_matrixcrm_cells);
> +		break;
> +
> +	case ZX297520V3_LSPCRM:
> +		cells = zx297520v3_lspcrm_cells;
> +		num_cells = ARRAY_SIZE(zx297520v3_lspcrm_cells);
> +
> +		pclk = devm_clk_get_enabled(dev, "pclk");
> +		if (IS_ERR(pclk))
> +			return dev_err_probe(dev, PTR_ERR(pclk), "Could not get pclk\n");

Place pclk in 's so we know that's its name.

> +
> +		rst = devm_reset_control_get_exclusive_deasserted(dev, NULL);

Does 'rst' have to be shortened?

> +		if (IS_ERR(rst))
> +			return dev_err_probe(dev, PTR_ERR(rst), "Could not get reset\n");

Could we make this error message more descriptive and clear, perhaps using
'Failed to deassert reset control'?

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
> +	{ .compatible = "zte,zx297520v3-topcrm", .data = (void *)ZX297520V3_TOPCRM },
> +	{ .compatible = "zte,zx297520v3-matrixcrm", .data = (void *)ZX297520V3_MATRIXCRM },
> +	{ .compatible = "zte,zx297520v3-lspcrm", .data = (void *)ZX297520V3_LSPCRM },
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
> +MODULE_DESCRIPTION("ZTE zx297520v3 CRM MFD host driver");

Drop the term MFD.

> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.54.0
> 

-- 
Lee Jones

