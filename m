Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086C0C02180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 01:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LN4mhBv11bQYirwOYr9gNIgXytcwvkBsTqALtdmLtxE=; b=RztPNaZBwrDeqt/D0Q0GthtZfT
	zapjdsm84SGZL//wiQ8x3e7Q8eoTtP6XB3m92PlsYbLQuY8k9N5A1541bqqIm3YoAtivjpyUT7OaZ
	mW+akS/FhXTeTIWlWZ6aiAfNsnQvf4zLQHLT9FOm8pbuvdWCwp/yPBddF1y0Xv2BR0WbdzL2wjiki
	jYh1rgoXgD/z5hGyHrYGmOHLT8aBpsm32V91BCDyedkZSZh/ClQTwKKlVeCFIphvrW8LJkXgoMmxW
	eIimkQfLt11N9045CbG3Pg5+McsWvecjD97EjXtoB+M3bLJcty0qcLem293ppcXTZELuLWhWQitig
	Z7cte4RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXW5m-00000007BOp-3jzp;
	Tue, 14 Jan 2025 01:51:43 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXW4X-00000007BI6-0yRN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 01:50:27 +0000
Received: from [192.168.0.224] (ip5f5ae8ae.dynamic.kabel-deutschland.de [95.90.232.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 7F0A661E64780;
	Tue, 14 Jan 2025 02:49:37 +0100 (CET)
Message-ID: <a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
Date: Tue, 14 Jan 2025 02:49:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 devicetree@vger.kernel.org, ychuang3@nuvoton.com, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 Andrew Lunn <andrew@lunn.ch>, schung@nuvoton.com, peppe.cavallaro@st.com,
 yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250113055434.3377508-1-a0987203069@gmail.com>
 <20250113055434.3377508-4-a0987203069@gmail.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20250113055434.3377508-4-a0987203069@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_175025_564015_B757E94F 
X-CRM114-Status: GOOD (  30.99  )
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

Dear Joey,


Thank you for your patch.

Am 13.01.25 um 00:54 schrieb Joey Lu:
> Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac driver.

It’d be great if you added the datasheet name and revision to the commit 
message.

Also, please document how tested the driver. Maybe even paste new log 
messages.

> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Joey Lu <a0987203069@gmail.com>

As you use your company email address in the AUTHOR line below, please 
also add that email address to the commit message (and maybe even as the 
author).

> ---
>   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
>   drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>   .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 179 ++++++++++++++++++
>   3 files changed, 191 insertions(+)
>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index 4cc85a36a1ab..2b424544cf6f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -121,6 +121,17 @@ config DWMAC_MESON
>   	  the stmmac device driver. This driver is used for Meson6,
>   	  Meson8, Meson8b and GXBB SoCs.
>   
> +config DWMAC_NUVOTON
> +	tristate "Nuvoton MA35 dwmac support"
> +	default ARCH_MA35
> +	depends on OF && (ARCH_MA35 || COMPILE_TEST)
> +	select MFD_SYSCON
> +	help
> +	  Support for Ethernet controller on Nuvoton MA35 series SoC.
> +
> +	  This selects the Nuvoton MA35 series SoC glue layer support
> +	  for the stmmac device driver.

Also mention the module name `dwmac-nuvoton`?

> +
>   config DWMAC_QCOM_ETHQOS
>   	tristate "Qualcomm ETHQOS support"
>   	default ARCH_QCOM
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> index b26f0e79c2b3..48e25b85ea06 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_DWMAC_IPQ806X)	+= dwmac-ipq806x.o
>   obj-$(CONFIG_DWMAC_LPC18XX)	+= dwmac-lpc18xx.o
>   obj-$(CONFIG_DWMAC_MEDIATEK)	+= dwmac-mediatek.o
>   obj-$(CONFIG_DWMAC_MESON)	+= dwmac-meson.o dwmac-meson8b.o
> +obj-$(CONFIG_DWMAC_NUVOTON)	+= dwmac-nuvoton.o
>   obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+= dwmac-qcom-ethqos.o
>   obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
>   obj-$(CONFIG_DWMAC_RZN1)	+= dwmac-rzn1.o
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
> new file mode 100644
> index 000000000000..edf1b88ce1cd
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
> @@ -0,0 +1,179 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Nuvoton DWMAC specific glue layer
> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + *
> + * Author: Joey Lu <yclu4@nuvoton.com>
> + */
> +
> +#include <linux/mfd/syscon.h>
> +#include <linux/of_device.h>
> +#include <linux/of_net.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/stmmac.h>
> +
> +#include "stmmac.h"
> +#include "stmmac_platform.h"
> +
> +#define NVT_REG_SYS_GMAC0MISCR  0x108
> +#define NVT_REG_SYS_GMAC1MISCR  0x10C
> +
> +#define NVT_MISCR_RMII          BIT(0)
> +
> +/* 2000ps is mapped to 0x0 ~ 0xF */

Excuse my ignorance: What is ps?

> +#define NVT_PATH_DELAY_DEC      134
> +#define NVT_TX_DELAY_MASK       GENMASK(19, 16)
> +#define NVT_RX_DELAY_MASK       GENMASK(23, 20)
> +
> +struct nvt_priv_data {
> +	struct platform_device *pdev;
> +	struct regmap *regmap;
> +};
> +
> +static struct nvt_priv_data *
> +nvt_gmac_setup(struct platform_device *pdev, struct plat_stmmacenet_data *plat)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct nvt_priv_data *bsp_priv;
> +	phy_interface_t phy_mode;
> +	u32 tx_delay, rx_delay;

Please append the unit to the variable name.

> +	u32 macid, arg, reg;
> +
> +	bsp_priv = devm_kzalloc(dev, sizeof(*bsp_priv), GFP_KERNEL);
> +	if (!bsp_priv)
> +		return ERR_PTR(-ENOMEM);
> +
> +	bsp_priv->regmap =
> +		syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys", 1, &macid);
> +	if (IS_ERR(bsp_priv->regmap)) {
> +		dev_err_probe(dev, PTR_ERR(bsp_priv->regmap), "Failed to get sys register\n");
> +		return ERR_PTR(-ENODEV);
> +	}
> +	if (macid > 1) {
> +		dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (of_property_read_u32(dev->of_node, "tx-internal-delay-ps", &arg)) {
> +		tx_delay = 0;
> +	} else {
> +		if (arg <= 2000) {
> +			tx_delay = (arg == 2000) ? 0xF : (arg / NVT_PATH_DELAY_DEC);

Write hexcharacters lowercase?

> +			dev_dbg(dev, "Set Tx path delay to 0x%x\n", tx_delay);
> +		} else {
> +			dev_err(dev, "Invalid Tx path delay argument.\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +	}
> +	if (of_property_read_u32(dev->of_node, "rx-internal-delay-ps", &arg)) {
> +		rx_delay = 0;
> +	} else {
> +		if (arg <= 2000) {
> +			rx_delay = (arg == 2000) ? 0xF : (arg / NVT_PATH_DELAY_DEC);
> +			dev_dbg(dev, "Set Rx path delay to 0x%x\n", rx_delay);
> +		} else {
> +			dev_err(dev, "Invalid Rx path delay argument.\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +	}
> +
> +	regmap_read(bsp_priv->regmap,
> +		    macid == 0 ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR, &reg);
> +	reg &= ~(NVT_TX_DELAY_MASK | NVT_RX_DELAY_MASK);
> +
> +	if (of_get_phy_mode(pdev->dev.of_node, &phy_mode)) {
> +		dev_err(dev, "missing phy mode property\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	switch (phy_mode) {
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		reg &= ~NVT_MISCR_RMII;
> +		break;
> +	case PHY_INTERFACE_MODE_RMII:
> +		reg |= NVT_MISCR_RMII;
> +		break;
> +	default:
> +		dev_err(dev, "Unsupported phy-mode (%d)\n", phy_mode);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (!(reg & NVT_MISCR_RMII)) {
> +		reg |= FIELD_PREP(NVT_TX_DELAY_MASK, tx_delay);
> +		reg |= FIELD_PREP(NVT_RX_DELAY_MASK, rx_delay);
> +	}
> +
> +	regmap_write(bsp_priv->regmap,
> +		     macid == 0 ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR, reg);
> +
> +	bsp_priv->pdev = pdev;
> +
> +	return bsp_priv;
> +}
> +
> +static int nvt_gmac_probe(struct platform_device *pdev)
> +{
> +	struct plat_stmmacenet_data *plat_dat;
> +	struct stmmac_resources stmmac_res;
> +	struct nvt_priv_data *priv_data;
> +	int ret;
> +
> +	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
> +	if (ret)
> +		return ret;
> +
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	if (IS_ERR(plat_dat))
> +		return PTR_ERR(plat_dat);
> +
> +	/* Nuvoton DWMAC configs */
> +	plat_dat->has_gmac = 1;
> +	plat_dat->tx_fifo_size = 2048;
> +	plat_dat->rx_fifo_size = 4096;
> +	plat_dat->multicast_filter_bins = 0;
> +	plat_dat->unicast_filter_entries = 8;
> +	plat_dat->flags &= ~STMMAC_FLAG_USE_PHY_WOL;
> +
> +	priv_data = nvt_gmac_setup(pdev, plat_dat);
> +	if (IS_ERR(priv_data))
> +		return PTR_ERR(priv_data);
> +
> +	ret = stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
> +	if (ret)
> +		return ret;
> +
> +	/* The PMT flag is determined by the RWK property.
> +	 * However, our hardware is configured to support only MGK.
> +	 * This is an override on PMT to enable WoL capability.
> +	 */
> +	plat_dat->pmt = 1;
> +	device_set_wakeup_capable(&pdev->dev, 1);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id nvt_dwmac_match[] = {
> +	{ .compatible = "nuvoton,ma35d1-dwmac"},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, nvt_dwmac_match);
> +
> +static struct platform_driver nvt_dwmac_driver = {
> +	.probe  = nvt_gmac_probe,
> +	.remove = stmmac_pltfr_remove,
> +	.driver = {
> +		.name           = "nuvoton-dwmac",
> +		.pm		= &stmmac_pltfr_pm_ops,
> +		.of_match_table = nvt_dwmac_match,
> +	},
> +};
> +module_platform_driver(nvt_dwmac_driver);
> +
> +MODULE_AUTHOR("Joey Lu <yclu4@nuvoton.com>");

Maybe Nuvoton can set up a generic address?

> +MODULE_DESCRIPTION("Nuvoton DWMAC specific glue layer");
> +MODULE_LICENSE("GPL v2");


Kind regards,

Paul

