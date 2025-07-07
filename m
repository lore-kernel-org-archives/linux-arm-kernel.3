Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7E4C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 09:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+1DDYoaS1Ipu12iZO8xaUeU/BSiLpWZ922LTtPQMUc=; b=WGtRZKjrelzQqj5z3uxH1qJSbo
	UHBWeJsOXh8ns4Kiyr4jqjJdMTI/QmGsvYdGwyTkFuDt6LqNBbHL16cIAksW4M7c5aitPURXeRaOj
	V1ne4zGqlb62Mvk5B28qqX6fk3dN8BdYkzG8P6yw6BcLfs/NmX/cxzsqea9xVMcckHkgZFdgCjOpU
	s9sYpC8KIdplAMG679NsyFZk88QQGk8LTZdsZ8sT6RheLt0qwbIxI2ynMU4lx0haLl6DqBzkjl7qQ
	lPDahM7g4iByTMRjamypvz8RZ20wew+8K1BXWj9OzoiYZstgMaK6UFAGMzh8CxusumbvpGNtp8tal
	iIBWt+7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYi8V-00000001yvM-3yKN;
	Mon, 07 Jul 2025 09:27:43 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhT4-00000001spY-3CZ6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 08:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=h+1DDYoaS1Ipu12iZO8xaUeU/BSiLpWZ922LTtPQMUc=;
	b=Am+AuqQX1OzceuAS0C6wsFLQ1oe+IZyfkfmO9eBiqI7vCsFbRp6lSPeip4n/rL
	XzoJsG3nF+eO7bifCsGdYTwKSdeTwVEAl05kGBQFqEFHzTDv0qjEkIy6kI45QEE4
	xnXI6xZZ1Yp7gEDIG4Da5MhwJHWtpaKpfgSY7n1XmbPco=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgB3xsP6iGtoPxw9AA--.22655S3;
	Mon, 07 Jul 2025 16:44:44 +0800 (CST)
Date: Mon, 7 Jul 2025 16:44:42 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: imx: add dts for the imx8ulp evk9
 board
Message-ID: <aGuI-i5bI7lHsFjP@dragon>
References: <20250701002239.972090-1-laurentiumihalcea111@gmail.com>
 <20250701002239.972090-3-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701002239.972090-3-laurentiumihalcea111@gmail.com>
X-CM-TRANSID: Mc8vCgB3xsP6iGtoPxw9AA--.22655S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxXrWkJrW5tr1kWF13Xry5Jwb_yoW5Zw4fp3
	Z7Cw45Wws2gr9rtrZIq3Z2qF98Gws3CrnruasI9ry8tr15u343tr48trs3Gw13uwsxA3y7
	CFWqqrnrCrs8Gw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UivtAUUUUU=
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIBxWu2hriPzw3QAA3L
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_014455_162975_8127C03B 
X-CRM114-Status: GOOD (  16.12  )
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

On Mon, Jun 30, 2025 at 08:22:39PM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add DTS for the i.MX8ULP EVK9 board.

Could you highlight the major differences from i.MX8ULP EVK board in the
commit log?

Shawn

> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |  1 +
>  .../boot/dts/freescale/imx8ulp-9x9-evk.dts    | 69 +++++++++++++++++++
>  2 files changed, 70 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 4da7501ece17..4b288b324d38 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -322,6 +322,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
>  
>  imx93-9x9-qsb-i3c-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-i3c.dtbo
> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
> new file mode 100644
> index 000000000000..5497e3d78136
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include "imx8ulp-evk.dts"
> +
> +/ {
> +	model = "NXP i.MX8ULP EVK9";
> +	compatible = "fsl,imx8ulp-9x9-evk", "fsl,imx8ulp";
> +};
> +
> +&btcpu {
> +	sound-dai = <&sai6>;
> +};
> +
> +&iomuxc1 {
> +	pinctrl_sai6: sai6grp {
> +		fsl,pins = <
> +			MX8ULP_PAD_PTE10__I2S6_TX_BCLK  0x43
> +			MX8ULP_PAD_PTE11__I2S6_TX_FS    0x43
> +			MX8ULP_PAD_PTE14__I2S6_TXD2     0x43
> +			MX8ULP_PAD_PTE6__I2S6_RXD0      0x43
> +		>;
> +	};
> +};
> +
> +&pinctrl_enet {
> +	fsl,pins = <
> +		MX8ULP_PAD_PTF9__ENET0_MDC		0x43
> +		MX8ULP_PAD_PTF8__ENET0_MDIO             0x43
> +		MX8ULP_PAD_PTF5__ENET0_RXER             0x43
> +		MX8ULP_PAD_PTF6__ENET0_CRS_DV           0x43
> +		MX8ULP_PAD_PTF1__ENET0_RXD0             0x43
> +		MX8ULP_PAD_PTF0__ENET0_RXD1             0x43
> +		MX8ULP_PAD_PTF4__ENET0_TXEN             0x43
> +		MX8ULP_PAD_PTF3__ENET0_TXD0             0x43
> +		MX8ULP_PAD_PTF2__ENET0_TXD1             0x43
> +		MX8ULP_PAD_PTF7__ENET0_REFCLK           0x43
> +		MX8ULP_PAD_PTF10__ENET0_1588_CLKIN      0x43
> +	>;
> +};
> +
> +&pinctrl_usb1 {
> +	fsl,pins = <
> +		MX8ULP_PAD_PTE16__USB0_ID		0x10003
> +		MX8ULP_PAD_PTE18__USB0_OC		0x10003
> +	>;
> +};
> +
> +&pinctrl_usb2 {
> +	fsl,pins = <
> +		MX8ULP_PAD_PTD23__USB1_ID		0x10003
> +		MX8ULP_PAD_PTE20__USB1_OC		0x10003
> +	>;
> +};
> +
> +&sai6 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&pinctrl_sai6>;
> +	pinctrl-1 = <&pinctrl_sai6>;
> +	assigned-clocks = <&cgc1 IMX8ULP_CLK_SPLL3_PFD1_DIV1>, <&cgc2 IMX8ULP_CLK_SAI6_SEL>;
> +	assigned-clock-parents = <0>, <&cgc1 IMX8ULP_CLK_SPLL3_PFD1_DIV1>;
> +	assigned-clock-rates = <12288000>;
> +	fsl,dataline = <1 0x01 0x04>;
> +	status = "okay";
> +};
> -- 
> 2.34.1
> 


