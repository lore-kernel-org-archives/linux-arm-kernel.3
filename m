Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E4EC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 13:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4A1uiTwql9rZD6vc75+qX0tUPS+SmOuxZnvaTjwFmcs=; b=LqtCK7a8s47pQ7JbDhzIftvIYL
	oFnvgBo1wh9MymDQ/qEeifm1uR+DzeWpDaWKuRZW7ICnrIG4zOxgbB3zfxcXNr0rQP70bUDbkUgX0
	mUJEaAIH9UaAwgcXXWNRihUaUiC04cafhTUX08qGZQ7ZnY2oHpBF5rglB23eWzqk43y9vF4fMU1P6
	0j35L3rVvGR2pcopGxi9lL0ZGr+d5nj0n34gHSxFQ3rWFu95bRbbUAef02gRYKY0qxKAj+goq/JhF
	RdBFqYP+fG6L4jDzGsXR/SQWXofdaD9uxx4o1ETdiKCPQWWANA1j6U4MAFoud4zmMoXjBHCE+kg0B
	bkF9fFAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Pbf-0000000DCP0-0ge7;
	Thu, 17 Apr 2025 13:48:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5PO8-0000000DAOS-0Dus
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 13:34:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3AE6868436;
	Thu, 17 Apr 2025 13:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC7AC4CEE4;
	Thu, 17 Apr 2025 13:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744896882;
	bh=SB34PBY0RNUAZRZBFCty6nn1wf0hugGM1UTlDrumSZw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tGSA3AaJ3Au/8D16cER7nJP8rmOy2xPt8yhqiBtcGf29IqtyDhP7bTtVuQctPm8up
	 FuPLhZKvP+etB6rz8o5fjVaxxOURWKXTd1iKeK59cvhbkrqmaZn3Egv7h2JMiAi4q1
	 MJnwTHML5RWLCZZ1r0LW8DGmLJZKmr0tRK5Q1ZHfViAbCQIXFTqaIu3I8h5RtcUJnD
	 tFg+yyC4OyuPhQzgTGV5fH2AXi01n6F0P0oBGedrW+rPlGrS0abEXrPjjSGs4eIXeM
	 ygs7YqVw9Yh00+11ME717PMi1GAuFAfbRy6Jd2JYuXD7cakrcxKH1ALj7vsWvrcfRk
	 7eWGaw1B6XyrA==
Message-ID: <81fb1290-fb39-40b7-9d79-f147fae5b269@kernel.org>
Date: Thu, 17 Apr 2025 14:34:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] nvmem: Add spmi-nvmem driver
To: fnkl.kernel@gmail.com, Sven Peter <sven@svenpeter.dev>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
 <20250415-spmi-nvmem-v1-2-22067be253cf@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20250415-spmi-nvmem-v1-2-22067be253cf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 15/04/2025 22:52, Sasha Finkelstein via B4 Relay wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> This driver exposes a SPMI device as an NVMEM device.
> It is intended to be used with e.g. PMUs/PMICs that are used to
> hold power management configuration, such as used on Apple Silicon
> Macs.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>   MAINTAINERS                |  1 +
>   drivers/nvmem/Kconfig      | 14 +++++++++++
>   drivers/nvmem/Makefile     |  2 ++
>   drivers/nvmem/spmi-nvmem.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 79 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e7b2d0df81b387ba5398957131971588dc7b89dc..63c12f901aed1f3e6de8227d6db34af1bd046fe6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2298,6 +2298,7 @@ F:	drivers/iommu/io-pgtable-dart.c
>   F:	drivers/irqchip/irq-apple-aic.c
>   F:	drivers/nvme/host/apple.c
>   F:	drivers/nvmem/apple-efuses.c
> +F:	drivers/nvmem/spmi-nvmem.c
>   F:	drivers/pinctrl/pinctrl-apple-gpio.c
>   F:	drivers/pwm/pwm-apple.c
>   F:	drivers/soc/apple/*
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 8671b7c974b933e147154bb40b5d41b5730518d2..9ec907d8aa6ef7df0ea45cc35e92d8239d2705ee 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -310,6 +310,20 @@ config NVMEM_SNVS_LPGPR
>   	  This driver can also be built as a module. If so, the module
>   	  will be called nvmem-snvs-lpgpr.
>   
> +config NVMEM_SPMI
> +	tristate "Generic SPMI NVMEM"
> +	default ARCH_APPLE
Why default is set to ARCH_APPLE?

This will endup with y in arm64 defconfig, means increasing the size of 
kernel.

should it be:

depends on ARCH_APPLE || COMPILE_TEST


--srini
> +	depends on SPMI
> +	select REGMAP_SPMI
> +	help
> +	  Say y here to build a generic driver to expose a SPMI device
> +	  as a NVMEM provider. This can be used for PMIC/PMU devices which
> +	  are used to store power and RTC-related settings on certain
> +	  platforms, such as Apple Silicon Macs.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called nvmem-spmi.
> +
>   config NVMEM_SPMI_SDAM
>   	tristate "SPMI SDAM Support"
>   	depends on SPMI
> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> index 5b77bbb6488bf89bfb305750a1cbf4a6731a0a58..b639f4284184db026bb27b11e04d54b8f7ff166f 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -64,6 +64,8 @@ obj-$(CONFIG_NVMEM_SC27XX_EFUSE)	+= nvmem-sc27xx-efuse.o
>   nvmem-sc27xx-efuse-y			:= sc27xx-efuse.o
>   obj-$(CONFIG_NVMEM_SNVS_LPGPR)		+= nvmem_snvs_lpgpr.o
>   nvmem_snvs_lpgpr-y			:= snvs_lpgpr.o
> +obj-$(CONFIG_NVMEM_SPMI)		+= nvmem_spmi.o
> +nvmem_spmi-y				:= spmi-nvmem.o
>   obj-$(CONFIG_NVMEM_SPMI_SDAM)		+= nvmem_qcom-spmi-sdam.o
>   nvmem_qcom-spmi-sdam-y			+= qcom-spmi-sdam.o
>   obj-$(CONFIG_NVMEM_SPRD_EFUSE)		+= nvmem_sprd_efuse.o
> diff --git a/drivers/nvmem/spmi-nvmem.c b/drivers/nvmem/spmi-nvmem.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..fff6162cb22dd7ab45883f004f5b63ebae014698
> --- /dev/null
> +++ b/drivers/nvmem/spmi-nvmem.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Generic SPMI NVMEM driver
> + *
> + * Copyright The Asahi Linux Contributors
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/of.h>
> +#include <linux/spmi.h>
> +#include <linux/regmap.h>
> +
> +static const struct regmap_config spmi_regmap_config = {
> +	.reg_bits	= 16,
> +	.val_bits	= 8,
> +	.max_register	= 0xffff,
> +};
> +
> +static int spmi_nvmem_probe(struct spmi_device *sdev)
> +{
> +	struct regmap *regmap;
> +	struct nvmem_config nvmem_cfg = {
> +		.dev = &sdev->dev,
> +		.name = "spmi_nvmem",
> +		.id = NVMEM_DEVID_AUTO,
> +		.word_size = 1,
> +		.stride = 1,
> +		.size = 0xffff,
> +		.reg_read = (void *)regmap_bulk_read,
> +		.reg_write = (void *)regmap_bulk_write,
> +	};
> +
> +	regmap = devm_regmap_init_spmi_ext(sdev, &spmi_regmap_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	nvmem_cfg.priv = regmap;
> +
> +	return PTR_ERR_OR_ZERO(devm_nvmem_register(&sdev->dev, &nvmem_cfg));
> +}
> +
> +static const struct of_device_id spmi_nvmem_id_table[] = {
> +	{ .compatible = "spmi-nvmem" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, spmi_nvmem_id_table);
> +
> +static struct spmi_driver spmi_nvmem_driver = {
> +	.probe = spmi_nvmem_probe,
> +	.driver = {
> +		.name = "spmi-nvmem",
> +		.of_match_table	= spmi_nvmem_id_table,
> +	},
> +};
> +
> +module_spmi_driver(spmi_nvmem_driver);
> +
> +MODULE_LICENSE("Dual MIT/GPL");
> +MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
> +MODULE_DESCRIPTION("SPMI NVMEM driver");
> 

