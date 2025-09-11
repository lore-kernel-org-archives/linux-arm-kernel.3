Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C15CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 03:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixyFk/mPVbulQ4uqtT21qMKNSvDLRazah5rKk0kSLi4=; b=pYjUmJ9qBGy/XZcNKtmm+NuLoV
	vFA5ijS9WMP2t76qEILpeYUKvl1goQG8XJ5qhp4A4z5wQa5V333Zay18Id7Iyzio3rFyDXgDhgoDd
	1en0LUgX4PgLnQnDFPY8q4tBW/kS+7frkeopk4/UbBjX2k9GhojC+sjmPqfzYIRLcAcKddKWwCvoJ
	e1vmd2Ifizi8WhUK3BM9Rysw+UjUFL5F7F2cCBAmZfXR6bF0SX4RfQYP6wvSyPHU5PaL6kBhRaFbI
	YEkTcPd45Pp4kqCwEYx8MBAYheHbavpMYAwAAdHJ9sXEaCcCm4x5g9DgzUBR2kZNiT+DA7l5nP+HL
	rnxfciEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwXmt-00000000Y9e-3P1P;
	Thu, 11 Sep 2025 03:15:55 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwXmq-00000000Y8X-3om4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 03:15:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ixyFk/mPVbulQ4uqtT21qMKNSvDLRazah5rKk0kSLi4=;
	b=Iu2+ar6fQlNutZuCJkF+3sJZ2IgG3mhmq63+GEblQ0bld8heODl7TTuf66RQoB
	HCTuHMqeLq4UapcHboJSS/CJoGzyOFIlqOBW4FsvgIoWOcxsXzsCD683Ho7Lawyg
	6FIZIzzgLL5DvfGg4OOpWbx/6Ht5StLH5S/LMhtnHtRYw=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDnl8rVPsJoQ0FPBA--.49162S3;
	Thu, 11 Sep 2025 11:15:35 +0800 (CST)
Date: Thu, 11 Sep 2025 11:15:33 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add initial device tree
 for TQMa91xx/MBa91xxCA
Message-ID: <aMI-1QVqrQeG75y6@dragon>
References: <20250901100432.139163-1-alexander.stein@ew.tq-group.com>
 <20250901100432.139163-3-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901100432.139163-3-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Mc8vCgDnl8rVPsJoQ0FPBA--.49162S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFy5ZFy7CFW8AryxGrW3ZFb_yoW5ZF1Dp3
	WkCrZ5WrWfGFyxur9Iqw40gr98Jw4rJayDuryYgFW7KrZ5uryftwn8Krs3WryxXw4rX3yU
	WFn3ZrnxAF15WaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UZ189UUUUU=
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwXFZWjCG0lVNgABs0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_201553_267954_5B8198DC 
X-CRM114-Status: GOOD (  19.24  )
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

On Mon, Sep 01, 2025 at 12:04:30PM +0200, Alexander Stein wrote:
> This adds support for TQMa91xx module attached to MBa91xxCA board.
> TQMa91xx is a SOM series using i.MX91 SOC. The SOM features PMIC, RAM,
> e-MMC and some optional peripherals like SPI-NOR, RTC, EEPROM,
> gyroscope and secure element.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * TQMa91xx series includes both CA & LA variant (socket & LGA)
>   adjust commit message accordingly
> * Use JTAG pinctrl by GPIO controller
> * Rename DT node name 'imu' to 'accelerometer'
> 
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../freescale/imx91-tqma9131-mba91xxca.dts    | 739 ++++++++++++++++++
>  .../boot/dts/freescale/imx91-tqma9131.dtsi    | 295 +++++++
>  3 files changed, 1035 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 947de7f125caf..3a937232d6f29 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -338,6 +338,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
>  
>  imx93-9x9-qsb-i3c-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-i3c.dtbo
> diff --git a/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts b/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts
> new file mode 100644
> index 0000000000000..d9e471e00d760
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts
> @@ -0,0 +1,739 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright (c) 2022-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Markus Niebel
> + * Author: Alexander Stein
> + */
> +/dts-v1/;
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/net/ti-dp83867.h>
> +#include <dt-bindings/pwm/pwm.h>
> +#include <dt-bindings/usb/pd.h>
> +#include "imx91-tqma9131.dtsi"
> +
> +/{
> +	model = "TQ-Systems i.MX91 TQMa91xxLA/TQMa91xxCA on MBa91xxCA starter kit";
> +	compatible = "tq,imx91-tqma9131-mba91xxca", "tq,imx91-tqma9131", "fsl,imx91";
> +	chassis-type = "embedded";
> +
> +	chosen {
> +		stdout-path = &lpuart1;
> +	};
> +
> +	aliases {
> +		eeprom0 = &eeprom0;
> +		ethernet0 = &eqos;
> +		ethernet1 = &fec;
> +		gpio0 = &gpio1;
> +		gpio1 = &gpio2;
> +		gpio2 = &gpio3;
> +		gpio3 = &gpio4;
> +		i2c0 = &lpi2c1;
> +		i2c1 = &lpi2c2;
> +		i2c2 = &lpi2c3;
> +		mmc0 = &usdhc1;
> +		mmc1 = &usdhc2;
> +		rtc0 = &pcf85063;
> +		rtc1 = &bbnsm_rtc;
> +		serial0 = &lpuart1;
> +		serial1 = &lpuart2;

serial should go before rtc right?  I fixed it up and applied both
patches.

Shawn


