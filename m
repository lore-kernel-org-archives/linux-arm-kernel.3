Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B48C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 12:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSDhGE/I73wVs8EWJhkzU0BZPvm+bkT9p0rnjhxFEjo=; b=E7PvEFDg4nx9MBFD4k1+lJj+rx
	a6VQOInnve4eEPEBjdQakoe/f91DThJTIlpexLyeqnmVSTK6hzqzR24axYZftYsGcSW1wYWS9b6sN
	smE30/z++XLDKp+j4Ai3OUWMkLU23ylNUag7AXWd6FPDpqAuqMhPVjNgIxwhoryp53W5ZyY9wAN2I
	5Yo2ehhL+3MJdq1ZinaaHWQThskq/mwvosL5pfFPYGp8eQIYGJhfu0AM755i+PfQCYUVLNkuUyKEj
	PJl6cxU9pZaOVklo9V9Jx+Wb6Mgf1GOV1r3m+xWDOtZN9rQ8Uv+MPAM19AXOFGhKxrJB4EAJEw0nQ
	W2+ebgkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trz6q-00000005kFx-3dIz;
	Tue, 11 Mar 2025 12:53:24 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trz1c-00000005jKt-1tnF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 12:48:01 +0000
Date: Tue, 11 Mar 2025 08:47:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1741697278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tSDhGE/I73wVs8EWJhkzU0BZPvm+bkT9p0rnjhxFEjo=;
	b=w6IeK/gpWjLIDUIay8CMOgyHu+3P8hX4rvUDV5+Lxo/iSNYjOn97H4Rl/odWkN97lNcHU9
	yRtydCjmo3JedwXmgO11G2+psK1xry7xtLZjfQElXfVW+bIvZ7JzjrOgaJZx9HiwtiC92N
	h/bp3j+1aIKeAmelrPxfvjGCHvEQpxm/ujGXd2mGzA8fcBwZp69Jquf5KRiV61FteGCF4F
	Q9yoBJdwW9QNetgjsPXeFZLzU/CiZpO9Wrsz6xpBTWsHw9ttwr7RnDP8yWr/p2SCpGbrWX
	XJSat2TQ/wBwRHTWU4PkP+6x0GjdULCcIycy+s+vqTxN6lo2m3MZoEW3Fla8xA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Jean-Francois Bortolotti <jeff@borto.fr>
Subject: Re: [PATCH v3 2/3] spmi: add a spmi driver for Apple SoC
Message-ID: <Z9Aw-MTUdldYRrP5@blossom>
References: <20250310-spmi-v3-0-92a82e7d9f0d@gmail.com>
 <20250310-spmi-v3-2-92a82e7d9f0d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250310-spmi-v3-2-92a82e7d9f0d@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_054800_637795_3F661CE7 
X-CRM114-Status: GOOD (  27.38  )
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

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Mon , Mar 10, 2025 at 11:07:59PM +0100, Sasha Finkelstein via B4 Relay a écrit :
> From: Jean-Francois Bortolotti <jeff@borto.fr>
> 
> The connected PMU contains several useful nvmem cells such as RTC offset,
> boot failure counters, reboot/shutdown selector, and a few others.
> In addition M3+ machines have their USB-PD controller connected via SPMI.
> 
> Signed-off-by: Jean-Francois Bortolotti <jeff@borto.fr>
> Reviewed-by: Sven Peter <sven@svenpeter.dev>
> Co-developed-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  MAINTAINERS                          |   1 +
>  drivers/spmi/Kconfig                 |   8 ++
>  drivers/spmi/Makefile                |   1 +
>  drivers/spmi/spmi-apple-controller.c | 168 +++++++++++++++++++++++++++++++++++
>  4 files changed, 178 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 271ff8110df83c2d4fe7fbbfffc0a72259460bc5..9006695261d29fbc1e15659c2b43d7afeee0b656 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2254,6 +2254,7 @@ F:	drivers/nvmem/apple-efuses.c
>  F:	drivers/pinctrl/pinctrl-apple-gpio.c
>  F:	drivers/pwm/pwm-apple.c
>  F:	drivers/soc/apple/*
> +F:	drivers/spmi/spmi-apple-controller.c
>  F:	drivers/watchdog/apple_wdt.c
>  F:	include/dt-bindings/interrupt-controller/apple-aic.h
>  F:	include/dt-bindings/pinctrl/apple.h
> diff --git a/drivers/spmi/Kconfig b/drivers/spmi/Kconfig
> index 73780204631463631cabcbad5bf83e8dbbee94ce..9005fa91d9f4e541403ccc7bf84e0592402ac41e 100644
> --- a/drivers/spmi/Kconfig
> +++ b/drivers/spmi/Kconfig
> @@ -11,6 +11,14 @@ menuconfig SPMI
>  
>  if SPMI
>  
> +config SPMI_APPLE
> +	tristate "Apple SoC SPMI Controller platform driver"
> +	depends on ARCH_APPLE || COMPILE_TEST
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  SPMI controller present on many Apple SoCs, including the
> +	  t8103 (M1) and t600x (M1 Pro/Max).
> +
>  config SPMI_HISI3670
>  	tristate "Hisilicon 3670 SPMI Controller"
>  	select IRQ_DOMAIN_HIERARCHY
> diff --git a/drivers/spmi/Makefile b/drivers/spmi/Makefile
> index 7f152167bb05b2c24a0f9669f60278152898eebb..38ac635645ba65aa46cb5e8a50072ed9771e229b 100644
> --- a/drivers/spmi/Makefile
> +++ b/drivers/spmi/Makefile
> @@ -4,6 +4,7 @@
>  #
>  obj-$(CONFIG_SPMI)	+= spmi.o spmi-devres.o
>  
> +obj-$(CONFIG_SPMI_APPLE)	+= spmi-apple-controller.o
>  obj-$(CONFIG_SPMI_HISI3670)	+= hisi-spmi-controller.o
>  obj-$(CONFIG_SPMI_MSM_PMIC_ARB)	+= spmi-pmic-arb.o
>  obj-$(CONFIG_SPMI_MTK_PMIF)	+= spmi-mtk-pmif.o
> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..697b3e8bb023566f17911fc222666d84f5e14c91
> --- /dev/null
> +++ b/drivers/spmi/spmi-apple-controller.c
> @@ -0,0 +1,168 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Apple SoC SPMI device driver
> + *
> + * Copyright The Asahi Linux Contributors
> + *
> + * Inspired by:
> + *		OpenBSD support Copyright (c) 2021 Mark Kettenis <kettenis@openbsd.org>
> + *		Correllium support Copyright (C) 2021 Corellium LLC
> + *		hisi-spmi-controller.c
> + *		spmi-pmic-arb.c Copyright (c) 2021, The Linux Foundation.
> + */
> +
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
> +#include <linux/spmi.h>
> +
> +/* SPMI Controller Registers */
> +#define SPMI_STATUS_REG 0
> +#define SPMI_CMD_REG 0x4
> +#define SPMI_RSP_REG 0x8
> +
> +#define SPMI_RX_FIFO_EMPTY BIT(24)
> +
> +#define REG_POLL_INTERVAL_US 10000
> +#define REG_POLL_TIMEOUT_US (REG_POLL_INTERVAL_US * 5)
> +
> +struct apple_spmi {
> +	void __iomem *regs;
> +};
> +
> +#define poll_reg(spmi, reg, val, cond) \
> +	readl_poll_timeout((spmi)->regs + (reg), (val), (cond), \
> +			   REG_POLL_INTERVAL_US, REG_POLL_TIMEOUT_US)
> +
> +static inline u32 apple_spmi_pack_cmd(u8 opc, u8 sid, u16 saddr, size_t len)
> +{
> +	return opc | sid << 8 | saddr << 16 | (len - 1) | (1 << 15);
> +}
> +
> +/* Wait for Rx FIFO to have something */
> +static int apple_spmi_wait_rx_not_empty(struct spmi_controller *ctrl)
> +{
> +	struct apple_spmi *spmi = spmi_controller_get_drvdata(ctrl);
> +	int ret;
> +	u32 status;
> +
> +	ret = poll_reg(spmi, SPMI_STATUS_REG, status, !(status & SPMI_RX_FIFO_EMPTY));
> +	if (ret) {
> +		dev_err(&ctrl->dev,
> +			"failed to wait for RX FIFO not empty\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> +			 u16 saddr, u8 *buf, size_t len)
> +{
> +	struct apple_spmi *spmi = spmi_controller_get_drvdata(ctrl);
> +	u32 spmi_cmd = apple_spmi_pack_cmd(opc, sid, saddr, len);
> +	u32 rsp;
> +	size_t len_read = 0;
> +	u8 i;
> +	int ret;
> +
> +	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> +
> +	ret = apple_spmi_wait_rx_not_empty(ctrl);
> +	if (ret)
> +		return ret;
> +
> +	/* Discard SPMI reply status */
> +	readl(spmi->regs + SPMI_RSP_REG);
> +
> +	/* Read SPMI data reply */
> +	while (len_read < len) {
> +		rsp = readl(spmi->regs + SPMI_RSP_REG);
> +		i = 0;
> +		while ((len_read < len) && (i < 4)) {
> +			buf[len_read++] = ((0xff << (8 * i)) & rsp) >> (8 * i);
> +			i += 1;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> +			  u16 saddr, const u8 *buf, size_t len)
> +{
> +	struct apple_spmi *spmi = spmi_controller_get_drvdata(ctrl);
> +	u32 spmi_cmd = apple_spmi_pack_cmd(opc, sid, saddr, len);
> +	size_t i = 0, j;
> +	int ret;
> +
> +	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> +
> +	while (i < len) {
> +		j = 0;
> +		spmi_cmd = 0;
> +		while ((j < 4) & (i < len))
> +			spmi_cmd |= buf[i++] << (j++ * 8);
> +
> +		writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> +	}
> +
> +	ret = apple_spmi_wait_rx_not_empty(ctrl);
> +	if (ret)
> +		return ret;
> +
> +	/* Discard */
> +	readl(spmi->regs + SPMI_RSP_REG);
> +
> +	return 0;
> +}
> +
> +static int apple_spmi_probe(struct platform_device *pdev)
> +{
> +	struct apple_spmi *spmi;
> +	struct spmi_controller *ctrl;
> +	int ret;
> +
> +	ctrl = devm_spmi_controller_alloc(&pdev->dev, sizeof(*spmi));
> +	if (IS_ERR(ctrl))
> +		return -ENOMEM;
> +
> +	spmi = spmi_controller_get_drvdata(ctrl);
> +
> +	spmi->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(spmi->regs))
> +		return PTR_ERR(spmi->regs);
> +
> +	ctrl->dev.of_node = pdev->dev.of_node;
> +
> +	ctrl->read_cmd = spmi_read_cmd;
> +	ctrl->write_cmd = spmi_write_cmd;
> +
> +	ret = devm_spmi_controller_add(&pdev->dev, ctrl);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "spmi_controller_add failed\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id apple_spmi_match_table[] = {
> +	{ .compatible = "apple,spmi", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, apple_spmi_match_table);
> +
> +static struct platform_driver apple_spmi_driver = {
> +	.probe		= apple_spmi_probe,
> +	.driver		= {
> +		.name	= "apple-spmi",
> +		.of_match_table = apple_spmi_match_table,
> +	},
> +};
> +module_platform_driver(apple_spmi_driver);
> +
> +MODULE_AUTHOR("Jean-Francois Bortolotti <jeff@borto.fr>");
> +MODULE_DESCRIPTION("Apple SoC SPMI driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.48.1
> 
> 

