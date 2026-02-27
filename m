Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76347FEFB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 14:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kEGaf9zqcWTV5lUNoFG6YgkinNxqtmaRJ7WKJCFDZQU=; b=z62PZbj8K38yjWVxdQWetiZyX9
	vtarEdDxWm4qvMSrcCekBATtn6umrD1RFhHmMaZiUUyPVNDHwPrBe2TgOfdomYiyTebBF9X/j0mdZ
	czqJz4E8nop4xZchVXIJUn9+HfGfg0cSXmZp7G/8qZimETuCPh9X7c4XcfBwj7nlfKMQqvhGsg2ZG
	Ybw3m79i1wdG4AEgVGtKwIv1inr+TNvu3o2nnaqaUCnYMX9oKFPXCBJb1/E87TYLRXLJ7cXdttYP0
	iixR8TM/0SE2BafLxDXc3TKGtGQ9IHCF2wJFBeRFOQwLEe/PztzGjmB5+bcGsqeACmnJKorqZCuma
	V0rDbjhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzDZ-00000008WZt-0lrY;
	Fri, 27 Feb 2026 14:53:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzDW-00000008WXw-3WS1;
	Fri, 27 Feb 2026 14:53:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 75F5B44394;
	Fri, 27 Feb 2026 14:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D099C2BC9E;
	Fri, 27 Feb 2026 14:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772204002;
	bh=ld7NR675p8M5i366cnAgjhmDv51p+1WaNWwPE8ixVMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KNHx9uzj6ZyzCtHaKb4X2/uUbngS3GRRKfIFQBMUUUyQcfDdMJjXyhoDET2GwXoU9
	 tw6lz0GtjSQ5zymFWPwDZrCiU3t3aDLIAExSZmeBf1Zt//0SW2LeNuv1uuVksWcZvZ
	 Z7ql7nceE/JolyD6oqdDCGwPTx8t0Ao4gkUQFHtI7Z8tcenwS2k4NqrMr+bzi+WfkH
	 nX57vvuaxkD+zKPdBzgzB3inGqV5kFbtqcTekEqY4HJwlq9dGFD0RMkqlKV9M9cAKR
	 2mQVuNLRwK0UrmY03QLfHiwNEUw+xpRAgneTVjhPKJKpct/JeCUt4wAiScsFmUUjsh
	 Oyr65Nsmc0ZSw==
Date: Fri, 27 Feb 2026 20:23:18 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Tzu-Hao Wei <twei@axiado.com>
Cc: SriNavmani A <srinavmani@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 2/4] phy: axiado: add Axiado eMMC PHY driver
Message-ID: <aaGv3q8czkrKyW42@vaman>
References: <20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-0-a2f59e97a92d@axiado.com>
 <20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-2-a2f59e97a92d@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-2-a2f59e97a92d@axiado.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_065322_926797_9F51DB20 
X-CRM114-Status: GOOD (  25.02  )
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

On 06-02-26, 16:22, Tzu-Hao Wei wrote:
> From: SriNavmani A <srinavmani@axiado.com>
> 
> It provides the required configurations for Axiado eMMC PHY driver for
> HS200 mode.
> 
> Signed-off-by: SriNavmani A <srinavmani@axiado.com>
> Co-developed-by: Prasad Bolisetty <pbolisetty@axiado.com>
> Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> ---
>  drivers/phy/Kconfig                  |   1 +
>  drivers/phy/Makefile                 |   1 +
>  drivers/phy/axiado/Kconfig           |  11 ++
>  drivers/phy/axiado/Makefile          |   1 +
>  drivers/phy/axiado/phy-axiado-emmc.c | 221 +++++++++++++++++++++++++++++++++++
>  5 files changed, 235 insertions(+)
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 678dd0452f0aa0597773433f04d2a9ba77474d2a..b802274ea45a84bd36d7c0b7fb90e368a5c018b4 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -103,6 +103,7 @@ config PHY_NXP_PTN3222
>  
>  source "drivers/phy/allwinner/Kconfig"
>  source "drivers/phy/amlogic/Kconfig"
> +source "drivers/phy/axiado/Kconfig"
>  source "drivers/phy/broadcom/Kconfig"
>  source "drivers/phy/cadence/Kconfig"
>  source "drivers/phy/freescale/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index bfb27fb5a494283d7fd05dd670ebd1b12df8b1a1..f1b9e4a8673bcde3fdc0fdc06a3deddb5785ced1 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
>  obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
>  obj-y					+= allwinner/	\
>  					   amlogic/	\
> +					   axiado/	\
>  					   broadcom/	\
>  					   cadence/	\
>  					   freescale/	\
> diff --git a/drivers/phy/axiado/Kconfig b/drivers/phy/axiado/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..d159e0345345987c7f48dcd12d3237997735d2b5
> --- /dev/null
> +++ b/drivers/phy/axiado/Kconfig
> @@ -0,0 +1,11 @@
> +#
> +# PHY drivers for Axiado platforms
> +#
> +
> +config PHY_AX3000_EMMC
> +	tristate "Axiado eMMC PHY driver"
> +	depends on OF && (ARCH_AXIADO || COMPILE_TEST)
> +	select GENERIC_PHY
> +	help
> +	  Enables this to support for the AX3000 EMMC PHY driver.
> +	  If unsure, say N.
> diff --git a/drivers/phy/axiado/Makefile b/drivers/phy/axiado/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..1e2b1ba016092eaffdbd7acbd9cdc8577d79b35c
> --- /dev/null
> +++ b/drivers/phy/axiado/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_PHY_AX3000_EMMC)		+= phy-axiado-emmc.o
> diff --git a/drivers/phy/axiado/phy-axiado-emmc.c b/drivers/phy/axiado/phy-axiado-emmc.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..28d2a30c3b35ee7dba917487959e226941e8ea4b
> --- /dev/null
> +++ b/drivers/phy/axiado/phy-axiado-emmc.c
> @@ -0,0 +1,221 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Axiado eMMC PHY driver
> + *
> + * Copyright (C) 2017 Arasan Chip Systems Inc.
> + * Copyright (C) 2022-2025 Axiado Corporation (or its affiliates).

2026

> + *
> + * Based on Arasan Driver (sdhci-pci-arasan.c)
> + * sdhci-pci-arasan.c - Driver for Arasan PCI Controller with integrated phy.
> + */
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +
> +/* Arasan eMMC 5.1 - PHY configuration registers */
> +#define CAP_REG_IN_S1_LSB		0x00
> +#define CAP_REG_IN_S1_MSB		0x04
> +#define PHY_CTRL_1			0x38
> +#define PHY_CTRL_2			0x3C

smaller hex case please, here and other places

> +#define PHY_CTRL_3			0x40
> +#define STATUS				0x50
> +
> +#define DLL_ENBL	BIT(26)
> +#define RTRIM_EN	BIT(21)
> +#define PDB_ENBL	BIT(23)
> +#define RETB_ENBL	BIT(1)
> +
> +#define REN_STRB	BIT(27)
> +#define REN_CMD		BIT(12)
> +#define REN_DAT0	BIT(13)
> +#define REN_DAT1	BIT(14)
> +#define REN_DAT2	BIT(15)
> +#define REN_DAT3	BIT(16)
> +#define REN_DAT4	BIT(17)
> +#define REN_DAT5	BIT(18)
> +#define REN_DAT6	BIT(19)
> +#define REN_DAT7	BIT(20)
> +#define REN_CMD_EN	(REN_CMD | REN_DAT0 | REN_DAT1 | REN_DAT2 | \
> +		REN_DAT3 | REN_DAT4 | REN_DAT5 | REN_DAT6 | REN_DAT7)
> +
> +/* Pull-UP Enable on CMD Line */
> +#define PU_CMD		BIT(3)
> +#define PU_DAT0		BIT(4)
> +#define PU_DAT1		BIT(5)
> +#define PU_DAT2		BIT(6)
> +#define PU_DAT3		BIT(7)
> +#define PU_DAT4		BIT(8)
> +#define PU_DAT5		BIT(9)
> +#define PU_DAT6		BIT(10)
> +#define PU_DAT7		BIT(11)
> +#define PU_CMD_EN (PU_CMD | PU_DAT0 | PU_DAT1 | PU_DAT2 | PU_DAT3 | \
> +		PU_DAT4 | PU_DAT5 | PU_DAT6 | PU_DAT7)

The bit define are used only once, why not define the cmd with
respective bits here

> +
> +/* Selection value for the optimum delay from 1-32 output tap lines */
> +#define OTAP_DLY	0x02
> +/* DLL charge pump current trim default [1000] */
> +#define DLL_TRM_ICP	0x08
> +/* Select the frequency range of DLL Operation */
> +#define FRQ_SEL	0x01
> +
> +#define OTAP_SEL_MASK		GENMASK(10, 7)
> +#define DLL_TRM_MASK		GENMASK(25, 22)
> +#define DLL_FRQSEL_MASK		GENMASK(27, 25)
> +
> +#define OTAP_SEL(x)		(FIELD_PREP(OTAP_SEL_MASK, x) | OTAPDLY_EN)
> +#define DLL_TRM(x)		(FIELD_PREP(DLL_TRM_MASK, x) | DLL_ENBL)
> +#define DLL_FRQSEL(x)	FIELD_PREP(DLL_FRQSEL_MASK, x)
> +
> +#define OTAPDLY_EN	BIT(11)
> +
> +#define SEL_DLY_RXCLK	BIT(18)
> +#define SEL_DLY_TXCLK	BIT(19)
> +
> +#define CALDONE_MASK	0x40
> +#define DLL_RDY_MASK	0x1
> +#define MAX_CLK_BUF0	BIT(20)
> +#define MAX_CLK_BUF1	BIT(21)
> +#define MAX_CLK_BUF2	BIT(22)
> +
> +#define CLK_MULTIPLIER	0xC008E
> +#define POLL_TIMEOUT_MS	3000
> +#define POLL_DELAY_US	100
> +
> +struct axiado_emmc_phy {
> +	void __iomem *reg_base;
> +	struct device *dev;
> +};
> +
> +static int axiado_emmc_phy_init(struct phy *phy)
> +{
> +	struct axiado_emmc_phy *ax_phy = phy_get_drvdata(phy);
> +	struct device *dev = ax_phy->dev;
> +	u32 val;
> +	int ret;
> +
> +	val = readl(ax_phy->reg_base + PHY_CTRL_1);
> +	writel(val | RETB_ENBL | RTRIM_EN, ax_phy->reg_base + PHY_CTRL_1);
> +
> +	val = readl(ax_phy->reg_base + PHY_CTRL_3);
> +	writel(val | PDB_ENBL, ax_phy->reg_base + PHY_CTRL_3);
> +
> +	ret = readl_poll_timeout(ax_phy->reg_base + STATUS, val,
> +				 val & CALDONE_MASK, POLL_DELAY_US,
> +				 POLL_TIMEOUT_MS * 1000);
> +	if (ret) {
> +		dev_err(dev, "PHY calibration timeout\n");
> +		return ret;
> +	}
> +
> +	val = readl(ax_phy->reg_base + PHY_CTRL_1);
> +	writel(val | REN_CMD_EN | PU_CMD_EN, ax_phy->reg_base + PHY_CTRL_1);
> +
> +	val = readl(ax_phy->reg_base + PHY_CTRL_2);
> +	writel(val | REN_STRB, ax_phy->reg_base + PHY_CTRL_2);
> +
> +	val = readl(ax_phy->reg_base + PHY_CTRL_3);
> +	writel(val | MAX_CLK_BUF0 | MAX_CLK_BUF1 | MAX_CLK_BUF2,
> +	       ax_phy->reg_base + PHY_CTRL_3);
> +
> +	writel(CLK_MULTIPLIER, ax_phy->reg_base + CAP_REG_IN_S1_MSB);
> +
> +	val = readl(ax_phy->reg_base + PHY_CTRL_3);
> +	writel(val | SEL_DLY_RXCLK | SEL_DLY_TXCLK,
> +	       ax_phy->reg_base + PHY_CTRL_3);
> +
> +	return 0;
> +}
> +
> +static int axiado_emmc_phy_power_on(struct phy *phy)
> +{
> +	struct axiado_emmc_phy *ax_phy = phy_get_drvdata(phy);
> +	struct device *dev = ax_phy->dev;
> +	u32 val;
> +	int ret;
> +
> +	val = readl(ax_phy->reg_base + PHY_CTRL_1);
> +	writel(val | RETB_ENBL, ax_phy->reg_base + PHY_CTRL_1);
> +
> +	val = readl(ax_phy->reg_base + PHY_CTRL_3);
> +	writel(val | PDB_ENBL, ax_phy->reg_base + PHY_CTRL_3);
> +
> +	val = readl(ax_phy->reg_base + PHY_CTRL_2);
> +	writel(val | OTAP_SEL(OTAP_DLY), ax_phy->reg_base + PHY_CTRL_2);
> +
> +	val = readl(ax_phy->reg_base + PHY_CTRL_1);
> +	writel(val | DLL_TRM(DLL_TRM_ICP), ax_phy->reg_base + PHY_CTRL_1);
> +
> +	val = readl(ax_phy->reg_base + PHY_CTRL_3);
> +	writel(val | DLL_FRQSEL(FRQ_SEL), ax_phy->reg_base + PHY_CTRL_3);
> +
> +	ret = read_poll_timeout(readl, val, val & DLL_RDY_MASK, POLL_DELAY_US,
> +				POLL_TIMEOUT_MS * 1000, false,
> +				ax_phy->reg_base + STATUS);
> +	if (ret) {
> +		dev_err(dev, "DLL ready timeout\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops axiado_emmc_phy_ops = {
> +	.init = axiado_emmc_phy_init,
> +	.power_on = axiado_emmc_phy_power_on,

no power_off?

-- 
~Vinod

