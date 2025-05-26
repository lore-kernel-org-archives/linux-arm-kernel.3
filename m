Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E95C54FC6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 04:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hcuVo6LWkD1SwnBVQu/4ZcvKERzCfZiHAL7OA+IK/o=; b=lFIJnSD6FOuzi8u5KaB84slFsY
	kKyejUr/7YMP/kGi4MsXVwCBIaPj2Ao1vNwICPvwRc3TgCT63vRL+DlqWKBQRdL6ud2sY/E2542Vo
	nuylBejEsIhPx2XQwRA5iy1Eq5yCJUb6NVjxCM99edyBZgf6SgzTVKagvHscewvdtxP/Qpfqh7RXO
	sLNYLYT6cYe8RhgGNEviJDo2Cl3mvXMP9Tav5VWRukXIZPbR81MLbSZPX8ErmgZWVs5t9jVabGkvv
	VMbJo/+pHRHwyC+Mjlxw9EnYJ+qNtvNzgNO63+/AhFZehHU0oMnM9PXpYVhMaeNmTXWiVwSN1g06j
	7FQ3Cl/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJP1w-000000082Dx-27Cj;
	Mon, 26 May 2025 04:01:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJOzn-0000000829U-0Mth
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 03:59:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F300C60010;
	Mon, 26 May 2025 03:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF903C4CEE7;
	Mon, 26 May 2025 03:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748231965;
	bh=9Em7YYlNAlyLb9TtYllH5RvyM+QEjD2zbBPjDbDZC3k=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=NWj6Imzjk6HkNM5kMLyupo2cRf4CIEK+lpQwhC3tmaO19WnnwrLz3O7oFw431Ek9z
	 e3FCgyVa1/yMh886U4lJdj43Q7umMx1WUcl4kC8OyedfzMmUV+nxRDNoYc0eItpisP
	 1YZBS7GsZGMPUSU+usjHQX/s0fcOO/zHLCHG3haQbWHrTlPjSTffg/jyOXTpQBsuEr
	 qVtT/EyPi5p13sgeepXTsSjpoWuvJcMXFu+wNpiwPaOyhuyPWir9h3xM3cdfC0v7qM
	 H0gwbDKuZzR+5t/44OZ9GCJiDtqc/iKJFYCuRpoqEEgCavdNzatSGqctcQyR3ISDOj
	 X5tJzt8trJUOw==
Message-ID: <87943ef2-120f-429e-8de9-50df84caf71a@kernel.org>
Date: Mon, 26 May 2025 05:59:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Driver for Xilinx ZynqMP AXI Timeout Block (ATB)
To: Maciej Andrzejewski <maciej.andrzejewski@m-works.net>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <michal.simek@amd.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, maciej.andrzejewski@iceye.com
References: <20250525195955.2843076-1-maciej.andrzejewski@m-works.net>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250525195955.2843076-1-maciej.andrzejewski@m-works.net>
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

On 25/05/2025 21:59, Maciej Andrzejewski wrote:
> This module implements a driver for the Xilinx AXI Timeout Block (ATB).
> The ATB is used to detect and handle timeouts on AXI transactions.
> It supports configuration and handling of timeout interrupts for both
> the Full Power Domain (FPD) and Low Power Domain (LPD) in Xilinx SoCs.
> The driver reads configuration from the device tree, sets up the necessary
> registers, and handles interrupts to report timeout events.
> 
> AXI timeouts can be harmful as they stall the bus and can potentially stall
> the entire Linux system. Due to hardware limitations, this driver cannot
> completely prevent bus stalls; only a limited number of AXI timeouts can be
> registered before the bus will eventually stall.
> 
> It is important to note that this driver should produce dmesg error output
> (grep for "atb: Timeout detected") to notify the user that the system
> configuration is not properly handled. Once an AXI timeout is detected,
> additional measures should be taken to address the issue.
> 
> To make this driver work, the device tree must contain the following
> properties:
> 
> 	atb {
> 		compatible = "xlnx,zynqmp-atb";
> 		status = "okay";
> 
> 		fpd_afifs1_enable;
> 		fpd_afifs0_enable;
> 		fpd_fpds_enable;
> 		lpd_afifs2_enable;
> 		lpd_lpdm_enable;
> 	};
> 
> The bool properties enable the corresponding interrupts for the
> FPD and LPD.
> The driver will read these properties and configure the ATB accordingly.
> If the bool property is not present, the functionality for this ATB will be
> disabled.
> 
> Enable this driver by selecting ZYNQMP_ATB in the kernel config.
> 
> Signed-off-by: Maciej Andrzejewski <maciej.andrzejewski@m-works.net>
> Signed-off-by: Maciej Andrzejewski <maciej.andrzejewski@iceye.com>
> ---
>  MAINTAINERS                     |   6 +
>  drivers/soc/xilinx/Kconfig      |  53 ++--
>  drivers/soc/xilinx/Makefile     |   1 +
>  drivers/soc/xilinx/zynqmp_atb.c | 417 ++++++++++++++++++++++++++++++++
>  4 files changed, 457 insertions(+), 20 deletions(-)
>  create mode 100644 drivers/soc/xilinx/zynqmp_atb.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3c6f9e70ace0..37cd15a59d83 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26734,6 +26734,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/nvmem/xlnx,zynqmp-nvmem.yaml
>  F:	drivers/nvmem/zynqmp_nvmem.c
>  
> +XILINX ZYNQMP ATB DRIVER
> +M:	Maciej Andrzejewski <maciej.andrzejewski@m-works.net>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-atb.txt
> +F:	drivers/soc/xilinx/zynqmp_atb.c
> +
>  XILLYBUS DRIVER
>  M:	Eli Billauer <eli.billauer@gmail.com>
>  L:	linux-kernel@vger.kernel.org
> diff --git a/drivers/soc/xilinx/Kconfig b/drivers/soc/xilinx/Kconfig
> index 49d69d6e18fe..b2b1187c70ec 100644
> --- a/drivers/soc/xilinx/Kconfig
> +++ b/drivers/soc/xilinx/Kconfig
> @@ -2,28 +2,41 @@
>  menu "Xilinx SoC drivers"
>  
>  config ZYNQMP_POWER
> -	bool "Enable Xilinx Zynq MPSoC Power Management driver"
> -	depends on PM && ZYNQMP_FIRMWARE
> -	default y
> -	select MAILBOX
> -	select ZYNQMP_IPI_MBOX
> -	help
> -	  Say yes to enable power management support for ZyqnMP SoC.
> -	  This driver uses firmware driver as an interface for power
> -	  management request to firmware. It registers isr to handle
> -	  power management callbacks from firmware. It registers mailbox client
> -	  to handle power management callbacks from firmware.
> +    bool "Enable Xilinx Zynq MPSoC Power Management driver"
> +    depends on PM && ZYNQMP_FIRMWARE
> +    default y
> +    select MAILBOX
> +    select ZYNQMP_IPI_MBOX

Why doing this change? Code was correct before.

> +    help
> +      Say yes to enable power management support for ZyqnMP SoC.
> +      This driver uses firmware driver as an interface for power
> +      management request to firmware. It registers isr to handle
> +      power management callbacks from firmware. It registers mailbox client
> +      to handle power management callbacks from firmware.
>  
> -	  If in doubt, say N.
> +      If in doubt, say N.
>  
>  config XLNX_EVENT_MANAGER
> -	bool "Enable Xilinx Event Management Driver"
> -	depends on ZYNQMP_FIRMWARE
> -	default ZYNQMP_FIRMWARE
> -	help
> -	  Say yes to enable event management support for Xilinx.
> -	  This driver uses firmware driver as an interface for event/power
> -	  management request to firmware.
> +    bool "Enable Xilinx Event Management Driver"
> +    depends on ZYNQMP_FIRMWARE
> +    default ZYNQMP_FIRMWARE
> +    help
> +      Say yes to enable event management support for Xilinx.
> +      This driver uses firmware driver as an interface for event/power
> +      management request to firmware.
> +
> +      If in doubt, say N.
> +
> +config ZYNQMP_ATB
> +    bool "Enable ZynqMP AXI Timeout Block driver"
> +    depends on ARCH_ZYNQMP
> +    help
> +      Say yes to enable ZynqMP AXI Timeout Block driver.
> +      The ATB is used to detect and handle timeouts on AXI transactions.
> +      It supports configuration and handling of timeout interrupts for both
> +      the Full Power Domain (FPD) and Low Power Domain (LPD) in
> +      Xilinx SoCs. The driver reads configuration from the device tree,
> +      sets up the necessary registers, and handles interrupts to report
> +      timeout events.
>  
> -	  If in doubt, say N.
>  endmenu
> diff --git a/drivers/soc/xilinx/Makefile b/drivers/soc/xilinx/Makefile
> index 33d94395fd87..30768593701e 100644
> --- a/drivers/soc/xilinx/Makefile
> +++ b/drivers/soc/xilinx/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_ZYNQMP_POWER)	+= zynqmp_power.o
>  obj-$(CONFIG_XLNX_EVENT_MANAGER)	+= xlnx_event_manager.o
> +obj-$(CONFIG_ZYNQMP_ATB) += zynqmp_atb.o
> \ No newline at end of file

All youro patches have patch warnings.

> diff --git a/drivers/soc/xilinx/zynqmp_atb.c b/drivers/soc/xilinx/zynqmp_atb.c
> new file mode 100644
> index 000000000000..41e942352b38
> --- /dev/null
> +++ b/drivers/soc/xilinx/zynqmp_atb.c
> @@ -0,0 +1,417 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/**
> + * Implementation of Xilinx ZynqMP AXI Timeout Block peripheral driver.
> + *
> + * Copyright (C) 2025 ICEYE,
> + * Maciej Andrzejewski <maciej.andrzejewski@iceye.com>
> + */
> +

...

> +
> +	return ret;
> +}
> +
> +/**
> + * read_dts - Read DTS configuration for the driver
> + * @config: Pointer to driver configuration
> + * @return: 0 on success, otherwise error code
> + */
> +static int read_dts(struct device *dev, struct atb_config *config)
> +{
> +	struct device_node *np;
> +
> +	np = of_find_node_by_name(NULL, MOD_NAME);

No, you cannot do such stuff.

Match properly your driver.

> +	if (!np) {
> +		dev_err(dev, "unable to find device tree node '%s'", MOD_NAME);

So you will print such error on every machine, x86, arm (other vendors,
like Qualcomm), riscv64?


No, drop entirely.

> +		return -ENODEV;
> +	}
> +
> +	// FPD domain
> +	config->fpd.opt_val = 0;
> +	if (of_property_read_bool(np, "fpd_afifs1_enable"))
> +		config->fpd.opt_val |= FPD_ATB_AFIFS1_MASK;
> +	if (of_property_read_bool(np, "fpd_afifs0_enable"))
> +		config->fpd.opt_val |= FPD_ATB_AFIFS0_MASK;
> +	if (of_property_read_bool(np, "fpd_fpds_enable"))
> +		config->fpd.opt_val |= FPD_ATB_FPDS_MASK;
> +

...

> +
> +/**
> + * atb_domain_setup - Setup ATB in a domain
> + * @cfg: Pointer to ATB domain configuration
> + * @pdev: Pointer to platform device
> + * @base: Base address of the ATB domain
> + * @irq: IRQ number
> + * @domain_name: Domain name
> + * @irq_name: IRQ name
> + * @return: 0 on success, otherwise error code
> + */
> +static int atb_domain_setup(struct atb_domain_config *cfg,
> +			    struct platform_device *pdev, uintptr_t base,
> +			    int irq, const char *domain_name,
> +			    const char *irq_name)
> +{
> +	struct device *dev = &pdev->dev;
> +
> +	// get physical address
> +	cfg->base = devm_ioremap(dev, base, SZ_64);

No, you do not have MMIO. Just look at the binding.

> +	if (!cfg->base) {
> +		dev_err(dev, "failed to map %s base address", domain_name);
> +		return -1;
> +	}
> +
> +	// map IRQ
> +	irq = map_irq(dev, irq);

Look at the binding: you do not have interrupts.

> +	if (irq <= 0) {
> +		dev_err(dev, "failed to map ATB %s IRQ", domain_name);
> +		return -2;
> +	}
> +	cfg->irq = irq;
> +
> +	// request IRQ
> +	if (devm_request_irq(dev, irq, irq_handler, IRQF_SHARED, irq_name,
> +			     pdev)) {
> +		dev_err(dev, "failed to request ATB %s IRQ.", domain_name);
> +		return -3;
> +	}
> +
> +	// disable ATB for configuration
> +	atb_write(cfg, 0x0, ATB_RESP_EN_REG);
> +
> +	// response type: ATB returns 'SLVERR' on timeout
> +	// which results in app 'bus fault'
> +	atb_write(cfg, cfg->opt_val, ATB_RESP_TYPE_REG);
> +	atb_write(cfg, cfg->opt_val, ATB_CMD_STORE_EN_REG);
> +
> +	// timeout prescaler: 16b - enable, 15:0b - prescaler value
> +	// based on 100 MHz clock
> +	atb_write(cfg, (ATB_PRESCALER_EN_MASK + ATB_PRESCALER_TIMEOUT_VAL),
> +		  ATB_PRESCALE_REG);
> +
> +	// clear interrupt flags
> +	atb_write(cfg, cfg->opt_val, ERR_ATB_ISR_REG);
> +
> +	// enable selected interrupts
> +	atb_write(cfg, cfg->opt_val, ERR_ATB_IER_REG);
> +
> +	// enable ATB
> +	atb_write(cfg, cfg->opt_val, ATB_RESP_EN_REG);
> +
> +	cfg->init = true;
> +
> +	return 0;
> +}
> +
> +/**
> + * atb_probe - Probe function for the driver
> + * @pdev: Pointer to platform device
> + * @return: 0 on success, otherwise error code
> + */
> +static int atb_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	struct atb_config *config;
> +	struct device *dev = &pdev->dev;
> +
> +	config = devm_kzalloc(dev, sizeof(*config), GFP_KERNEL);
> +	if (!config)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, config);
> +
> +	// read DTS config
> +	ret = read_dts(dev, config);
> +	if (ret) {
> +		dev_err(dev, "failed to read DTS: %d", ret);
> +		goto err;
> +	}
> +
> +	// configure FPD
> +	ret = atb_domain_setup(&config->fpd, pdev, FPD_SLCR_ATB_BASE_ADDR,
> +			       IRQ_ZYNQMP_GIC_ATB_FPD, "FPD", "atb_fpd_irq");
> +	if (ret) {
> +		dev_err(dev, "failed to setup FPD domain: %d", ret);
> +		goto err;
> +	} else {
> +		dev_info(dev, "ATB FPD configured");
> +	}
> +
> +	// configure LPD
> +	ret = atb_domain_setup(&config->lpd, pdev, LPD_SLCR_ATB_BASE_ADDR,
> +			       IRQ_ZYNQMP_GIC_ATB_LPD, "LPD", "atb_lpd_irq");
> +	if (ret) {
> +		dev_err(dev, "failed to setup LPD domain: %d", ret);
> +		goto err_fpd;
> +	} else {
> +		dev_info(dev, "ATB LPD configured");

Drop all of such, drivers should be silent on success. See Linux coding
style.

> +	}
> +
> +	return 0;
> +
> +err_fpd:
> +	if (config->fpd.init)
> +		atb_write(&config->fpd, 0x0, ATB_RESP_EN_REG);
> +err:
> +	return -EFAULT;
> +}
> +
> +/**
> + * atb_remove - Remove function for the driver
> + * @pdev: Pointer to platform device
> + * @return: 0 on success, otherwise error code
> + */
> +static int atb_remove(struct platform_device *pdev)
> +{
> +	int val, reg;
> +	struct device *dev = &pdev->dev;
> +	struct atb_config *config = platform_get_drvdata(pdev);
> +
> +	if (!config) {
> +		dev_err(dev, "config is NULL in remove");
> +		return -EFAULT;
> +	}
> +
> +	// disable ATB
> +	if (config->fpd.init) {
> +		val = config->fpd.opt_val;
> +		reg = atb_read(&config->fpd, ATB_RESP_EN_REG);
> +		val &= ~reg;
> +		atb_write(&config->fpd, val, ATB_RESP_EN_REG);
> +	}
> +	if (config->lpd.init) {
> +		val = config->lpd.opt_val;
> +		reg = atb_read(&config->lpd, ATB_RESP_EN_REG);
> +		val &= ~reg;
> +		atb_write(&config->lpd, val, ATB_RESP_EN_REG);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id atb_of_match[] = {
> +	{
> +		.compatible = "xlnx,zynqmp-atb",
> +	},
> +	{},
> +};
> +
> +static struct platform_driver atb_driver = {
> +	.probe = atb_probe,
> +	.remove = atb_remove,
> +	.driver = {
> +		.name = MOD_NAME,
> +		.of_match_table = atb_of_match,
> +	},
> +};
> +
> +static int __init atb_early_init(void)
> +{
> +	return platform_driver_register(&atb_driver);
> +}
> +
> +arch_initcall(atb_early_init);

Don't order initcalls. That's not arch. This is supposed to be driver.


Best regards,
Krzysztof

