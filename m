Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E2EC8303D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 02:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aKL1FF4hap74WWQz6H6EMD4nNxNTcrjgixOQ6nf32eM=; b=t8uExxvaz4GgnM2cWO/htUhAUr
	tffQH77iJyaQ9jiNeq5x/UsWetd0wBhTKkkJSedB3iTWDGugmS0MybY1mNhqW68n/YEUYL3jRSK9z
	w3Q6PVZpqg7J+b+yjEq5ErAGHvx0ExAFux9/uDfmm/8Q+WAEXAEED20tKJFEsXN0M/fpdrigVOagY
	aFYkHMhMe4gZJAg7Bog0ek1RFJhu5RK/PGzOije9WCyJlFz9YngIgkM4xdYz1XIzCXBeP3BsLn74d
	t4La6dKWE5UlvUFVyGeEXVJX+WffOK4K00x2EyHsGzdcSRmONk+FQx5D92XRv4CcDwgjUduPiaxJX
	Ljp8CT3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWmoL-000000071Hd-0HwY;
	Wed, 02 Jul 2025 02:02:57 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWmlj-00000007121-3uEq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 02:00:17 +0000
Message-ID: <15ba0933-b0c1-40eb-9d3c-d8837d6ee12a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751421601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aKL1FF4hap74WWQz6H6EMD4nNxNTcrjgixOQ6nf32eM=;
	b=RiE2Gdx1GgXM790DtELGwOhTrItveIzucm7gfHPjoIySLpLc8uXMdXgMbBgMGVFdR2oiPa
	ZE/7qEHeI0xkLU5TEopXi/q4uCnVDLWJtMiXIoPqwdBooQY0oQ0+BgREr1zLdI0YFaEH6o
	d8d2D072jp8C+wwdjrBY/r0AvtCnuzk=
Date: Wed, 2 Jul 2025 09:59:52 +0800
MIME-Version: 1.0
Subject: Re: [PATCH RFT net-next 02/10] net: stmmac: Add support for Allwinner
 A523 GMAC200
To: Chen-Yu Tsai <wens@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
References: <20250701165756.258356-1-wens@kernel.org>
 <20250701165756.258356-3-wens@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250701165756.258356-3-wens@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_190016_192860_CD1EF69F 
X-CRM114-Status: GOOD (  30.08  )
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

在 7/2/25 12:57 AM, Chen-Yu Tsai 写道:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> The Allwinner A523 SoC family has a second Ethernet controller, called
> the GMAC200 in the BSP and T527 datasheet, and referred to as GMAC1 for
> numbering. This controller, according to BSP sources, is fully
> compatible with a slightly newer version of the Synopsys DWMAC core.
> The glue layer around the controller is the same as found around older
> DWMAC cores on Allwinner SoCs. The only slight difference is that since
> this is the second controller on the SoC, the register for the clock
> delay controls is at a different offset. Last, the integration includes
> a dedicated clock gate for the memory bus and the whole thing is put in
> a separately controllable power domain.
> 
> Add a new driver for this hardware supporting the integration layer.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
>   drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>   .../ethernet/stmicro/stmmac/dwmac-sun55i.c    | 161 ++++++++++++++++++
>   3 files changed, 174 insertions(+)
>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index 67fa879b1e52..38ce9a0cfb5b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -263,6 +263,18 @@ config DWMAC_SUN8I
>   	  stmmac device driver. This driver is used for H3/A83T/A64
>   	  EMAC ethernet controller.
>   
> +config DWMAC_SUN55I
> +	tristate "Allwinner sun55i GMAC200 support"
> +	default ARCH_SUNXI
> +	depends on OF && (ARCH_SUNXI || COMPILE_TEST)
> +	select MDIO_BUS_MUX
> +	help
> +	  Support for Allwinner A523/T527 GMAC200 ethernet controllers.
> +
> +	  This selects Allwinner SoC glue layer support for the
> +	  stmmac device driver. This driver is used for A523/T527
> +	  GMAC200 ethernet controller.
> +
>   config DWMAC_THEAD
>   	tristate "T-HEAD dwmac support"
>   	depends on OF && (ARCH_THEAD || COMPILE_TEST)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> index b591d93f8503..51e068e26ce4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -31,6 +31,7 @@ obj-$(CONFIG_DWMAC_STI)		+= dwmac-sti.o
>   obj-$(CONFIG_DWMAC_STM32)	+= dwmac-stm32.o
>   obj-$(CONFIG_DWMAC_SUNXI)	+= dwmac-sunxi.o
>   obj-$(CONFIG_DWMAC_SUN8I)	+= dwmac-sun8i.o
> +obj-$(CONFIG_DWMAC_SUN55I)	+= dwmac-sun55i.o
>   obj-$(CONFIG_DWMAC_THEAD)	+= dwmac-thead.o
>   obj-$(CONFIG_DWMAC_DWC_QOS_ETH)	+= dwmac-dwc-qos-eth.o
>   obj-$(CONFIG_DWMAC_INTEL_PLAT)	+= dwmac-intel-plat.o
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
> new file mode 100644
> index 000000000000..7fadb90e3098
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
> @@ -0,0 +1,161 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * dwmac-sun55i.c - Allwinner sun55i GMAC200 specific glue layer
> + *
> + * Copyright (C) 2025 Chen-Yu Tsai <wens@csie.org>
> + *
> + * syscon parts taken from dwmac-sun8i.c, which is
> + *
> + * Copyright (C) 2017 Corentin Labbe <clabbe.montjoie@gmail.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/stmmac.h>
> +
> +#include "stmmac.h"
> +#include "stmmac_platform.h"
> +
> +#define SYSCON_REG		0x34
> +
> +/* RMII specific bits */
> +#define SYSCON_RMII_EN		BIT(13) /* 1: enable RMII (overrides EPIT) */
insert a blankline.
> +/* Generic system control EMAC_CLK bits */
> +#define SYSCON_ETXDC_MASK		GENMASK(12, 10)
> +#define SYSCON_ERXDC_MASK		GENMASK(9, 5)
ditto.
> +/* EMAC PHY Interface Type */
> +#define SYSCON_EPIT			BIT(2) /* 1: RGMII, 0: MII */
> +#define SYSCON_ETCS_MASK		GENMASK(1, 0)
> +#define SYSCON_ETCS_MII		0x0
> +#define SYSCON_ETCS_EXT_GMII	0x1
> +#define SYSCON_ETCS_INT_GMII	0x2
> +
> +#define MASK_TO_VAL(mask)   ((mask) >> (__builtin_ffsll(mask) - 1))
> +
> +static int sun55i_gmac200_set_syscon(struct device *dev,
> +				     struct plat_stmmacenet_data *plat)
> +{
> +	struct device_node *node = dev->of_node;
> +	struct regmap *regmap;
> +	u32 val, reg = 0;
> +
> +	regmap = syscon_regmap_lookup_by_phandle(node, "syscon");
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "Unable to map syscon\n");
> +
-----------
> +	if (!of_property_read_u32(node, "allwinner,tx-delay-ps", &val)) {
> +		if (val % 100) {
> +			dev_err(dev, "tx-delay must be a multiple of 100\n");
> +			return -EINVAL;
> +		}
> +		val /= 100;
> +		dev_dbg(dev, "set tx-delay to %x\n", val);
> +		if (val > MASK_TO_VAL(SYSCON_ETXDC_MASK))
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Invalid TX clock delay: %d\n",
> +					     val);
> +
> +		reg |= FIELD_PREP(SYSCON_ETXDC_MASK, val);
> +	}
> +
> +	if (!of_property_read_u32(node, "allwinner,rx-delay-ps", &val)) {
> +		if (val % 100) {
> +			dev_err(dev, "rx-delay must be a multiple of 100\n");
> +			return -EINVAL;
> +		}
> +		val /= 100;
> +		dev_dbg(dev, "set rx-delay to %x\n", val);
> +		if (val > MASK_TO_VAL(SYSCON_ERXDC_MASK))
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Invalid RX clock delay: %d\n",
> +					     val);
> +
> +		reg |= FIELD_PREP(SYSCON_ERXDC_MASK, val);
> +	}
------------
These two parts of the code are highly similar.
Can you construct a separate function?
> +
> +	switch (plat->mac_interface) {

> +	case PHY_INTERFACE_MODE_MII:
> +		/* default */
> +		break;
This line of comment seems a bit abrupt here.


Thanks,
Yanteng

