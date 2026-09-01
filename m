Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167EBC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 07:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SusLD2LJRuGl/EM1pa68AofUX9dK45Px9vTM6WPxfNY=; b=B6JP8L271GiN4j7PmRAIOczb7C
	v9Mj8iICgLL4u3BEpHioL15YaoNhdutz9u1p4Tn4p1T5d4TX+DoiAmvyXKgAep/pWBEwpQ844oPwk
	yz5daYptI2IsrnLbrZ5NPD5YLHXGYmKD49Bbq6yhvpeAPfEukEodZHI/sBZ5XMSM4pub6FCl5Oj0s
	OqtGJrY2HQ7fVBRrNWhvhrGBx+sfzCr9z14jeb8KGtiVXiH0pbpbeRepebTIsDBcYC1j+hsYOeWfo
	ZN/qr7/P0IrrW1QRaNQzYjihWeP5H7exk3WFgrFs5HeFSGQMcEZuC6mtPh+qBeqhVu5xB+CFDzc4X
	FoYD3IiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Iwe-0000000B8Lr-1ZBx;
	Tue, 01 Sep 2026 07:30:12 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Iwa-0000000B8Kx-3e8u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 07:30:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3E5E11A192B;
	Tue,  1 Sep 2026 07:30:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0672C6053C;
	Tue,  1 Sep 2026 07:30:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 50EAE11C78C5E;
	Tue,  1 Sep 2026 09:29:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788247800; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=SusLD2LJRuGl/EM1pa68AofUX9dK45Px9vTM6WPxfNY=;
	b=ju3mnYyBlBA49ik61v0qwK2BAK3AnHW/nkCQh90vS7pobAOCGmGw9xiqTnGWGYYQ0FMBIv
	RTpke5CvTPKds58wsCQoj9GKc8kVwZ6/663+Mivtjnz5LtY2vibecJb8eehBNIjtwu6xbi
	H2V0V8rR85Rn/m026MnSngUolJviOnv1Qm68oNxXXIwe8C9ZZO+o424C7RVNjfyGMk8Njv
	WDCrrfT/yv8CBww/KsPoPxqkQnYD908ulBdv5Q8qXrwneiXuF7DNEjL3HHh8wtttq+xLHD
	zw3fm4nfZArVvDWExfLZlV6FckehdnWcLsiJeuC3K/FK31mCa5vaCIdJ/UpG/g==
Message-ID: <49620860-9bd5-48fb-bbaf-55da377e9018@bootlin.com>
Date: Tue, 1 Sep 2026 09:29:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/3] net: stmmac: Add UltraRISC DP1000 GMAC
 support
To: Jia Wang <wangjia@ultrarisc.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260901-dwmac-ultrarisc-v1-0-f19454814bcf@ultrarisc.com>
 <20260901-dwmac-ultrarisc-v1-3-f19454814bcf@ultrarisc.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260901-dwmac-ultrarisc-v1-3-f19454814bcf@ultrarisc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_003009_076988_5191FECA 
X-CRM114-Status: GOOD (  28.61  )
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

Hello,

On 9/1/26 03:27, Jia Wang wrote:
> The DP1000 GMAC integration provides fixed TX and RX RGMII clock delays
> that cannot be disabled. For boards without PCB delays, "rgmii-id"
> describes the link, but passing that mode unchanged to the PHY would enable
> a second set of delays.
> 
> Use phy_fix_phy_mode_for_mac_delays() to translate "rgmii-id" to "rgmii"
> before attaching the PHY. Reject other RGMII modes because the fixed MAC
> delays cannot be combined with them without duplicating or omitting a
> delay.
> 
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>

Simple enough, this is nice :)

One thing, I'm going to start requiring this for new glue drivers, can you give
the output of "ethtool -t eth0" on your device with this new glue driver ?

You'll have to enable CONFIG_STMMAC_SELFTESTS

As this is is a 5.20, I'm expecting you'll get something like :

 1. MAC Loopback                 0
 2. MMC Counters                 0
 3. EEE                          -95
 4. Hash Filter MC               0
 5. Perfect Filter UC            0
 6. MC Filter                    0
 7. UC Filter                    0
 8. Flow Control                 -95
 9. RSS                          -95
10. VLAN Filtering               -110
11. VLAN Filtering (perf)        -110
12. Double VLAN Filter           -110
13. Double VLAN Filter (perf)    -110
14. Flexible RX Parser           -95
15. SA Insertion (desc)          0
16. SA Replacement (desc)        0
17. SA Insertion (reg)           0
18. SA Replacement (reg)         0
19. VLAN TX Insertion            -110
20. SVLAN TX Insertion           -95
21. L3 DA Filtering              -95
22. L3 SA Filtering              -95
23. L4 DA TCP Filtering          -95
24. L4 SA TCP Filtering          -95
25. L4 DA UDP Filtering          -95
26. L4 SA UDP Filtering          -95
27. ARP Offload                  -110
28. Jumbo Frame                  0
29. Multichannel Jumbo           -95
30. Split Header                 -95
31. TBS (ETF Scheduler)          -95

-95 (-EOPNOTSUP) and 0 are OK, watch for any other values.

If ARP Offload and any VLAN selftest (insertion and filtering), this is a known
issue and you can ignore :)

Maxime


> ---
>  MAINTAINERS                                        |  1 +
>  drivers/net/ethernet/stmicro/stmmac/Kconfig        | 11 +++++
>  drivers/net/ethernet/stmicro/stmmac/Makefile       |  1 +
>  .../net/ethernet/stmicro/stmmac/dwmac-ultrarisc.c  | 54 ++++++++++++++++++++++
>  4 files changed, 67 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3b96ff0734e6..aacbab369b51 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28008,6 +28008,7 @@ ULTRARISC DP1000 DWMAC GLUE LAYER
>  M:	Jia Wang <wangjia@ultrarisc.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/net/ultrarisc,dp1000-gmac.yaml
> +F:	drivers/net/ethernet/stmicro/stmmac/dwmac-ultrarisc.c
>  
>  ULTRARISC DP1000 PINCTRL DRIVER
>  M:	Jia Wang <wangjia@ultrarisc.com>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index e3dd5adda5ac..ab3c4cf96423 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -319,6 +319,17 @@ config DWMAC_THEAD
>  	  the stmmac device driver. This driver is used for T-HEAD TH1520
>  	  ethernet controller.
>  
> +config DWMAC_ULTRARISC
> +	tristate "UltraRISC DWMAC support"
> +	default ARCH_ULTRARISC
> +	depends on OF && (ARCH_ULTRARISC || COMPILE_TEST)
> +	help
> +	  Support for the Ethernet controller on the UltraRISC DP1000 SoC.
> +
> +	  This selects the UltraRISC platform specific glue layer support
> +	  for the stmmac device driver. This driver is used for the DP1000
> +	  GMAC Ethernet controller.
> +
>  config DWMAC_IMX8
>  	tristate "NXP IMX8 DWMAC support"
>  	default ARCH_MXC
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> index a1cea2f57252..b16a456b730e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_DWMAC_SUNXI)	+= dwmac-sunxi.o
>  obj-$(CONFIG_DWMAC_SUN8I)	+= dwmac-sun8i.o
>  obj-$(CONFIG_DWMAC_SUN55I)	+= dwmac-sun55i.o
>  obj-$(CONFIG_DWMAC_THEAD)	+= dwmac-thead.o
> +obj-$(CONFIG_DWMAC_ULTRARISC)	+= dwmac-ultrarisc.o
>  obj-$(CONFIG_DWMAC_DWC_QOS_ETH)	+= dwmac-dwc-qos-eth.o
>  obj-$(CONFIG_DWMAC_INTEL_PLAT)	+= dwmac-intel-plat.o
>  obj-$(CONFIG_DWMAC_LOONGSON1)	+= dwmac-loongson1.o
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ultrarisc.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ultrarisc.c
> new file mode 100644
> index 000000000000..4bdda2665338
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ultrarisc.c
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * UltraRISC DWMAC platform driver
> + *
> + * Copyright (C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/phy.h>
> +#include <linux/platform_device.h>
> +
> +#include "stmmac_platform.h"
> +
> +static int ultrarisc_dwmac_probe(struct platform_device *pdev)
> +{
> +	struct plat_stmmacenet_data *plat_dat;
> +	struct stmmac_resources stmmac_res;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get resources\n");
> +
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	if (IS_ERR(plat_dat))
> +		return dev_err_probe(dev, PTR_ERR(plat_dat), "failed to parse DT parameters\n");
> +
> +	plat_dat->phy_interface =
> +		phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface, true, true);
> +	if (plat_dat->phy_interface == PHY_INTERFACE_MODE_NA)
> +		return dev_err_probe(dev, -EINVAL, "unsupported phy interface mode\n");
> +
> +	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
> +}
> +
> +static const struct of_device_id ultrarisc_dwmac_match[] = {
> +	{ .compatible = "ultrarisc,dp1000-gmac" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ultrarisc_dwmac_match);
> +
> +static struct platform_driver ultrarisc_dwmac_driver = {
> +	.probe = ultrarisc_dwmac_probe,
> +	.driver = {
> +		.name = "ultrarisc-dwmac",
> +		.pm = &stmmac_pltfr_pm_ops,
> +		.of_match_table = ultrarisc_dwmac_match,
> +	},
> +};
> +module_platform_driver(ultrarisc_dwmac_driver);
> +
> +MODULE_DESCRIPTION("UltraRISC DWMAC platform driver");
> +MODULE_LICENSE("GPL");
> 


