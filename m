Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB1BC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 22:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2D8MduI9NE1LwI9v9L0sH33MnpUkEkIXfPNIfZ+r5lo=; b=Nxeabx0kDxYNpIq9Lvsifw7SVB
	j7zKTpxSQJKGO4TkM5s3OuYPdPDqmJ4/E4AUTuRKWOigm0Lge0/Rf00ZfjkDQiufC6lYTvqhVzfXU
	XgsxgBcH+87GIGHO46NH2xtFA8D32OTP6nhj+rfntG2ybF/Ttend9zlRCbFqF5k/DtWaaVwXZeyOq
	9qfhZZ7V+7l5WYDesw+ExfsGHpNX8BlcJrrqlpsnEKl257PM1BYW0oNK5K4YdSwgS+vuM38HyYop6
	WX99qMod2Fm8Ue1yc5KFEwAhXaqpJmN57T12DxnZPAF0BcTjlmiGEz4R0dgZpe7jJm4WN1YOBL8em
	My+leCJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Eqx-00000004lKD-003q;
	Mon, 14 Sep 2026 22:08:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Eqw-00000004lJx-17Dw;
	Mon, 14 Sep 2026 22:08:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6ABF860252;
	Mon, 14 Sep 2026 22:08:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC901F00893;
	Mon, 14 Sep 2026 22:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789423721;
	bh=2D8MduI9NE1LwI9v9L0sH33MnpUkEkIXfPNIfZ+r5lo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=opxJIJiAwscBcfrKM2vn0gkAYEErmdOFi7AUXYjElqS0Sp9NhPPWlxyYBLKxKaT6B
	 XUwPAEmoFcv1rUMmNliRlachmGmEPQzW+fNCetAHiz6WH6X2hxfLMBxkTuCsenfIxG
	 ieVQb2jPnxHfg2n8KInfjdZxAZMAd7WxWy2Ty6lr0nni5B9dyWzayFqmoNzNqP59xT
	 tMOOY+Ne8UJ+Rv/z24lYrlLuwzPBXk0KYR2fNOueERVXrpi1Ya0JTJZIo6Fp1LZErd
	 J2AgdVEQD3sM5krK+IeqoDfM1+X3XhzBsF9fy1Uo2WZzilddiIlrUfanQGulCic3G1
	 WIxSB2eVRAIew==
Message-ID: <170bcc15-38fc-47cb-89f5-8fe7411111aa@kernel.org>
Date: Mon, 14 Sep 2026 23:08:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] nvmem: add mt6323 PMIC EFUSE driver
To: rva333@protonmail.com, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Ben Grisdale <bengris32@protonmail.ch>
References: <20260911-mt6323-nvmem-v4-0-626dd17531dc@protonmail.com>
 <20260911-mt6323-nvmem-v4-2-626dd17531dc@protonmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260911-mt6323-nvmem-v4-2-626dd17531dc@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 9/11/26 7:33 AM, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add support for the EFUSE controller found in the Mediatek MT6323 PMIC.
> The MT6323 EFUSE stores 24 bytes of hardware-related data, such as
> thermal sensor calibration values.
> 
> Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  MAINTAINERS                  |  5 +++
>  drivers/nvmem/Kconfig        | 11 ++++++
>  drivers/nvmem/Makefile       |  2 ++
>  drivers/nvmem/mt6323-efuse.c | 84 ++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 102 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3a19da74d00c..6ec0ed61260c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16718,6 +16718,11 @@ S:	Maintained
>  F:	drivers/iio/adc/mt6323-auxadc.c
>  F:	include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h
>  
> +MEDIATEK MT6323 PMIC NVMEM DRIVER
> +M:	Roman Vivchar <rva333@protonmail.com>
> +S:	Maintained
> +F:	drivers/nvmem/mt6323-efuse.c

placement is in wrong order, same in make file too.
> +
>  MEDIATEK MT6735 CLOCK & RESET DRIVERS
>  M:	Yassine Oudjana <y.oudjana@protonmail.com>
>  L:	linux-clk@vger.kernel.org
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index c36c2a4c2a0b..5115c46beb97 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -328,6 +328,17 @@ config NVMEM_MTK_EFUSE
>  	  This driver can also be built as a module. If so, the module
>  	  will be called efuse-mtk.
>  
> +config NVMEM_MT6323_EFUSE
> +	tristate "MediaTek MT6323 PMIC EFUSE support"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on MFD_MT6397
> +	help
> +	  This is a driver to access hardware related data like sensor
> +	  calibration, etc.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called efuse-mt6323.
> +
>  config NVMEM_MXS_OCOTP
>  	tristate "Freescale MXS On-Chip OTP Memory Support"
>  	depends on ARCH_MXS || COMPILE_TEST
> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> index 2bbfb9ff1885..626936e4dfdd 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -55,6 +55,8 @@ obj-$(CONFIG_NVMEM_MICROCHIP_OTPC)	+= nvmem-microchip-otpc.o
>  nvmem-microchip-otpc-y			:= microchip-otpc.o
>  obj-$(CONFIG_NVMEM_MTK_EFUSE)		+= nvmem_mtk-efuse.o
>  nvmem_mtk-efuse-y			:= mtk-efuse.o
> +obj-$(CONFIG_NVMEM_MT6323_EFUSE)		+= nvmem_mt6323-efuse.o
> +nvmem_mt6323-efuse-y			:= mt6323-efuse.o
>  obj-$(CONFIG_NVMEM_MXS_OCOTP)		+= nvmem-mxs-ocotp.o
>  nvmem-mxs-ocotp-y			:= mxs-ocotp.o
>  obj-$(CONFIG_NVMEM_NINTENDO_OTP)	+= nvmem-nintendo-otp.o
> diff --git a/drivers/nvmem/mt6323-efuse.c b/drivers/nvmem/mt6323-efuse.c
> new file mode 100644
> index 000000000000..6f6f1cdc2f38
> --- /dev/null
> +++ b/drivers/nvmem/mt6323-efuse.c
> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2026 Roman Vivchar <rva333@protonmail.com>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +
> +#include <linux/mfd/mt6323/registers.h>
> +
> +#define MT6323_EFUSE_DOUT_BASE	MT6323_EFUSE_DOUT_0_15
> +#define MT6323_EFUSE_SIZE	24
> +
> +static int mt6323_efuse_read(void *context, unsigned int offset, void *val,
> +			     size_t bytes)
> +{
> +	struct regmap *map = context;
> +	u16 *buf = val;
> +	u32 tmp;
> +	int ret;
> +
> +	/*
> +	 * A manual loop using regmap_read is required because PWRAP is not
> +	 * a continuous MMIO space, but rather a FSM that doesn't implement the
> +	 * necessary read callback for the regmap_read_raw and regmap_read_bulk
> +	 * functions.
> +	 */
> +	for (size_t i = 0; i < bytes; i += sizeof(*buf)) {
> +		ret = regmap_read(map, MT6323_EFUSE_DOUT_BASE + offset + i, &tmp);
> +		if (ret)
> +			return ret;
> +
> +		*buf++ = tmp;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mt6323_efuse_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct nvmem_config config = {
> +		.name = "mt6323-efuse",
> +		.stride = 2,
> +		.word_size = 2,
> +		.size = MT6323_EFUSE_SIZE,
> +		.reg_read = mt6323_efuse_read,
> +	};
> +	struct nvmem_device *nvmem;
> +	struct regmap *regmap;
> +
> +	/* efuse -> mfd -> pwrap */
> +	regmap = dev_get_regmap(dev->parent->parent, NULL);
> +	if (!regmap)
> +		return dev_err_probe(dev, -ENODEV, "failed to get regmap\n");

can we be more consistent here,

how about
	struct mt6397_chip *mt6323 = dev_get_drvdata(pdev->dev.parent);

and use mt6323->regmap

like how mt6323_regulators driver does it.


> +
> +	config.dev = dev;
> +	config.priv = regmap;
> +
> +	nvmem = devm_nvmem_register(dev, &config);
> +	return PTR_ERR_OR_ZERO(nvmem);
> +}
> +
> +static const struct of_device_id mt6323_efuse_of_match[] = {
> +	{ .compatible = "mediatek,mt6323-efuse" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, mt6323_efuse_of_match);
> +
> +static struct platform_driver mt6323_efuse_driver = {
> +	.probe = mt6323_efuse_probe,
> +	.driver = {
> +		.name = "mt6323-efuse",
> +		.of_match_table = mt6323_efuse_of_match,
> +	},
> +};
> +module_platform_driver(mt6323_efuse_driver);
> +
> +MODULE_DESCRIPTION("MediaTek MT6323 PMIC EFUSE driver");
> +MODULE_LICENSE("GPL");
> 


