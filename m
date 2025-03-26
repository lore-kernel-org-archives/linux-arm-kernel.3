Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C3EC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 10:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+E2mZMRqfoYQgZOdlNEW0M1RSfUtC2aJTenGzpYGxg=; b=Psqcl1h1ff+RlMjxvWqkZsZRXR
	6yklOSbz3AMnhnrDYfx1T08JvukJXiWmpnPg68SWngQK3oBmmrafZbjPOClg5GsfthTH/i85AuP8H
	yb6wH5zxxLJdcBftLjkOGZ203BK8CHX865vNx6A8nSK87X+Jj4f5iSSByei5ExL/6oplDreX48exo
	xpoRk2KgoxdybuItndRMYlZJkG2C4RSfgx+v0/NdduzUXyD/mf/CjV/qXnOVceQRb0Ah1mMOYNtbS
	6Aw7dYOV3FVgy5ToBfOi4jrEC95qw6yNpijs7i71ctJoQV+T+V6niDviF7TXFPc+SjhQ7Ppbsodo2
	nR2bzkIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txO3v-00000008DGF-04qi;
	Wed, 26 Mar 2025 10:32:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txNzM-00000008BmC-3bxD;
	Wed, 26 Mar 2025 10:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742984879;
	bh=MFDYnf2694t0mOYmpFojXv+RprLkigHE2Y2+IoiSk8o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hOqU4YT9l49LT0T+Cc9TGLCB/JBe8J7DN9KcaYt4NT11gj2I3PFz3zdtgHeYaOte7
	 m1yyyFNm18Gnf2b8eDzXmy34K88EUKw14a8VDPMyMvyBukjQs5SBL3aV+esBKW/A5M
	 gshy1Mk3Pl0MNsDvONAds7p0n57tigyjck1Vpw/+YkrXiRnZfcFla297XV6CPhc7x6
	 yHRrNOocUTGVvwHinchNnjMeT8dGJyOcMEM8fK1ie8OkSvRyrGOj3D45dqOWI8ElEN
	 bRrOhPvTWJL77uQAnVDKayqEim/7fmUjwXSDUvQh3cDtIo/f2SH3xbxmi6sr5lunro
	 RhGCsWjEq0T/Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B02D217E0B9D;
	Wed, 26 Mar 2025 11:27:58 +0100 (CET)
Message-ID: <ae533d2e-49ed-4be1-89de-a55b21f4d30c@collabora.com>
Date: Wed, 26 Mar 2025 11:27:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3,2/2] memory/mediatek: Add an interface to get current DDR
 data rate
To: Crystal Guo <crystal.guo@mediatek.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250326063041.7126-1-crystal.guo@mediatek.com>
 <20250326063041.7126-3-crystal.guo@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250326063041.7126-3-crystal.guo@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_032801_057520_2C50B09F 
X-CRM114-Status: GOOD (  31.75  )
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

Il 26/03/25 07:30, Crystal Guo ha scritto:
> Add MediaTek DRAMC driver to provide an interface that can
> obtain current DDR data rate.
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>   drivers/memory/Kconfig              |   1 +
>   drivers/memory/Makefile             |   1 +
>   drivers/memory/mediatek/Kconfig     |  21 +++
>   drivers/memory/mediatek/Makefile    |   2 +
>   drivers/memory/mediatek/mtk-dramc.c | 232 ++++++++++++++++++++++++++++
>   5 files changed, 257 insertions(+)
>   create mode 100644 drivers/memory/mediatek/Kconfig
>   create mode 100644 drivers/memory/mediatek/Makefile
>   create mode 100644 drivers/memory/mediatek/mtk-dramc.c
> 
> diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
> index c82d8d8a16ea..b1698549ff81 100644
> --- a/drivers/memory/Kconfig
> +++ b/drivers/memory/Kconfig
> @@ -227,5 +227,6 @@ config STM32_FMC2_EBI
>   
>   source "drivers/memory/samsung/Kconfig"
>   source "drivers/memory/tegra/Kconfig"
> +source "drivers/memory/mediatek/Kconfig"
>   
>   endif
> diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
> index d2e6ca9abbe0..c0facf529803 100644
> --- a/drivers/memory/Makefile
> +++ b/drivers/memory/Makefile
> @@ -27,6 +27,7 @@ obj-$(CONFIG_STM32_FMC2_EBI)	+= stm32-fmc2-ebi.o
>   
>   obj-$(CONFIG_SAMSUNG_MC)	+= samsung/
>   obj-$(CONFIG_TEGRA_MC)		+= tegra/
> +obj-$(CONFIG_MEDIATEK_MC)	+= mediatek/
>   obj-$(CONFIG_TI_EMIF_SRAM)	+= ti-emif-sram.o
>   obj-$(CONFIG_FPGA_DFL_EMIF)	+= dfl-emif.o
>   
> diff --git a/drivers/memory/mediatek/Kconfig b/drivers/memory/mediatek/Kconfig
> new file mode 100644
> index 000000000000..3f238e0d9647
> --- /dev/null
> +++ b/drivers/memory/mediatek/Kconfig
> @@ -0,0 +1,21 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config MEDIATEK_MC
> +	bool "MediaTek Memory Controller support"

default y
depends on ARCH_MEDIATEK || COMPILE_TEST

> +	help
> +	  This option allows to enable MediaTek memory controller drivers,
> +	  which may include controllers for DRAM or others.
> +	  Select Y here if you need support for MediaTek memory controller.
> +	  If you don't need, select N.
> +
> +if MEDIATEK_MC
> +
> +config MTK_DRAMC
> +	tristate "MediaTek DRAMC driver"
> +	default y
> +	help
> +	  This option selects the MediaTek DRAMC driver, which provides

           This driver is for the DRAM Controller found in MediaTek SoCs
           and provides a sysfs interface for reporting the current DRAM
           data rate.

The part saying select y or n can be avoided.

> +	  an interface for reporting the current data rate of DRAM.
> +	  Select Y here if you need support for the MediaTek DRAMC driver.
> +	  If you don't need, select N.
> +
> +endif
> diff --git a/drivers/memory/mediatek/Makefile b/drivers/memory/mediatek/Makefile
> new file mode 100644
> index 000000000000..a1395fc55b41
> --- /dev/null
> +++ b/drivers/memory/mediatek/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_MTK_DRAMC)		+= mtk-dramc.o
> diff --git a/drivers/memory/mediatek/mtk-dramc.c b/drivers/memory/mediatek/mtk-dramc.c
> new file mode 100644
> index 000000000000..22042c9d8e42
> --- /dev/null
> +++ b/drivers/memory/mediatek/mtk-dramc.c
> @@ -0,0 +1,232 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + */
> +#include <linux/bitops.h>
> +#include <linux/bitfield.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/printk.h>
> +
> +static unsigned int read_reg_field(void __iomem *base, unsigned int offset, unsigned int mask)

Please move this function to before mtk_dramc_probe()

> +{
> +	unsigned int val = readl(base + offset);
> +	unsigned int shift = __ffs(mask);
> +
> +	return (val & mask) >> shift;
> +}
> +
> +struct mtk_dramc_pdata {
> +	u8 fmeter_version;
> +	u8 ref_freq_mhz;
> +	const u16 *regs;
> +	const u32 *masks;
> +	u32 posdiv_purify;
> +	u8 prediv;
> +	u16 shuffle_offset;
> +};
> +
> +struct mtk_dramc_dev_t {

That may be confused with a typedef so, please, just "struct mtk_dramc"

> +	void __iomem *anaphy_base;
> +	void __iomem *ddrphy_base;
> +	const struct mtk_dramc_pdata *pdata;
> +};
> +
> +enum mtk_dramc_reg_index {
> +	DRAMC_DPHY_DVFS_STA,
> +	DRAMC_APHY_SHU_PHYPLL2,
> +	DRAMC_APHY_SHU_CLRPLL2,
> +	DRAMC_APHY_SHU_PHYPLL3,
> +	DRAMC_APHY_SHU_CLRPLL3,
> +	DRAMC_APHY_SHU_PHYPLL4,
> +	DRAMC_APHY_ARPI0,
> +	DRAMC_APHY_CA_ARDLL1,
> +	DRAMC_APHY_B0_TX0,
> +};
> +
> +enum mtk_dramc_mask_index {
> +	DRAMC_DPHY_DVFS_SHU_LV,
> +	DRAMC_DPHY_DVFS_PLL_SEL,
> +	DRAMC_APHY_PLL2_SDMPCW,
> +	DRAMC_APHY_PLL3_POSDIV,
> +	DRAMC_APHY_PLL4_FBKSEL,
> +	DRAMC_APHY_ARPI0_SOPEN,
> +	DRAMC_APHY_ARDLL1_CK_EN,
> +	DRAMC_APHY_B0_TX0_SER_MODE,
> +};
> +
> +static const u16 mtk_dramc_regs_mt8196[] = {
> +	[DRAMC_DPHY_DVFS_STA] = 0xe98,
> +	[DRAMC_APHY_SHU_PHYPLL2] = 0x908,
> +	[DRAMC_APHY_SHU_CLRPLL2] = 0x928,
> +	[DRAMC_APHY_SHU_PHYPLL3] = 0x90c,
> +	[DRAMC_APHY_SHU_CLRPLL3] = 0x92c,
> +	[DRAMC_APHY_SHU_PHYPLL4] = 0x910,
> +	[DRAMC_APHY_ARPI0] = 0x0d94,
> +	[DRAMC_APHY_CA_ARDLL1] = 0x0d08,
> +	[DRAMC_APHY_B0_TX0] = 0x0dc4,
> +};
> +
> +static const u32 mtk_dramc_masks_mt8196[] = {
> +	[DRAMC_DPHY_DVFS_SHU_LV] = GENMASK(15, 14),
> +	[DRAMC_DPHY_DVFS_PLL_SEL] = GENMASK(25, 25),
> +	[DRAMC_APHY_PLL2_SDMPCW] = GENMASK(18, 3),
> +	[DRAMC_APHY_PLL3_POSDIV] = GENMASK(13, 11),
> +	[DRAMC_APHY_PLL4_FBKSEL] = GENMASK(6, 6),
> +	[DRAMC_APHY_ARPI0_SOPEN] = GENMASK(26, 26),
> +	[DRAMC_APHY_ARDLL1_CK_EN] = GENMASK(0, 0),
> +	[DRAMC_APHY_B0_TX0_SER_MODE] = GENMASK(4, 3),
> +};
> +

function read_reg_field goes here.

> +static int mtk_dramc_probe(struct platform_device *pdev)
> +{
> +	struct mtk_dramc_dev_t *dramc;
> +	const struct mtk_dramc_pdata *pdata;
> +
> +	dramc = devm_kzalloc(&pdev->dev, sizeof(struct mtk_dramc_dev_t), GFP_KERNEL);
> +	if (!dramc)
> +		return dev_err_probe(&pdev->dev, -ENOMEM, "Failed to allocate memory\n");
> +
> +	pdata = of_device_get_match_data(&pdev->dev);
> +	if (!pdata)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "No platform data available\n");
> +
> +	dramc->pdata = pdata;
> +
> +	dramc->anaphy_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(dramc->anaphy_base))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(dramc->anaphy_base),
> +				     "Unable to map ANAPHY base\n");
> +
> +	dramc->ddrphy_base = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(dramc->ddrphy_base))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(dramc->ddrphy_base),
> +				     "Unable to map DDRPHY base\n");
> +
> +	platform_set_drvdata(pdev, dramc);
> +	return 0;
> +}
> +
> +static unsigned int mtk_fmeter_v1(struct mtk_dramc_dev_t *dramc)
> +{
> +	const struct mtk_dramc_pdata *pdata = dramc->pdata;
> +	unsigned int shu_level, pll_sel, offset;
> +	unsigned int sdmpcw, posdiv, clkdiv, fbksel, sopen, async_ca, ser_mode;
> +	unsigned int prediv_freq, posdiv_freq, vco_freq;
> +	unsigned int final_rate;
> +
> +	shu_level = read_reg_field(dramc->ddrphy_base, pdata->regs[DRAMC_DPHY_DVFS_STA],
> +				   pdata->masks[DRAMC_DPHY_DVFS_SHU_LV]);
> +	pll_sel = read_reg_field(dramc->ddrphy_base, pdata->regs[DRAMC_DPHY_DVFS_STA],
> +				 pdata->masks[DRAMC_DPHY_DVFS_PLL_SEL]);
> +	offset = pdata->shuffle_offset * shu_level;
> +
> +	sdmpcw = read_reg_field(dramc->anaphy_base,
> +				((pll_sel == 0) ?
> +				pdata->regs[DRAMC_APHY_SHU_PHYPLL2] :
> +				pdata->regs[DRAMC_APHY_SHU_CLRPLL2]) + offset,
> +				pdata->masks[DRAMC_APHY_PLL2_SDMPCW]);
> +	posdiv = read_reg_field(dramc->anaphy_base,
> +				((pll_sel == 0) ?
> +				pdata->regs[DRAMC_APHY_SHU_PHYPLL3] :
> +				pdata->regs[DRAMC_APHY_SHU_CLRPLL3]) + offset,
> +				pdata->masks[DRAMC_APHY_PLL3_POSDIV]);
> +	fbksel = read_reg_field(dramc->anaphy_base, pdata->regs[DRAMC_APHY_SHU_PHYPLL4] + offset,
> +				pdata->masks[DRAMC_APHY_PLL4_FBKSEL]);
> +	sopen = read_reg_field(dramc->anaphy_base, pdata->regs[DRAMC_APHY_ARPI0] + offset,
> +			       pdata->masks[DRAMC_APHY_ARPI0_SOPEN]);
> +	async_ca = read_reg_field(dramc->anaphy_base, pdata->regs[DRAMC_APHY_CA_ARDLL1] + offset,
> +				  pdata->masks[DRAMC_APHY_ARDLL1_CK_EN]);
> +	ser_mode = read_reg_field(dramc->anaphy_base, pdata->regs[DRAMC_APHY_B0_TX0] + offset,
> +				  pdata->masks[DRAMC_APHY_B0_TX0_SER_MODE]);
> +
> +	clkdiv = (ser_mode == 1) ? 1 : 0;
> +	posdiv &= ~(pdata->posdiv_purify);
> +
> +	prediv_freq = pdata->ref_freq_mhz * (sdmpcw >> pdata->prediv);
> +	posdiv_freq = (prediv_freq >> posdiv) >> 1;
> +	vco_freq = posdiv_freq << fbksel;
> +	final_rate = vco_freq >> clkdiv;
> +
> +	if (sopen == 1 && async_ca == 1)
> +		final_rate >>= 1;
> +
> +	return final_rate;
> +}
> +
> +/*

You're so near to kerneldoc that you might just as well use it.

/**
  * mtk_dramc_get_data_rate - Calculate DRAM data rate
  * @dev - Device pointer
  *
  * Return: DRAM Data Rate in MB/s or negative number for error
  */

> + * mtk_dramc_get_data_rate - calculate DRAM data rate
> + *
> + * Returns DRAM data rate (MB/s)
> + */
> +static unsigned int mtk_dramc_get_data_rate(struct device *dev)
> +{
> +	struct mtk_dramc_dev_t *dramc_dev = dev_get_drvdata(dev);
> +
> +	if (!dramc_dev) {
> +		dev_err(dev, "DRAMC device data not found\n");

That can't happen, because you're assigning drvdata in the probe function

> +		return -EINVAL;
> +	}
> +
> +	if (dramc_dev->pdata) {
> +		if (dramc_dev->pdata->fmeter_version == 1)
> +			return mtk_fmeter_v1(dramc_dev);
> +
> +		dev_err(dev, "Unsupported fmeter version\n");
> +		return -EINVAL;
> +	}
> +	dev_err(dev, "DRAMC platform data not found\n");

That also can't happen.

> +	return -EINVAL;
> +}

/**
  * mtk_dramc_get_data_rate - Calculate DRAM data rate
  * @dev - Device pointer
  *
  * Return: DRAM Data Rate in MB/s or negative number for error
  */
static unsigned int mtk_dramc_get_data_rate(struct device *dev)
{
	struct mtk_dramc *dramc = dev_get_drvdata(dev);

	if (dramc_dev->pdata->fmeter_version == 1)
		return mtk_fmeter_v1(dramc_dev);

	dev_err(dev, "Frequency meter version %u not supported\n");
	return -EINVAL;
};

> +
> +static ssize_t dram_data_rate_show(struct device *dev,
> +				   struct device_attribute *attr, char *buf)
> +{
> +	return snprintf(buf, PAGE_SIZE, "DRAM data rate = %u\n",
> +			mtk_dramc_get_data_rate(dev));
> +}
> +
> +static DEVICE_ATTR_RO(dram_data_rate);
> +
> +static struct attribute *mtk_dramc_attrs[] = {
> +	&dev_attr_dram_data_rate.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(mtk_dramc);
> +
> +static const struct mtk_dramc_pdata dramc_pdata_mt8196 = {
> +	.fmeter_version = 1,
> +	.ref_freq_mhz = 26,
> +	.regs = mtk_dramc_regs_mt8196,
> +	.masks = mtk_dramc_masks_mt8196,
> +	.posdiv_purify = BIT(2),
> +	.prediv = 7,
> +	.shuffle_offset = 0x700,
> +};
> +
> +static const struct of_device_id mtk_dramc_of_ids[] = {
> +	{ .compatible = "mediatek,mt8196-dramc", .data = &dramc_pdata_mt8196 },
> +	{}

{ /* sentinel */ }

> +};
> +MODULE_DEVICE_TABLE(of, mtk_dramc_of_ids);
> +
> +static struct platform_driver mtk_dramc_driver = {
> +	.probe = mtk_dramc_probe,
> +	.driver = {
> +		.name = "mtk_dramc_drv",

.name = "mtk-dramc"

> +		.of_match_table = mtk_dramc_of_ids,
> +		.dev_groups = mtk_dramc_groups,
> +	},
> +};
> +

No blank line here:

};
module_platform_driver(....)

I think that v4 will be the final version :-)

Cheers,
Angelo

> +module_platform_driver(mtk_dramc_driver);
> +
> +MODULE_AUTHOR("Crystal Guo <crystal.guo@mediatek.com>");
> +MODULE_DESCRIPTION("MediaTek DRAM Controller Driver");
> +MODULE_LICENSE("GPL");



