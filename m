Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05045C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 03:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6TrL7BinwkWHJjPU+02xbpS7IyOpQNUsweu7b9r8yR4=; b=2CmadYG5mCad+/pSFzQHUzeJs5
	5lh4ORWKqIArOhUm+Ramd9Ppte+tCPQvq1hLKO4vPhSEQ8f1dSOmcQP5h3vc+rrcRa/5LCmecMhIO
	yr/VlyenrxJ2xsu/QAhZuUFRrUtP1EhK5/2xhHMYUaT4dcygv6txuEjqDGLQteFwfnuV/5y/o1A3t
	Lz2IBJQ6gozdhNCh4y5go3oB+2S7izVbkNuWxDaEzGsyoXp4bZ9RGJRpjVwUxWLjHnE9V1/kk+pkQ
	sxP9BWspmDibV8WIYmLvbdZdSwd2zAr/krdm7dN9+HeLq5AKtptw87ZT4J07yC00OF4jNmRANWNwv
	LREn22ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLvr3-00000006aYt-08mC;
	Mon, 02 Jun 2025 03:28:53 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLvoq-00000006Zq9-0nkD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 03:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=6TrL7BinwkWHJjPU+02xbpS7IyOpQNUsweu7b9r8yR4=;
	b=g4FQDeae74gunvn3OmQwZrqwZiP9CmQmErv3Ym178a+mpFBE+fpVE+tMV23Ssv
	134fmUZSj7sKRq6Ihzq5FfBRhDFAl8qqn17uHz6C9lM8U9leCdRraqFx+lTMe8c0
	rQK2uLgu8GznEQY47aleDAJF2j8UmqLbn6G7KbjKV/wHQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAHxs7IGT1oRPJ4Ag--.18543S3;
	Mon, 02 Jun 2025 11:26:03 +0800 (CST)
Date: Mon, 2 Jun 2025 11:26:00 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/6] bus: add driver for IMX AIPSTZ bridge
Message-ID: <aD0ZyPam+q3akJLx@dragon>
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
 <20250415171919.5623-4-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415171919.5623-4-laurentiumihalcea111@gmail.com>
X-CM-TRANSID: Ms8vCgAHxs7IGT1oRPJ4Ag--.18543S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxKr1rKF1DCr47Zw1xXFW3GFg_yoW7tr4xpa
	y8XF1fGF47XF13twsxKrW29F98Kan7G34j9ry7W343urn8uFyvkrZY9rySkF4rCr9rt3Wj
	qrWYqrW7ur4qv3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U3EfrUUUUU=
X-Originating-IP: [117.83.141.151]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhtgZWg9DPQ+BgAAsZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_202636_600473_3E878D74 
X-CRM114-Status: GOOD (  35.66  )
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

On Tue, Apr 15, 2025 at 01:19:16PM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> The secure AHB to IP Slave (AIPSTZ) bus bridge provides access control
> configurations meant to restrict access to certain peripherals.
> Some of the configurations include:
> 
> 	1) Marking masters as trusted for R/W. Based on this
> 	(and the configuration of the accessed peripheral), the bridge
> 	may choose to abort the R/W transactions issued by certain
> 	masters.
> 
> 	2) Allowing/disallowing write accesses to peripherals.
> 
> Add driver for this IP. Since there's currently no framework for
> access controllers (and since there's currently no need for having
> flexibility w.r.t the configurations) all this driver does is it
> applies a relaxed, "default" configuration, in which all masters
> are trusted for R/W.
> 
> Note that some instances of this IP (e.g: AIPSTZ5 on i.MX8MP) may be tied
> to a power domain and may lose their configuration when the domain is
> powered off. This is why the configuration has to be restored when the
> domain is powered on.
> 
> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  drivers/bus/Kconfig      |  6 +++
>  drivers/bus/Makefile     |  1 +
>  drivers/bus/imx-aipstz.c | 92 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 99 insertions(+)
>  create mode 100644 drivers/bus/imx-aipstz.c
> 
> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> index ff669a8ccad9..fe7600283e70 100644
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -87,6 +87,12 @@ config HISILICON_LPC
>  	  Driver to enable I/O access to devices attached to the Low Pin
>  	  Count bus on the HiSilicon Hip06/7 SoC.
>  
> +config IMX_AIPSTZ
> +	tristate "Support for IMX Secure AHB to IP Slave bus (AIPSTZ) bridge"
> +	depends on ARCH_MXC
> +	help
> +	  Enable support for IMX AIPSTZ bridge.
> +
>  config IMX_WEIM
>  	bool "Freescale EIM DRIVER"
>  	depends on ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
> index cddd4984d6af..8e693fe8a03a 100644
> --- a/drivers/bus/Makefile
> +++ b/drivers/bus/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_FSL_MC_BUS)	+= fsl-mc/
>  
>  obj-$(CONFIG_BT1_APB)		+= bt1-apb.o
>  obj-$(CONFIG_BT1_AXI)		+= bt1-axi.o
> +obj-$(CONFIG_IMX_AIPSTZ)	+= imx-aipstz.o
>  obj-$(CONFIG_IMX_WEIM)		+= imx-weim.o
>  obj-$(CONFIG_INTEL_IXP4XX_EB)	+= intel-ixp4xx-eb.o
>  obj-$(CONFIG_MIPS_CDMM)		+= mips_cdmm.o
> diff --git a/drivers/bus/imx-aipstz.c b/drivers/bus/imx-aipstz.c
> new file mode 100644
> index 000000000000..44db40dae71b
> --- /dev/null
> +++ b/drivers/bus/imx-aipstz.c
> @@ -0,0 +1,92 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#define IMX_AIPSTZ_MPR0 0x0
> +
> +struct imx_aipstz_config {
> +	u32 mpr0;
> +};

Would it be more future-proof to have something like this?

struct imx_aipstz_priv {
	__iomem *base;
	const struct imx_aipstz_config *default_cfg;
}; 

With imx_aipstz_priv being drvdata, it could be easily scaled to have
more data later if needed. 

Shawn

> +
> +static void imx_aipstz_apply_default(void __iomem *base,
> +				     const struct imx_aipstz_config *default_cfg)
> +{
> +	writel(default_cfg->mpr0, base + IMX_AIPSTZ_MPR0);
> +}
> +
> +static int imx_aipstz_probe(struct platform_device *pdev)
> +{
> +	const struct imx_aipstz_config *default_cfg;
> +	void __iomem *base;
> +
> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> +	if (IS_ERR(base))
> +		return dev_err_probe(&pdev->dev, -ENOMEM,
> +				     "failed to get/ioremap AC memory\n");
> +
> +	default_cfg = of_device_get_match_data(&pdev->dev);
> +
> +	imx_aipstz_apply_default(base, default_cfg);
> +
> +	dev_set_drvdata(&pdev->dev, base);
> +
> +	pm_runtime_set_active(&pdev->dev);
> +	devm_pm_runtime_enable(&pdev->dev);
> +
> +	return devm_of_platform_populate(&pdev->dev);
> +}
> +
> +static int imx_aipstz_runtime_resume(struct device *dev)
> +{
> +	const struct imx_aipstz_config *default_cfg;
> +	void __iomem *base;
> +
> +	base = dev_get_drvdata(dev);
> +	default_cfg = of_device_get_match_data(dev);
> +
> +	/* restore potentially lost configuration during domain power-off */
> +	imx_aipstz_apply_default(base, default_cfg);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops imx_aipstz_pm_ops = {
> +	RUNTIME_PM_OPS(NULL, imx_aipstz_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> +};
> +
> +/*
> + * following configuration is equivalent to:
> + *	masters 0-7 => trusted for R/W + use AHB's HPROT[1] to det. privilege
> + */
> +static const struct imx_aipstz_config imx8mp_aipstz_default_cfg = {
> +	.mpr0 = 0x77777777,
> +};
> +
> +static const struct of_device_id imx_aipstz_of_ids[] = {
> +	{ .compatible = "fsl,imx8mp-aipstz", .data = &imx8mp_aipstz_default_cfg },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, imx_aipstz_of_ids);
> +
> +static struct platform_driver imx_aipstz_of_driver = {
> +	.probe = imx_aipstz_probe,
> +	.driver = {
> +		.name = "imx-aipstz",
> +		.of_match_table = imx_aipstz_of_ids,
> +		.pm = pm_ptr(&imx_aipstz_pm_ops),
> +	},
> +};
> +module_platform_driver(imx_aipstz_of_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("IMX secure AHB to IP Slave bus (AIPSTZ) bridge driver");
> +MODULE_AUTHOR("Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>");
> -- 
> 2.34.1
> 


